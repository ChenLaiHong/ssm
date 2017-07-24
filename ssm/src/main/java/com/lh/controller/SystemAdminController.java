package com.lh.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.lh.bean.Type;
import com.lh.service.BlogTypeService;
import com.lh.utils.ResponseUtil;

@Controller
@RequestMapping("/admin/system")
public class SystemAdminController {
	@Autowired
	BlogTypeService blogTypeService;

	@RequestMapping("/refreshSystem")
	public String refreshSystem(HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		ServletContext application = RequestContextUtils
				.getWebApplicationContext(request).getServletContext();

		List<Type> blogTypeCountList = blogTypeService.countList(); // 查询博客类别以及博客的数量
		application.setAttribute("blogTypeCountList", blogTypeCountList);

		JSONObject result = new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

}
