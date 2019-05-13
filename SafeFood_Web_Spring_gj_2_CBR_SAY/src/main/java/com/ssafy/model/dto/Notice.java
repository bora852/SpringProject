package com.ssafy.model.dto;

import java.sql.Date;

public class Notice {
	private Integer noticeIdx;
	private String userId;
	private String title;
	private String content;
	private Date createDate;
	private Integer hitCnt;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(Integer noticeIdx, String userId, String title, String content, Date createDate, Integer hitCnt) {
		super();
		this.noticeIdx = noticeIdx;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.hitCnt = hitCnt;
	}
	public Integer getNoticeIdx() {
		return noticeIdx;
	}
	public void setNoticeIdx(Integer noticeIdx) {
		this.noticeIdx = noticeIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getHitCnt() {
		return hitCnt;
	}
	public void setHitCnt(Integer hitCnt) {
		this.hitCnt = hitCnt;
	}
	@Override
	public String toString() {
		return "notice [noticeIdx=" + noticeIdx + ", userId=" + userId + ", title=" + title + ", content=" + content
				+ ", createDate=" + createDate + ", hitCnt=" + hitCnt + "]";
	}
	
	
}
