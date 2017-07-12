package com.lh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lh.bean.Blog;
import com.lh.dao.BlogMapper;

@Service
public class BlogService {

	@Autowired
	BlogMapper blogMapper;

	public List<Blog> getAll() {
		// TODO Auto-generated method stub
		return blogMapper.selectByExampleWithType(null);
	}

}
