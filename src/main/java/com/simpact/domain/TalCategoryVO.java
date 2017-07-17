package com.simpact.domain;

/**
 * Created
 * User: simpact
 * Date: 2017-07-17
 * Time: 오후 5:03
 */
public class TalCategoryVO {
	private String talCateDF;   //카테고리번호
	private String name;        //카테고리명
	private String memo;        //카테고리메모
	private String isYn;        //사용유무

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
