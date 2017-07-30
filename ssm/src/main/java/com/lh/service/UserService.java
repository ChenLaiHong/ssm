package com.lh.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.lh.bean.User;
import com.lh.bean.UserExample;
import com.lh.bean.UserExample.Criteria;
import com.lh.dao.UserMapper;

@Service("userService")
public class UserService {

	@Autowired
	UserMapper userMapper;

	public User findUserByName(String uname) {
		User user = userMapper.findUserByName(uname);

		return user;
	}

	public void insertuser(User user) {
		userMapper.insertSelective(user);

	}

	public String login(String uname, String password,
			HttpServletRequest request, HttpServletResponse response) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo(uname);
		List<User> list = userMapper.selectByExample(example);
		if (list == null || list.isEmpty()) {
			// request.setAttribute("errorInfo", "用户名或密码错误！");
			return "1";
		}
		// 判断密码是否正确
		User user = list.get(0);
		if (!DigestUtils.md5DigestAsHex(password.getBytes()).equals(
				user.getPassword())) {
			// request.setAttribute("errorInfo", "用户名或密码错误！");
			return "1";
		} else
			return "2";
	}

	public boolean selectuname(String uname) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo(uname);
		long count = userMapper.countByExample(example);
		return count == 0;
	}

	public void updateByPrimaryKeySelective(User user) {

		userMapper.updateByPrimaryKeySelective(user);
	}

	public User find(int uid) {
		return userMapper.selectByPrimaryKey(uid);
	}

	public List<User> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.list(map);
	}

	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.getTotal(map);
	}

}
