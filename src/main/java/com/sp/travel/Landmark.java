package com.sp.travel;

import java.util.List;

public class Landmark {
	private int landCode;
	private int locCode;
	private String landName;
	private String address1;
	private String address2;
	private String lat;
	private String lng;
	private String memo;
	private String created;
	private int tagCode;
	private int adminIdx;
	private List<String> saveFilename;
	public int getLandCode() {
		return landCode;
	}
	public void setLandCode(int landCode) {
		this.landCode = landCode;
	}
	public int getLocCode() {
		return locCode;
	}
	public void setLocCode(int locCode) {
		this.locCode = locCode;
	}
	public String getLandName() {
		return landName;
	}
	public void setLandName(String landName) {
		this.landName = landName;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
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
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getTagCode() {
		return tagCode;
	}
	public void setTagCode(int tagCode) {
		this.tagCode = tagCode;
	}
	public int getAdminIdx() {
		return adminIdx;
	}
	public void setAdminIdx(int adminIdx) {
		this.adminIdx = adminIdx;
	}
	public List<String> getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(List<String> saveFilename) {
		this.saveFilename = saveFilename;
	}
	
	
}
