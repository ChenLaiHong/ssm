package com.lh.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lh.bean.Comment;
import com.lh.dao.CommentMapper;

@Service
public class CommentService {

	@Autowired
	CommentMapper commentMapper;

	public Object list(Map<String, Object> map) {

		return commentMapper.list(map);
	}

	public int add(Comment comment) {

		return commentMapper.add(comment);
	}

}
