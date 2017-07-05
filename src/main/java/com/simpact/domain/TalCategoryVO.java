package com.simpact.domain;

public class TalCategoryVO {
	
	private String talCateDF;
	private String name;
	private String memo;
	private String isYn;
	public String getTalCateDF() {
		return talCateDF;
	}
	public void setTalCateDF(String talCateDF) {
		this.talCateDF = talCateDF;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getIsYn() {
		return isYn;
	}
	public void setIsYn(String isYn) {
		this.isYn = isYn;
	}
	@Override
	public String toString() {
		return "TalCategoryVO [talCateDF=" + talCateDF + ", name=" + name + ", memo=" + memo + ", isYn=" + isYn + "]";
	}
	
	

	
	
	

}
