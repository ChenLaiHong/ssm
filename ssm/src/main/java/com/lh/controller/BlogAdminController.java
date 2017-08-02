package com.lh.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lh.bean.Blog;
import com.lh.bean.PageBean;
import com.lh.service.BlogService;
import com.lh.service.CommentService;
import com.lh.utils.ResponseUtil;
import com.lh.utils.StringUtil;

@Controller
@RequestMapping("/adminBlog")
public class BlogAdminController {

	@Autowired
	BlogService blogService;

	@Autowired
	CommentService commentService;

	@RequestMapping("/articles/{bid}")
	public ModelAndView details(@PathVariable("bid") Integer bid,
			HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		Blog blog = blogService.findByBid(bid);
		String keyWords = blog.getKeyWord();
		if (StringUtil.isNotEmpty(keyWords)) {
			String arr[] = keyWords.split(" ");
			mav.addObject("keyWords",
					StringUtil.filterWhite(Arrays.asList(arr)));
		} else {
			mav.addObject("keyWords", null);
		}
		mav.addObject("blog", blog);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bid", blog.getBid());
		map.put("state", 1); // 查询审核通过的评论
		mav.addObject("commentList", commentService.list(map));
		// mav.addObject("mainPage", "adminBlog.jsp");
		mav.setViewName("adminBlog");
		return mav;
	}

	@RequestMapping("/list")
	public String list(
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "rows", required = false) String rows,
			Blog s_blog, HttpServletResponse response) throws Exception {
		PageBean pageBean = new PageBean(Integer.parseInt(page),
				Integer.parseInt(rows));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", StringUtil.formatLike(s_blog.getTitle()));
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Blog> blogList = blogService.list(map);
		Long total = blogService.getTotal(map);
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray = JSONArray.fromObject(blogList, jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
}
