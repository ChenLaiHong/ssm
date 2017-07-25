package com.lh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lh.bean.Blog;
import com.lh.bean.BlogExample;
import com.lh.bean.BlogExample.Criteria;
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

	public List<Blog> getAllBlog(Integer typeId) {

		BlogExample example = new BlogExample();
		Criteria criteria = example.createCriteria();
		criteria.andTypeidEqualTo(typeId);

		return blogMapper.selectByExample(example);
	}

}
