package com.lh.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lh.bean.Type;
import com.lh.bean.TypeExample;

public interface TypeMapper {
	long countByExample(TypeExample example);

	int deleteByExample(TypeExample example);

	int deleteByPrimaryKey(Integer typeid);

	int insert(Type record);

	int insertSelective(Type record);

	List<Type> selectByExample(TypeExample example);

	/**
	 * 分页查询博客类别信息
	 * 
	 * @param map
	 * @return
	 */
	List<Type> list(Map<String, Object> map);

	Type selectByPrimaryKey(Integer typeid);

	int updateByExampleSelective(@Param("record") Type record,
			@Param("example") TypeExample example);

	int updateByExample(@Param("record") Type record,
			@Param("example") TypeExample example);

	int updateByPrimaryKeySelective(Type record);

	int updateByPrimaryKey(Type record);

	List<Type> countList();

	Type findById(Integer typeId);
}