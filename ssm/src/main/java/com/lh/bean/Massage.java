package com.lh.bean;

import java.util.HashMap;
import java.util.Map;

//通用的返回json数据的类
public class Massage {
	private int code;
	private String msg;
	private Map<String, Object> extend = new HashMap<String, Object>();

	public static Massage success() {

		Massage result = new Massage();
		result.setCode(100);
		result.setMsg("处理成功！");
		return result;
	}

	public static Massage fail() {

		Massage result = new Massage();
		result.setCode(200);
		result.setMsg("处理失败！");
		return result;
	}

	public Massage add(String key, Object value) {
		this.getExtend().put(key, value);
		return this;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

}
