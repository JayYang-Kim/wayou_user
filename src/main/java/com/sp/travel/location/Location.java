package com.sp.travel.location;

public class Location {
	// 공통 
	private int locCode;
	private String locName;
	private String loceName;
	private int landCode;
	private String landName;
	private String memo;
	private int adminIdx;
	private String adminId;
	private String adminName;
	private int userIdx;
	private String userId;
	private String userName;
	private String saveFilename;
	private String created;
	
	// 여행정보
	private String lat;
	private String lng;
	private int landCount;
	private int locAvgStarNum;
	private int locReplyCount;
	private int enable;
	
	// 추천 관광명소
	private int tagCode;
	private String tagName;
	private int landReplyCount;
	
	// 추천 여행일정
	private int workCode;
	private String subject;
	private int dayCount;
	private String startDay;
	private int pay;
	
	// 커뮤니티
	private int replyCode;
	private int starNum;
	private String content;
	
	public int getLocCode() {
		return locCode;
	}
	public void setLocCode(int locCode) {
		this.locCode = locCode;
	}
	public String getLocName() {
		return locName;
	}
	public void setLocName(String locName) {
		this.locName = locName;
	}
	public String getLoceName() {
		return loceName;
	}
	public void setLoceName(String loceName) {
		this.loceName = loceName;
	}
	public int getLandCode() {
		return landCode;
	}
	public void setLandCode(int landCode) {
		this.landCode = landCode;
	}
	public String getLandName() {
		return landName;
	}
	public void setLandName(String landName) {
		this.landName = landName;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getAdminIdx() {
		return adminIdx;
	}
	public void setAdminIdx(int adminIdx) {
		this.adminIdx = adminIdx;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
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
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public int getLandCount() {
		return landCount;
	}
	public void setLandCount(int landCount) {
		this.landCount = landCount;
	}
	public int getLocAvgStarNum() {
		return locAvgStarNum;
	}
	public void setLocAvgStarNum(int locAvgStarNum) {
		this.locAvgStarNum = locAvgStarNum;
	}
	public int getLocReplyCount() {
		return locReplyCount;
	}
	public void setLocReplyCount(int locReplyCount) {
		this.locReplyCount = locReplyCount;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public int getTagCode() {
		return tagCode;
	}
	public void setTagCode(int tagCode) {
		this.tagCode = tagCode;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public int getLandReplyCount() {
		return landReplyCount;
	}
	public void setLandReplyCount(int landReplyCount) {
		this.landReplyCount = landReplyCount;
	}
	public int getWorkCode() {
		return workCode;
	}
	public void setWorkCode(int workCode) {
		this.workCode = workCode;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getDayCount() {
		return dayCount;
	}
	public void setDayCount(int dayCount) {
		this.dayCount = dayCount;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}
	public int getStarNum() {
		return starNum;
	}
	public void setStarNum(int starNum) {
		this.starNum = starNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
