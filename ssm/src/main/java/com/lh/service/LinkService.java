package com.lh.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lh.bean.Link;
import com.lh.dao.LinkMapper;

@Service
public class LinkService {

	@Autowired
	LinkMapper linkMapper;

	public List<Link> list(Map<String, Object> map) {

		return linkMapper.list(map);
	}

	public Long getTotal(Map<String, Object> map) {

		return linkMapper.getTotal(map);
	}

	public int add(Link link) {

		return linkMapper.insertSelective(link);
	}

	public int update(Link link) {

		return linkMapper.updateByPrimaryKeySelective(link);
	}

	public void delete(int id) {
		linkMapper.deleteByPrimaryKey(id);

	}

	public List<Link> getAll() {

		return linkMapper.selectByExample(null);
	}

}
