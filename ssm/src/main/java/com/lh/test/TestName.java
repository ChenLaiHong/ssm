package com.lh.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.lh.bean.User;
import com.lh.bean.UserExample;
import com.lh.bean.UserExample.Criteria;
import com.lh.dao.UserMapper;

public class TestName {
	@Autowired
	UserMapper userMapper;

	@Test
	public void test() {

		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo("赖红");
		User user = (User) userMapper.selectByExample(example);
		System.out.println(user);
	}

}
