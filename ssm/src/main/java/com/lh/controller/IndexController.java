package com.lh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lh.bean.Type;
import com.lh.service.BlogTypeService;

@Controller
public class IndexController {
	@Autowired
	BlogTypeService blogTypeService;

	@RequestMapping("/types")
	public String getAll(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		PageHelper.startPage(pn, 5);
		List<Type> types = blogTypeService.getAll();
		PageInfo page = new PageInfo(types, 2);
		model.addAttribute("pageInfo", page);
		return "index1";
	}

}
