package com.lh.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lh.bean.Blog;
import com.lh.bean.User;
import com.lh.lucene.BlogIndex;
import com.lh.service.BlogService;
import com.lh.service.BlogTypeService;
import com.lh.service.CommentService;
import com.lh.utils.ResponseUtil;
import com.lh.utils.StringUtil;

@Controller
@RequestMapping("/blog")
public class BlogController {
	@Autowired
	BlogService blogService;

	@Autowired
	CommentService commentService;

	@Autowired
	BlogTypeService blogTypeService;

	private BlogIndex blogIndex = new BlogIndex();

	// 保存新增的博客
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

	/**
	 * 请求博客详细信息
	 * 
	 * @return
	 * @throws Exception
	 */
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
		blog.setClickHit(blog.getClickHit() + 1); // 博客点击次数加1
		blogService.update(blog);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bid", blog.getBid());
		map.put("state", 1); // 查询审核通过的评论
		mav.addObject("commentList", commentService.list(map));
		// mav.addObject("mainPage", "onlyView.jsp");
		mav.setViewName("onlyView");
		return mav;
	}

}
