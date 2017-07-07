package com.simpact.domain;

public class TalExchangelistVO {

	private String talDivDF; // 재능항목번호
	private String talCateDF; // 카테고리번호
	private String name; // 재능명
	@Override
	public String toString() {
		return "TalExchangelistVO [talDivDF=" + talDivDF + ", talCateDF=" + talCateDF + ", name=" + name + "]";
	}
	public String getTalDivDF() {
		return talDivDF;
	}
	public void setTalDivDF(String talDivDF) {
		this.talDivDF = talDivDF;
	}
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
	
	
}
