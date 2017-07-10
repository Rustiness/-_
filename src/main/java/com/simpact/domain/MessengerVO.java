package com.simpact.domain;

public class MessengerVO {
	private String No;
	private String memNO;
	private String mesDF;
	private String name;
	private String id;

	public MessengerVO() {
	}

	

	public String getNo() {
		return No;
	}



	public void setNo(String no) {
		No = no;
	}



	public MessengerVO(String no, String memNO, String mesDF, String name, String id) {
		super();
		No = no;
		this.memNO = memNO;
		this.mesDF = mesDF;
		this.name = name;
		this.id = id;
	}

	public String getMemNO() {
		return memNO;
	}

	public void setMemNO(String memNO) {
		this.memNO = memNO;
	}

	public String getMesDF() {
		return mesDF;
	}

	public void setMesDF(String mesDF) {
		this.mesDF = mesDF;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
