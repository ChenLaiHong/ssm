package com.lh.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.lh.bean.Type;
import com.lh.service.BlogService;
import com.lh.service.BlogTypeService;
import com.lh.utils.DateUtil;
import com.lh.utils.ResponseUtil;

@Controller
@RequestMapping("/admin/blogType")
public class BlogTypeAdminController {
	@Autowired
	BlogTypeService blogTypeService;
	@Autowired
	private BlogService blogService;

	// 列表展示
	@RequestMapping("/list")
	public String list(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "rows", required = false) String rows,
			HttpServletResponse response) throws Exception {

		// PageHelper.startPage(pn, 5);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", 1);
		map.put("size", 10);
		List<Type> blogTypeList = blogTypeService.list(map);
		PageInfo page = new PageInfo(blogTypeList);
		Long total = page.getTotal();
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(blogTypeList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);

		return null;
	}

	// 保存和更新方法
	@RequestMapping("/save")
	public String save(@RequestParam("imageFile") MultipartFile imageFile,
			Type blogType, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int resultTotal = 0; // 操作的记录条数
		if (blogType.getTypeId() == null) {
			if (!imageFile.isEmpty()) {
				String filePath = request.getServletContext().getRealPath("/");
				String imageName = DateUtil.getCurrentDateStr() + "."
						+ imageFile.getOriginalFilename().split("\\.")[1];
				imageFile.transferTo(new File(filePath + "static/userImages/"
						+ imageName));
				blogType.setImageName(imageName);
			}
			resultTotal = blogTypeService.add(blogType);
			System.out.println("添加操作：" + resultTotal);
		} else {
			if (!imageFile.isEmpty()) {
				String filePath = request.getServletContext().getRealPath("/");
				String imageName = DateUtil.getCurrentDateStr() + "."
						+ imageFile.getOriginalFilename().split("\\.")[1];
				imageFile.transferTo(new File(filePath + "static/userImages/"
						+ imageName));
				blogType.setImageName(imageName);
			}
			resultTotal = blogTypeService.update(blogType);
		}
		JSONObject result = new JSONObject();
		if (resultTotal != 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("ids") String ids,
			HttpServletResponse response) throws Exception {
		String idsStr[] = ids.split(",");
		JSONObject result = new JSONObject();
		for (int i = 0; i < idsStr.length; i++) {
			if (blogService.getBlogByTypeId(Integer.parseInt(idsStr[i])) > 0) {
				result.put("exist", "博客类别下有博客，不能删除！");
			} else {
				blogTypeService.delete(Integer.parseInt(idsStr[i]));
			}
		}
		result.put("success", true);
		ResponseUtil.write(response, result);

		return null;
	}

}
