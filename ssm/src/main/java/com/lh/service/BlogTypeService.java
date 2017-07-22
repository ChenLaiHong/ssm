package com.lh.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lh.bean.Type;
import com.lh.dao.TypeMapper;

@Service
public class BlogTypeService {

	@Autowired
	TypeMapper typeMapper;

	// 添加类型
	public int add(Type blogType) {

		return typeMapper.insertSelective(blogType);
	}

	// 修改类型
	public int update(Type blogType) {

		return typeMapper.updateByPrimaryKeySelective(blogType);
	}

	// 查询所有类型
	public List<Type> list(Map<String, Object> map) {

		return typeMapper.list(map);
	}

	// 删除类型
	public int delete(int typeId) {
		return typeMapper.deleteByPrimaryKey(typeId);

	}
}
