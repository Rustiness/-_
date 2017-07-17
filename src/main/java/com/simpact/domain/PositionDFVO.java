package com.simpact.domain;

/**
 * Created
 * User: kosta
 * Date: 2017-07-11
 * Time: 오후 2:34
 */
public class PositionDFVO {
	private String posDF;
	private String name;
	private String memo;
	private String inYn;

	public PositionDFVO(String posDF, String name, String memo, String inYn) {
		super();
		this.posDF = posDF;
		this.name = name;
		this.memo = memo;
		this.inYn = inYn;
	}

	public String getPosDF() {
		return posDF;
	}

	public void setPosDF(String posDF) {
		this.posDF = posDF;
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

	public String getInYn() {
		return inYn;
	}

	public void setInYn(String inYn) {
		this.inYn = inYn;
	}

	public PositionDFVO() {
	}
}
