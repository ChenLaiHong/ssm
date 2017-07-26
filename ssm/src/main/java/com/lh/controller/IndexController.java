package com.lh.controller;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lh.bean.Blog;
import com.lh.bean.Type;
import com.lh.lucene.BlogIndex;
import com.lh.service.BlogService;
import com.lh.service.BlogTypeService;

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
	public String search(@RequestParam(value = "q", required = false) String q,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			Model model) throws Exception {

		List<Blog> blogList = blogIndex.searchBlog(q.trim());
		PageInfo page = new PageInfo(blogList, 5);// 页码连续两页显示
		model.addAttribute("searchResult", page);
		return "searchResult";
	}

}
