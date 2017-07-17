package com.simpact.domain;

import java.util.Date;

public class TalReviewVO {
	private String talReviewNO; /* 재능교환번호 */
	private String talConnNO;   /* 재능연결번호 */
	private String title;       /* 후기제목 */
	private String content;     /* 후기내용 */
	private Date writeDate;     /* 등록일시 */
	private Date repairDate;    /* 수정일시 */
	private String state;       /* 표시상태 */

	private String name;        /* 내가 받은 재능명 */
	private String memNO;       /* 내 아이디번호 */
	private String nickName;    /*상대방의 닉네임 */

	@Override
	public String toString() {
		return "TalReviewVO [talReviewNO=" + talReviewNO + ", talConnNO=" + talConnNO + ", title=" + title
				+ ", content=" + content + ", writeDate=" + writeDate + ", repairDate=" + repairDate + ", state="
				+ state + ", name=" + name + ", memNO=" + memNO + ", nickName=" + nickName + "]";
	}

	public String getTalReviewNO() {
		return talReviewNO;
	}

	public void setTalReviewNO(String talReviewNO) {
		this.talReviewNO = talReviewNO;
	}

	public String getTalConnNO() {
		return talConnNO;
	}

	public void setTalConnNO(String talConnNO) {
		this.talConnNO = talConnNO;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemNO() {
		return memNO;
	}

	public void setMemNO(String memNO) {
		this.memNO = memNO;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


}
