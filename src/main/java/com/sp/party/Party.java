package com.sp.party;

public class Party {
	private int partyCode; // 파티 코드
	private String subject; // 제목
	private String content; // 내용
	private String startDate; // 모집 시작일
	private String endDate; // 모집 종료일
	private int userIdx; // 생성 유저 idx
	private String userId; // 생성 유저 id
	private String created; // 생성일
	private int max; // 참기 인원
	private int enabled; // 활성 여부
	private int confirmCode; // 등록 여부 (0 : 대기, 1 : 수락, 2 : 불가)
	private int partyPeopleCount; // 참가 신청한 인원 수
	
	public int getPartyCode() {
		return partyCode;
	}
	public void setPartyCode(int partyCode) {
		this.partyCode = partyCode;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public int getConfirmCode() {
		return confirmCode;
	}
	public void setConfirmCode(int confirmCode) {
		this.confirmCode = confirmCode;
	}
	public int getPartyPeopleCount() {
		return partyPeopleCount;
	}
	public void setPartyPeopleCount(int partyPeopleCount) {
		this.partyPeopleCount = partyPeopleCount;
	}
}
