package com.simpact.domain;

import java.sql.Date;

public class EmployeeVO {		//직원추가정보 + 직책명 + 관리명을 담은 VO
	private String empNO;
	private String memNO;
	private String gradeDF;
	private String posDF;
	private Date latestDate;
	private Date retireDate;
	private String state;
	
	private String pname;	//직챙명
	private String gname;	//관리명

	
	public EmployeeVO(String empNO, String memNO, String gradeDF, String posDF, Date latestDate, Date retireDate,
			String state, String pname, String gname) {
		super();
		this.empNO = empNO;
		this.memNO = memNO;
		this.gradeDF = gradeDF;
		this.posDF = posDF;
		this.latestDate = latestDate;
		this.retireDate = retireDate;
		this.state = state;
		this.pname = pname;
		this.gname = gname;
	}


	public String getEmpNO() {
		return empNO;
	}


	public void setEmpNO(String empNO) {
		this.empNO = empNO;
	}


	public String getMemNO() {
		return memNO;
	}


	public void setMemNO(String memNO) {
		this.memNO = memNO;
	}


	public String getGradeDF() {
		return gradeDF;
	}


	public void setGradeDF(String gradeDF) {
		this.gradeDF = gradeDF;
	}


	public String getPosDF() {
		return posDF;
	}


	public void setPosDF(String posDF) {
		this.posDF = posDF;
	}


	public Date getLatestDate() {
		return latestDate;
	}


	public void setLatestDate(Date latestDate) {
		this.latestDate = latestDate;
	}


	public Date getRetireDate() {
		return retireDate;
	}


	public void setRetireDate(Date retireDate) {
		this.retireDate = retireDate;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getGname() {
		return gname;
	}


	public void setGname(String gname) {
		this.gname = gname;
	}


	public EmployeeVO() {
	}
}
