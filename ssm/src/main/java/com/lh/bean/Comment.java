package com.lh.bean;

import java.util.Date;

public class Comment {
	private Integer cid;// 数据库数据，评论的id

	private String content;// 数据库数据，评论内容

	private String author;// 数据库数据，评论作者

	private Date commentDate;// 数据库数据，评论日期

	private Integer state;// 数据库数据，评论状态

	private Integer bid;// 数据库数据，外键

	private Blog blog; // 被评论的博客

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author == null ? null : author.trim();
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}
}