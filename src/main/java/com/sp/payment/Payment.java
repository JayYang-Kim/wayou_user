package com.sp.payment;

public class Payment {
	// pg결제 관련 정보
	private int pgIdentCode;
	private String storeCode;
	private String storeName;
	
	// 구매자 정보
	private int userIdx;
	private String userId;
	private String userName;
	private String postCode;
	private String userAddr1;
	private String userAddr2;
	private String etc;
	private String userTel;
	private String userEmail;
	
	//pay master DB용
	private String impCode;
	private String paymethod;
	private String status;
	private int confirmCardNum;
	private int confirmMoney;
	private String confirmDate;
	
	//order DB용
	private int dataType;
	private int odCode;
	private int orderCode;
	private int productCode;
	private int amount;
	private int price;
	private int wishCode;
	
	//order Master DB용
	private String orderDate;
	private String name;
	private int receiveType;
	private String memo;
	private int totalMoney;
	private int separate;
	
	
	public int getPgIdentCode() {
		return pgIdentCode;
	}
	public void setPgIdentCode(int pgIdentCode) {
		this.pgIdentCode = pgIdentCode;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
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
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getSeparate() {
		return separate;
	}
	public void setSeparate(int separate) {
		this.separate = separate;
	}
	public int getConfirmMoney() {
		return confirmMoney;
	}
	public void setConfirmMoney(int confirmMoney) {
		this.confirmMoney = confirmMoney;
	}
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public int getOdCode() {
		return odCode;
	}
	public void setOdCode(int odCode) {
		this.odCode = odCode;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getReceiveType() {
		return receiveType;
	}
	public void setReceiveType(int receiveType) {
		this.receiveType = receiveType;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImpCode() {
		return impCode;
	}
	public void setImpCode(String impCode) {
		this.impCode = impCode;
	}
	public String getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getConfirmCardNum() {
		return confirmCardNum;
	}
	public void setConfirmCardNum(int confirmCardNum) {
		this.confirmCardNum = confirmCardNum;
	}
	public int getDataType() {
		return dataType;
	}
	public void setDataType(int dataType) {
		this.dataType = dataType;
	}
	public int getWishCode() {
		return wishCode;
	}
	public void setWishCode(int wishCode) {
		this.wishCode = wishCode;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	
}
