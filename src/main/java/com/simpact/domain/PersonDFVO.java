package com.simpact.domain;

public class PersonDFVO {

	private String personDF; //회원분류번호
	private String name; //분류명
	
	
	
	public String getPersonDF() {
		return personDF;
	}

	public void setPersonDF(String personDF) {
		this.personDF = personDF;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public PersonDFVO() {
	}
	
	public PersonDFVO(String personDF, String name) {
		super();
		this.personDF = personDF;
		this.name = name;
	}
	
	
}
