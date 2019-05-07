package com.sp.travel.location;

public class Location {
	private int locCode;
	private String locName;
	private String loceName;
	private String memo;
	private int enable;
	private int adminIdx;
	private String saveFilename;
	private int locationReplyCount;
	private int avgStarNum;
	
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
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public int getAdminIdx() {
		return adminIdx;
	}
	public void setAdminIdx(int adminIdx) {
		this.adminIdx = adminIdx;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public int getLocationReplyCount() {
		return locationReplyCount;
	}
	public void setLocationReplyCount(int locationReplyCount) {
		this.locationReplyCount = locationReplyCount;
	}
	public int getAvgStarNum() {
		return avgStarNum;
	}
	public void setAvgStarNum(int avgStarNum) {
		this.avgStarNum = avgStarNum;
	}
}
