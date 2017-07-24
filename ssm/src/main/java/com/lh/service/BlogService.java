package com.lh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lh.bean.Blog;
import com.lh.dao.BlogMapper;

@Service
public class BlogService {

	@Autowired
	BlogMapper blogMapper;

	public int getBlogByTypeId(Integer typeId) {

		return blogMapper.getBlogByTypeId(typeId);
	}

	public int add(Blog blog) {

		return blogMapper.add(blog);
	}

}