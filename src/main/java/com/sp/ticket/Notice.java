package com.sp.ticket;

public class Notice {
	private int noticeNum;
	private String subject;
	private String content;
	private int adminIdx;
	private String adminName;
	private String created;
	private int listNum;
	private int hitCount;

	

	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAdminIdx() {
		return adminIdx;
	}
	public void setAdminIdx(int adminIdx) {
		this.adminIdx = adminIdx;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}

	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
}
