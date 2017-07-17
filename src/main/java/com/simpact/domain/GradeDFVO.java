package com.simpact.domain;

/**
 * Created
 * User: simpact
 * Date: 2017-07-11
 * Time: 오후 2:34
 */

public class GradeDFVO {
	private String gradeDF;
	private String name;
	private String memo;
	private String inYn;

	public String getGradeDF() {
		return gradeDF;
	}

	public void setGradeDF(String gradeDF) {
		this.gradeDF = gradeDF;
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

	public GradeDFVO(String gradeDF, String name, String memo, String inYn) {
		super();
		this.gradeDF = gradeDF;
		this.name = name;
		this.memo = memo;
		this.inYn = inYn;
	}

	public GradeDFVO() {
	}

}
