package com.lh.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lh.bean.Type;
import com.lh.dao.BlogMapper;
import com.lh.dao.TypeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {

	@Autowired
	TypeMapper typeMapper;

	@Autowired
	BlogMapper blogMapper;

	@Autowired
	SqlSession sqlSession;

	@Test
	public void testCURD() {

		System.out.println(typeMapper);

		typeMapper.insertSelective(new Type(null, "开发类"));
		typeMapper.insertSelective(new Type(null, "测试类"));
		/**
		 * BlogMapper mapper = sqlSession.getMapper(BlogMapper.class); for (int
		 * i = 0; i < 100; i++) { String bid =
		 * UUID.randomUUID().toString().substring(0, 5) + i;
		 * mapper.insertSelective(new Blog(null, "技术更新", "mmm", new Date(), 1,
		 * 2, bid + "连连看", 2)); }
		 */

	}
}
