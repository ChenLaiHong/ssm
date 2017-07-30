package com.lh.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.jxls.reader.ReaderBuilder;
import net.sf.jxls.reader.XLSReader;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.lh.bean.Link;
import com.lh.bean.PageBean;
import com.lh.service.LinkService;
import com.lh.utils.ResponseUtil;
import com.lh.utils.StringUtil;
import com.sss.util.dateutil.TimeIdGenerator;

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

	// 导出
	@RequestMapping("/exportLink")
	public void export(HttpServletResponse response) throws Exception {
		InputStream is = linkService.getInputStream();
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("content-disposition",
				"attachment;filename=AllLinks.xls");
		ServletOutputStream output = response.getOutputStream();
		IOUtils.copy(is, output);
	}

	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public Map<String, String> read(HttpServletRequest request) {
		// Map<String ,String> result = new HashMap<String ,String>();
		Map<String, String> result = new HashMap<String, String>();
		// 1、转换文件上传的servlet
		MultipartHttpServletRequest msRequest = (MultipartHttpServletRequest) request;

		// 2、获取文件
		CommonsMultipartFile cFile = (CommonsMultipartFile) msRequest
				.getFile("link");
		// 3、判断文件是否是excel文件
		String origFileName = cFile.getOriginalFilename();
		if (StringUtils.isNotEmpty(origFileName)) {
			String suffix = origFileName.substring(origFileName
					.lastIndexOf("."));
			if (StringUtils.isNotEmpty(suffix)
					&& (suffix.equals(".xls") || suffix.equals(".xlsx"))) {
				// 4、上传文件
				String path = request.getSession().getServletContext()
						.getRealPath("/");// 获取绝对路径
				byte[] bfile = cFile.getBytes();
				String fileName = TimeIdGenerator.getTimeid().substring(0, 14)
						+ StringUtil.generateRandomString(4);
				InputStream inputXML = null;
				InputStream inputXLS = null;
				try {
					File readFile = new File(path + "/upload/" + fileName
							+ suffix);
					FileCopyUtils.copy(bfile, readFile);

					// 5、执行excel文件的读取
					String xmlConfig = path + "excel\\Link.xml";
					String dataXLS = path + "/upload/" + fileName + suffix;
					inputXML = new FileInputStream(xmlConfig);
					XLSReader mainReader = ReaderBuilder.buildFromXML(inputXML);
					inputXLS = new FileInputStream(dataXLS);
					List<Link> link = new ArrayList<Link>();
					Map<String, Object> beans = new HashMap<String, Object>();
					beans.put("Link", link);
					mainReader.read(inputXLS, beans);
					// 6、删除上传后的文件，这时候没有作用了
					File delFile = new File(dataXLS);
					if (delFile.exists() && delFile.isFile()) {
						delFile.delete();
					}
					int batchCount = link.size();
					if (batchCount == 0) {
						result.put("status", "fail");
						result.put("message", "不支持导入，数据为空！");
						// 不支持导入，数据为空！
					} else {
						// 查询所有的数据做对比
						Link temp = new Link();
						Link ins = new Link();
						List<Link> InfoMobleList = linkService.findLink();
						for (int i = 0; i < batchCount; i++) {

							ins = link.get(i);
							// 验证数据库中是否存在数据，若是存在就删除！
							for (int j = 0; j < InfoMobleList.size(); j++) {
								temp = InfoMobleList.get(j);
								if (temp.getId() != null) {
									if (temp.getId() == ins.getId()) {
										linkService.del(ins.getId());
									}
								}
							}

						}
					}
					// 7.验证通过，执行批量插入
					linkService.batchInsert(link);
					result.put("status", "ok");
					result.put("message", "批量导入成功！");

				} catch (Exception e) {
					result.put("status", "fail");
					result.put("message", "批量导入失败！");
				} finally {
					try {
						inputXML.close();
						inputXLS.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

			} else {
				result.put("status", "fail");
				result.put("message", "选择要批量导入的文件格式不对！");
				// 选择要批量导入的文件格式不对！

			}
		} else {
			result.put("status", "fail");
			result.put("message", "没有选择要批量导入的excel文件！ ");
		}

		return result;
	}
}
