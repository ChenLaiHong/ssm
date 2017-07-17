package com.lh.bean;

public class Type {
	private Integer typeId;

	private String typeName;

	private String describe;

	private String imageName;

	public Type() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Type(Integer typeId, String typeName, String describe,
			String imageName) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
		this.describe = describe;
		this.imageName = imageName;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName == null ? null : typeName.trim();
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe == null ? null : describe.trim();
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName == null ? null : imageName.trim();
	}
}