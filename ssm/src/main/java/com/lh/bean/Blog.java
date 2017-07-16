package com.lh.bean;

import java.util.Date;

public class Blog {
	private Integer bid;

	private String title;

	private String summary;

	private Date releasedate;

	private String author;

	private Integer clickhit;

	private Integer replyhit;

	private String content;

	private String contentnotag;

	private Integer typeid;

	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Blog(Integer bid, String title, String summary, Date releasedate,
			String author, Integer clickhit, Integer replyhit, String content,
			String contentnotag) {
		super();
		this.bid = bid;
		this.title = title;
		this.summary = summary;
		this.releasedate = releasedate;
		this.author = author;
		this.clickhit = clickhit;
		this.replyhit = replyhit;
		this.content = content;
		this.contentnotag = contentnotag;
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author == null ? null : author.trim();
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

	public String getContentnotag() {
		return contentnotag;
	}

	public void setContentnotag(String contentnotag) {
		this.contentnotag = contentnotag == null ? null : contentnotag.trim();
	}

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
}