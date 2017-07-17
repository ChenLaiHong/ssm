package com.lh.bean;

import java.util.Date;

public class Blog {
	private Integer bid;

	private String title;

	private String summary;

	private Date releaseDate;

	private String author;

	private Integer clickHit;

	private Integer replyHit;

	private String content;

	private String contentNoTag;

	private Integer typeId;

	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Blog(Integer bid, String title, String summary, Date releaseDate,
			String author, Integer clickHit, Integer replyHit, String content,
			String contentNoTag) {
		super();
		this.bid = bid;
		this.title = title;
		this.summary = summary;
		this.releaseDate = releaseDate;
		this.author = author;
		this.clickHit = clickHit;
		this.replyHit = replyHit;
		this.content = content;
		this.contentNoTag = contentNoTag;
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

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author == null ? null : author.trim();
	}

	public Integer getClickHit() {
		return clickHit;
	}

	public void setClickHit(Integer clickHit) {
		this.clickHit = clickHit;
	}

	public Integer getReplyHit() {
		return replyHit;
	}

	public void setReplyHit(Integer replyHit) {
		this.replyHit = replyHit;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public String getContentNoTag() {
		return contentNoTag;
	}

	public void setContentNoTag(String contentNoTag) {
		this.contentNoTag = contentNoTag == null ? null : contentNoTag.trim();
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
}