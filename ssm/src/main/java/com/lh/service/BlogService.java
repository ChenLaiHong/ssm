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

	// 添加博客
	public int add(Blog blog) {

		return blogMapper.add(blog);
	}

	// 根据类型查找博客
	public List<Blog> getAllBlog(Integer typeId) {

		BlogExample example = new BlogExample();
		Criteria criteria = example.createCriteria();
		criteria.andTypeidEqualTo(typeId);

		return blogMapper.selectByExample(example);
	}

	// 根据名字查找相应作者的博客
	public List<Blog> getAll(String uname) {
		BlogExample example = new BlogExample();
		Criteria criteria = example.createCriteria();
		criteria.andAuthorEqualTo(uname);
		return blogMapper.selectByExample(example);
	}

	// 根据博客id查找对应博客
	public Blog findByBid(Integer bid) {

		return blogMapper.selectByPrimaryKey(bid);
	}

	// 更新博客
	public void update(Blog blog) {
		blogMapper.updateByPrimaryKeySelective(blog);

	}

}
