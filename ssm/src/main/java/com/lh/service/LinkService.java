package com.lh.service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lh.bean.Link;
import com.lh.dao.LinkMapper;
import com.lh.poi.WriteExcel;

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

	public List<Link> findLink() {

		return linkMapper.selectByExample(null);
	}

	public int del(Integer id) {

		return linkMapper.del(id);
	}

	public void batchInsert(List<Link> linkList) {

		linkMapper.batchInsert(linkList);

	}

	// 导出用到
	public InputStream getInputStream() throws Exception {
		String[] title = new String[] { "Id", "linkName", "linkUrl", "orderNo" };
		List<Link> plist = linkMapper.getLinkList();
		List<Object[]> dataList = new ArrayList<Object[]>();
		for (int i = 0; i < plist.size(); i++) {
			Object[] obj = new Object[4];
			obj[0] = plist.get(i).getId();
			obj[1] = plist.get(i).getLinkName();
			obj[2] = plist.get(i).getLinkUrl();
			obj[3] = plist.get(i).getOrderNo();
			dataList.add(obj);
		}
		WriteExcel ex = new WriteExcel(title, dataList);
		InputStream in;
		in = ex.export();
		return in;
	}

}
