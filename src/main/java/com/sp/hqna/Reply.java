package com.sp.hqna;

public class Reply {
	private int answerCode, qnaCode;
	private int adminIdx;
	private String answerContent;
	private String answerCreated;
	
	public int getAnswerCode() {
		return answerCode;
	}
	public void setAnswerCode(int answerCode) {
		this.answerCode = answerCode;
	}
	public int getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}
	public int getAdminIdx() {
		return adminIdx;
	}
	public void setAdminIdx(int adminIdx) {
		this.adminIdx = adminIdx;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getAnswerCreated() {
		return answerCreated;
	}
	public void setAnswerCreated(String answerCreated) {
		this.answerCreated = answerCreated;
	}

	
	
}
