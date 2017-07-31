package com.lh.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lh.bean.Comment;
import com.lh.bean.CommentExample;

public interface CommentMapper {
	long countByExample(CommentExample example);

	int deleteByExample(CommentExample example);

	int deleteByPrimaryKey(Integer cid);

	int insert(Comment record);

	int insertSelective(Comment record);

	List<Comment> selectByExample(CommentExample example);

	List<Comment> list(Map<String, Object> map);

	Comment selectByPrimaryKey(Integer cid);

	int updateByExampleSelective(@Param("record") Comment record,
			@Param("example") CommentExample example);

	int updateByExample(@Param("record") Comment record,
			@Param("example") CommentExample example);

	int updateByPrimaryKeySelective(Comment record);

	int updateByPrimaryKey(Comment record);

	int add(Comment comment);

	Long getTotal(Map<String, Object> map);
}