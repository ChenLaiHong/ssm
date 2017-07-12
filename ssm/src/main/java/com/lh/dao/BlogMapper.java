package com.lh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lh.bean.Blog;
import com.lh.bean.BlogExample;

public interface BlogMapper {
	long countByExample(BlogExample example);

	int deleteByExample(BlogExample example);

	int deleteByPrimaryKey(Integer bid);

	int insert(Blog record);

	int insertSelective(Blog record);

	List<Blog> selectByExample(BlogExample example);

	Blog selectByPrimaryKey(Integer bid);

	List<Blog> selectByExampleWithType(BlogExample example);

	Blog selectByPrimaryKeyWithType(Integer bid);

	int updateByExampleSelective(@Param("record") Blog record,
			@Param("example") BlogExample example);

	int updateByExample(@Param("record") Blog record,
			@Param("example") BlogExample example);

	int updateByPrimaryKeySelective(Blog record);

	int updateByPrimaryKey(Blog record);
}