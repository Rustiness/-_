package com.simpact.domain;

public class TalDivVO {
	private String talDivDF;
	private String talCateDF;
	private String name;
	private String memo;
	private String isYn;

	/*재능글 목록*/
	private String talDocNO;
	/* 재능연결 */
	private String talConnNO;

	/* 카테고리명 및 항목명 ~ 재능신청 */
	private String talCateName; //카테고리명
	private String talDivName; //항목명

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
				", talDocNO='" + talDocNO + '\'' +
				", talConnNO='" + talConnNO + '\'' +
				", talCateName='" + talCateName + '\'' +
				", talDivName='" + talDivName + '\'' +
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

	public String getTalDocNO() {
		return talDocNO;
	}

	public void setTalDocNO(String talDocNO) {
		this.talDocNO = talDocNO;
	}

	public String getTalConnNO() {
		return talConnNO;
	}

	public void setTalConnNO(String talConnNO) {
		this.talConnNO = talConnNO;
	}

	public String getTalCateName() {
		return talCateName;
	}

	public void setTalCateName(String talCateName) {
		this.talCateName = talCateName;
	}

	public String getTalDivName() {
		return talDivName;
	}

	public void setTalDivName(String talDivName) {
		this.talDivName = talDivName;
	}
}
