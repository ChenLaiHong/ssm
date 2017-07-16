package com.lh.bean;

public class Type {
	private Integer typeid;

	private String typename;

	private String describe;

	private String imagename;

	public Type() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Type(Integer typeid, String typename, String describe,
			String imagename) {
		super();
		this.typeid = typeid;
		this.typename = typename;
		this.describe = describe;
		this.imagename = imagename;
	}

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename == null ? null : typename.trim();
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe == null ? null : describe.trim();
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename == null ? null : imagename.trim();
	}
}