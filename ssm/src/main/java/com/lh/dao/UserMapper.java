package com.lh.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lh.bean.User;
import com.lh.bean.UserExample;

public interface UserMapper {
	long countByExample(UserExample example);

	int deleteByExample(UserExample example);

	int deleteByPrimaryKey(Integer uid);

	int insert(User record);

	int insertSelective(User record);

	User findUserByName(String uname);

	List<User> selectByExample(UserExample example);

	User selectByPrimaryKey(Integer uid);

	int updateByExampleSelective(@Param("record") User record,
			@Param("example") UserExample example);

	int updateByExample(@Param("record") User record,
			@Param("example") UserExample example);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKey(User record);
}