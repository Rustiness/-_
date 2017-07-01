package com.simpact.domain;

import java.util.Date;

public class CounselVO {

	private String csNO; //게시물번호
	private String memNO; // 회원번호(작성자느낌)
	private String questDF; // 항목번호(어떤 종류의 문의인지)
	private String title; // 문의제목
	private String content; //문의내용
	private Date writeDate;  //등록일시
	private Date repairDate; //수정일시
	private String state; // 표시상태
	@Override
	public String toString() {
		return "CounselVO [csNO=" + csNO + ", memNO=" + memNO + ", questDF=" + questDF + ", title=" + title
				+ ", content=" + content + ", writeDate=" + writeDate + ", repairDate=" + repairDate + ", state="
				+ state + "]";
	}
	public String getCsNO() {
		return csNO;
	}
	public void setCsNO(String csNO) {
		this.csNO = csNO;
	}
	public String getMemNO() {
		return memNO;
	}
	public void setMemNO(String memNO) {
		this.memNO = memNO;
	}
	public String getQuestDF() {
		return questDF;
	}
	public void setQuestDF(String questDF) {
		this.questDF = questDF;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public Date getRepairDate() {
		return repairDate;
	}
	public void setRepairDate(Date repairDate) {
		this.repairDate = repairDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	

	
	
}
