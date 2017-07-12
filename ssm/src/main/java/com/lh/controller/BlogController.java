package com.lh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.page.PageMethod;
import com.lh.bean.Blog;
import com.lh.service.BlogService;

//处理博客的增删改查
@Controller
public class BlogController {

	@Autowired
	BlogService blogService;

	// 分页查询博客
	@RequestMapping("/blogs")
	public String getBlogs(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {

		// pn页码 每页10条记录
		PageMethod.startPage(pn, 10);
		List<Blog> blogs = blogService.getAll();
		// 5表示连续显示5页的编码
		PageInfo page = new PageInfo(blogs, 5);
		model.addAttribute("pageInfo", page);

		return "register";
	}

}
