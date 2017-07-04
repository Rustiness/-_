package com.simpact.domain;

public class MessengerVO {
	private String memNO;
	private String mesDF;
	private String name;
	private String id;

	public MessengerVO() {
	}

	@Override
	public String toString() {
		return "MessengerVO{" +
				"memNO='" + memNO + '\'' +
				", mesDF='" + mesDF + '\'' +
				", name='" + name + '\'' +
				", id='" + id + '\'' +
				'}';
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
