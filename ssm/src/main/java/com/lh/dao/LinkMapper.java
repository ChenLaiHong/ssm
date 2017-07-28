package com.lh.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lh.bean.Link;
import com.lh.bean.LinkExample;

public interface LinkMapper {
	long countByExample(LinkExample example);

	int deleteByExample(LinkExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(Link record);

	int insertSelective(Link record);

	List<Link> selectByExample(LinkExample example);

	Link selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") Link record,
			@Param("example") LinkExample example);

	int updateByExample(@Param("record") Link record,
			@Param("example") LinkExample example);

	int updateByPrimaryKeySelective(Link record);

	int updateByPrimaryKey(Link record);

	List<Link> list(Map<String, Object> map);

	Long getTotal(Map<String, Object> map);
}