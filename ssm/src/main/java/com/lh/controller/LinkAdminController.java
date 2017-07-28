package com.lh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lh.bean.Link;
import com.lh.bean.PageBean;
import com.lh.service.LinkService;
import com.lh.utils.ResponseUtil;

@Controller
@RequestMapping("/admin/link")
public class LinkAdminController {

	@Autowired
	LinkService linkService;

	// 分页查询链接信息
	@RequestMapping("/list")
	public String list(
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows,
			HttpServletResponse response) throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page),
				Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Link> linkList = linkService.list(map);
		Long total = linkService.getTotal(map);
		JSONObject result = new JSONObject();
		JSONArray jsonArray = JSONArray.fromObject(linkList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}

	// 添加或修改链接信息
	@RequestMapping("/save")
	public String save(Link link, HttpServletResponse response)
			throws Exception {
		int resultTotal = 0; // 操作的记录条数
		if (link.getId() == null) {
			resultTotal = linkService.add(link);
		} else {
			resultTotal = linkService.update(link);
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

	// 删除链接信息
	@RequestMapping("/delete")
	public String delete(@RequestParam(value = "ids") String ids,
			HttpServletResponse response) throws Exception {
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			linkService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
