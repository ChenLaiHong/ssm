package com.lh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lh.bean.Blog;
import com.lh.bean.Type;
import com.lh.lucene.BlogIndex;
import com.lh.service.BlogService;
import com.lh.service.BlogTypeService;
import com.lh.utils.StringUtil;

@Controller
public class IndexController {
	@Autowired
	BlogTypeService blogTypeService;

	@Autowired
	BlogService blogService;

	// 博客索引
	private BlogIndex blogIndex = new BlogIndex();

	// 一进入主页便去查找类型进行显示
	@RequestMapping("/types")
	public String getAll(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) {
		PageHelper.startPage(pn, 5);// 每页5条数据
		List<Type> types = blogTypeService.getAll();
		PageInfo page = new PageInfo(types, 2);// 页码连续两页显示
		model.addAttribute("pageInfo", page);
		return "index1";
	}

	@RequestMapping("/blogList")
	public String getBlog(
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "typeId", required = false) Integer typeId,
			Model model) {
		PageHelper.startPage(pn, 5);// 每页5条数据
		List<Blog> blogs = blogService.getAllBlog(typeId);
		for (Blog blog : blogs) {
			List<String> imagesList = blog.getImagesList();
			String blogInfo = blog.getContent();
			Document doc = Jsoup.parse(blogInfo);
			Elements jpgs = doc.select("img[src$=.jpg]"); // 　查找扩展名是jpg的图片
			for (int i = 0; i < jpgs.size(); i++) {
				Element jpg = jpgs.get(i);
				imagesList.add(jpg.toString());
				if (i == 2) {
					break;
				}
			}
		}
		PageInfo page = new PageInfo(blogs, 2);// 页码连续两页显示
		model.addAttribute("pageInfom", page);
		model.addAttribute("typeId", typeId);
		return "list";
	}

	// 搜索
	@RequestMapping("/q")
	public ModelAndView search(
			@RequestParam(value = "q", required = false) String q,
			@RequestParam(value = "page", required = false) String page,
			HttpServletRequest request) throws Exception {
		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		ModelAndView mav = new ModelAndView();
		List<Blog> blogList = blogIndex.searchBlog(q.trim());
		Integer toIndex = blogList.size() >= Integer.parseInt(page) * 10 ? Integer
				.parseInt(page) * 10 : blogList.size();
		mav.addObject("blogList",
				blogList.subList((Integer.parseInt(page) - 1) * 10, toIndex));
		mav.addObject("pageCode", this.genUpAndDownPageCode(Integer
				.parseInt(page), blogList.size(), q, 10, request
				.getServletContext().getContextPath()));
		mav.addObject("q", q);
		mav.addObject("resultTotal", blogList.size());
		mav.setViewName("searchResult");
		return mav;
	}

	private String genUpAndDownPageCode(Integer page, Integer totalNum,
			String q, Integer pageSize, String projectContext) {
		long totalPage = totalNum % pageSize == 0 ? totalNum / pageSize
				: totalNum / pageSize + 1;
		StringBuffer pageCode = new StringBuffer();
		if (totalPage == 0) {
			return "";
		} else {
			pageCode.append("<nav>");
			pageCode.append("<ul class='pager' >");
			if (page > 1) {
				pageCode.append("<li><a href='" + projectContext
						+ "/blog/q.do?page=" + (page - 1) + "&q=" + q
						+ "'>上一页</a></li>");
			} else {
				pageCode.append("<li class='disabled'><a href='#'>上一页</a></li>");
			}
			if (page < totalPage) {
				pageCode.append("<li><a href='" + projectContext
						+ "/blog/q.do?page=" + (page + 1) + "&q=" + q
						+ "'>下一页</a></li>");
			} else {
				pageCode.append("<li class='disabled'><a href='#'>下一页</a></li>");
			}
			pageCode.append("</ul>");
			pageCode.append("</nav>");
		}
		return pageCode.toString();
	}

}
