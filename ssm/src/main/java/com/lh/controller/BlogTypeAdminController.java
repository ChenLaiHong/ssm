package com.lh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lh.bean.Type;
import com.lh.service.BlogTypeService;

@Controller
@RequestMapping("/admin/blogType")
public class BlogTypeAdminController {
	@Autowired
	BlogTypeService blogTypeService;

	@RequestMapping("/list")
	public String list() {

		List<Type> typeList = blogTypeService.getAll();
		return "";
	}

}
