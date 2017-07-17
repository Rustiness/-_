package com.simpact.domain;

/**
 * Created
 * User: simpact
 * Date: 2017-07-11
 * Time: 오후 2:34
 */

public class MessengerVO {
	private String no;
	private String memNO;
	private String mesDF;
	private String name;
	private String id;

	public MessengerVO() {
	}

	public MessengerVO(String no, String memNO, String mesDF, String name, String id) {
		super();
		this.no = no;
		this.memNO = memNO;
		this.mesDF = mesDF;
		this.name = name;
		this.id = id;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
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
