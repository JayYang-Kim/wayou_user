package com.sp.hqna;

public class Hqna {
	private int qnaCode; //listnum
	private int num;
	private int catCode; //카테고리 코드
	private String subject;
	private String created;
	private String content;
	private int isSatisfied;
	private int answerCode; //replynum
	private String userName;
	private int userIdx;
	private int listNum;
	private int hitCount;
	 
	public int getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCatCode() {
		return catCode;
	}
	public void setCatCode(int catCode) {
		this.catCode = catCode;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIsSatisfied() {
		return isSatisfied;
	}
	public void setIsSatisfied(int isSatisfied) {
		this.isSatisfied = isSatisfied;
	}
	public int getAnswerCode() {
		return answerCode;
	}
	public void setAnswerCode(int answerCode) {
		this.answerCode = answerCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
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
