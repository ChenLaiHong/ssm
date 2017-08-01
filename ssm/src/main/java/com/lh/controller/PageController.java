package com.lh.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lh.bean.Blog;
import com.lh.bean.Link;
import com.lh.bean.Type;
import com.lh.bean.User;
import com.lh.service.BlogService;
import com.lh.service.BlogTypeService;
import com.lh.service.LinkService;

@Controller
public class PageController {
	@Autowired
	BlogTypeService blogTypeService;

	@Autowired
	BlogService blogService;

	@Autowired
	LinkService linkService;

	@RequestMapping("/blogs")
	public String showPage() {
		return "login";

	}

	// 去用户主页面
	@RequestMapping("/toMain")
	public String toIndex(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			HttpSession httpSession, Model model) {
		User user = (User) httpSession.getAttribute("currentUser");
		String uname = user.getUname();
		PageHelper.startPage(pn, 2);// 每页5条数据

		List<Blog> selfBlogs = blogService.getAll(uname);
		PageInfo page = new PageInfo(selfBlogs, 2);
		model.addAttribute("selfBlogs", page);
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

	@RequestMapping("/toAdminLink")
	public String toAdminLink() {
		return "adminLink";
	}

	@RequestMapping("/toAdminUser")
	public String toAdminUser() {
		return "adminUser";
	}

	@RequestMapping("/toAdminComment")
	public String toAdminComment() {
		return "adminComment";
	}

	@RequestMapping("/toAdminCommentRead")
	public String toAdminCommentRead() {
		return "adminCommentRead";
	}

	@RequestMapping("/toEmail")
	public String toEmail() {
		return "send_email";
	}

	// 去写博客页面
	@RequestMapping("/toWriter")
	public String toWriter(Model model) {

		List<Type> types = blogTypeService.getAll();
		PageInfo page = new PageInfo(types);
		model.addAttribute("pageInfo", page);
		return "writerBlog";

	}

	// 去修改密码页面
	@RequestMapping("/toUpdatePass")
	public String toUpdatePass() {
		return "updatePass";
	}

	// 去链接页面
	@RequestMapping("/toLink")
	public String toLink(Model model) {

		List<Link> links = linkService.getAll();
		PageInfo page = new PageInfo(links);// 页码连续两页显示
		model.addAttribute("linkList", page);
		return "link";
	}
}