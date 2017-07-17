package com.simpact.domain;

public class QuestionVO {
	private String questDF; //항목번호
	private String name;    //항목명
	private String isYn;    //활성유무

	@Override
	public String toString() {
		return "QuestionVO [questDF=" + questDF + ", name=" + name + ", isYn=" + isYn + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public String getQuestDF() {
		return questDF;
	}

	public void setQuestDF(String questDF) {
		this.questDF = questDF;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsYn() {
		return isYn;
	}

	public void setIsYn(String isYn) {
		this.isYn = isYn;
	}


}
