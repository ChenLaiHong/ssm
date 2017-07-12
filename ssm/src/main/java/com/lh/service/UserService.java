package com.lh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lh.bean.User;
import com.lh.bean.UserExample;
import com.lh.bean.UserExample.Criteria;
import com.lh.dao.UserMapper;

@Service
public class UserService {

	@Autowired
	UserMapper userMapper;

	public void insertuser(User user) {
		userMapper.insertSelective(user);

	}

	public boolean selectuname(String uname) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo(uname);
		long count = userMapper.countByExample(example);
		return count == 0;
	}

}
