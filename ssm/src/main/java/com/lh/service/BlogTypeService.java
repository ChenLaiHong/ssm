package com.lh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lh.bean.Type;
import com.lh.dao.TypeMapper;

@Service
public class BlogTypeService {

	@Autowired
	TypeMapper typeMapper;

	// 查询所有类型
	public List<Type> getAll() {
		return typeMapper.selectByExample(null);

	}
}
