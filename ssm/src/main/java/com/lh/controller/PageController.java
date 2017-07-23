package com.lh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	@RequestMapping("/blogs")
	public String showPage() {
		return "login";

	}

	// 去用户主页面
	@RequestMapping("/toMain")
	public String toIndex() {
		return "home";
	}

	// 去注册页面
	@RequestMapping("/toRegister")
	public String toRegister() {
		return "register";
	}

	// 去登录页面
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "login";
	}

	// 去更新页面
	@RequestMapping("/toUpdateUser")
	public String toUpdateUser() {
		return "updateUser";
	}

	// 去后台更新类别页面
	@RequestMapping("/toAdminBlogType")
	public String toAdminBlogType() {
		return "adminBlogType";
	}

	// 去写博客页面
	@RequestMapping("/toWriter")
	public String toWriter() {
		return "writerBlog";
	}
}
