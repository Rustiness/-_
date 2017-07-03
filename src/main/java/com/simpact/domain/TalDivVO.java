package com.simpact.domain;

public class TalDivVO {
	private String talDivDF;
	private String talCateDF;
	private String name;
	private String memo;
	private String isYn;

	/* 재능연결 */
	private String talConnNO;

	public TalDivVO() {
	}

	@Override
	public String toString() {
		return "TalDivVO{" +
				"talDivDF='" + talDivDF + '\'' +
				", talCateDF='" + talCateDF + '\'' +
				", name='" + name + '\'' +
				", memo='" + memo + '\'' +
				", isYn='" + isYn + '\'' +
				", talConnNO='" + talConnNO + '\'' +
				'}';
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

	public String getTalConnNO() {
		return talConnNO;
	}

	public void setTalConnNO(String talConnNO) {
		this.talConnNO = talConnNO;
	}
}
