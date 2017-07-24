package com.lh.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lh.bean.Blog;
import com.lh.bean.User;
import com.lh.lucene.BlogIndex;
import com.lh.service.BlogService;
import com.lh.utils.ResponseUtil;

@Controller
@RequestMapping("/blog")
public class BlogController {
	@Autowired
	BlogService blogService;

	private BlogIndex blogIndex = new BlogIndex();

	@RequestMapping("/save")
	public String save(Blog blog, HttpServletResponse response,
			HttpSession httpSession) throws Exception {
		int resultTotal = 0; // 操作的记录条数

		User user = (User) httpSession.getAttribute("currentUser");
		String author = user.getUname();
		blog.setAuthor(author);
		resultTotal = blogService.add(blog);
		blogIndex.addIndex(blog); // 添加博客索引

		JSONObject result = new JSONObject();
		if (resultTotal != 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

}
