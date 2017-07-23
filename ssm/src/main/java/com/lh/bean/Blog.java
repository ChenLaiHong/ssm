package com.lh.bean;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class Blog {
	private Integer bid; // 博客id

	private String title; // 博客标题

	private String summary; // 博客摘要

	private Date releaseDate; // 发表时间

	private String author; // 发表人

	private Integer clickHit; // 查看次数

	private Integer replyHit; // 回复次数

	private String content; // 博客内容

	private String contentNoTag; // 博客内容 无网页标签 Lucene分词用

	private Integer typeId;

	private Type type; // 博客类型

	private Integer blogCount; // 博客数量 非博客实际属性，主要是 根据发布日期归档查询博客数量用
	private String releaseDateStr; // 发布日期字符串 只取年和月
	private String keyWord; // 关键字 空格隔开

	private List<String> imagesList = new LinkedList<String>(); // 博客里存在的图片
																// 主要用于列表展示显示缩略图

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Integer getBlogCount() {
		return blogCount;
	}

	public void setBlogCount(Integer blogCount) {
		this.blogCount = blogCount;
	}

	public String getReleaseDateStr() {
		return releaseDateStr;
	}

	public void setReleaseDateStr(String releaseDateStr) {
		this.releaseDateStr = releaseDateStr;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public List<String> getImagesList() {
		return imagesList;
	}

	public void setImagesList(List<String> imagesList) {
		this.imagesList = imagesList;
	}

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