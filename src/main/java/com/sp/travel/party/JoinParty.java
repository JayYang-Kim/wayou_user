package com.sp.travel.party;

public class JoinParty {
	private int partyCode; // 파티 코드
	private int createdUserIdx; // 파티 생성 유저 idx
	private String memo; // 내용
	private int userIdx; // 참가 신청 유저 idx
	private String userId; // 참가 신청 유저 id
	private String userName; // 참가 신청 유저 이름
	private String created; // 참가 신청일
	private int pCode; // 참가 유형 코드 (0 : 대기, 1 : 참여, 2 : 거절, 3: 나감)
	
	public int getPartyCode() {
		return partyCode;
	}
	public void setPartyCode(int partyCode) {
		this.partyCode = partyCode;
	}
	public int getCreatedUserIdx() {
		return createdUserIdx;
	}
	public void setCreatedUserIdx(int createdUserIdx) {
		this.createdUserIdx = createdUserIdx;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getpCode() {
		return pCode;
	}
	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
}
