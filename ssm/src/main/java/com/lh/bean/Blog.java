package com.lh.bean;

import java.util.Date;

public class Blog {
	private Integer bid;

	private String title;

	private String summary;

	private Date releasedate;

	private Integer clickhit;

	private Integer replyhit;

	private String content;

	private Integer typeid;

	private Type type;

	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Blog(Integer bid, String title, String summary, Date releasedate,
			Integer clickhit, Integer replyhit, String content, Integer typeid) {
		super();
		this.bid = bid;
		this.title = title;
		this.summary = summary;
		this.releasedate = releasedate;
		this.clickhit = clickhit;
		this.replyhit = replyhit;
		this.content = content;
		this.typeid = typeid;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary == null ? null : summary.trim();
	}

	public Date getReleasedate() {
		return releasedate;
	}

	public void setReleasedate(Date releasedate) {
		this.releasedate = releasedate;
	}

	public Integer getClickhit() {
		return clickhit;
	}

	public void setClickhit(Integer clickhit) {
		this.clickhit = clickhit;
	}

	public Integer getReplyhit() {
		return replyhit;
	}

	public void setReplyhit(Integer replyhit) {
		this.replyhit = replyhit;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
}