package com.simpact.domain;

import java.sql.Date;

public class TalBoardVO {
	private String talDocNO;
	private String title;
	private int excCalls;
	private int views;
	private String contentWant;
	private String contentHave;
	private Date writeDate;
	private Date repairDate;
	private String memNO;
	private int isYnFile;
	private String nickName;


	public String getTalDocNO() {
		return talDocNO;
	}

	public void setTalDocNO(String talDocNO) {
		this.talDocNO = talDocNO;
	}

	public String getContentHave() {
		return contentHave;
	}

	public void setContentHave(String contentHave) {
		this.contentHave = contentHave;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getExcCalls() {
		return excCalls;
	}

	public void setExcCalls(int excCalls) {
		this.excCalls = excCalls;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getContentWant() {
		return contentWant;
	}

	public void setContentWant(String contentWant) {
		this.contentWant = contentWant;
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

	public String getMemNO() {
		return memNO;
	}

	public void setMemNO(String memNO) {
		this.memNO = memNO;
	}

	public int getIsYnFile() {
		return isYnFile;
	}

	public void setIsYnFile(int isYnFile) {
		this.isYnFile = isYnFile;
	}

	@Override
	public String toString() {
		return "TalentListVO [talDocNO=" + talDocNO + ", title=" + title + ", excCalls=" + excCalls + ", views=" + views
				+ ", contentWant=" + contentWant + ", contentHave=" + contentHave + ", writeDate=" + writeDate
				+ ", repairDate=" + repairDate + ", memNO=" + memNO + ", isYnFile=" + isYnFile + ", nickName="
				+ nickName + "]";
	}


}
