package com.simpact.domain;

import java.util.Date;

public class TalExchangeVO {
	private String talExcNO; /* 재능교환번호 */
	private String talConnNO; /* 재능연결번호 */
	private String title; /* 후기제목 */
	private String content; /* 후기내용 */
	private Date writeDate; /* 등록일시 */
	private Date repairDate; /* 수정일시 */
	private String state; /* 표시상태 */

	
	private String name;//내가 받은 재능명
	private String nickname;//상대방의 닉네임


	@Override
	public String toString() {
		return "TalExchangeVO [talExcNO=" + talExcNO + ", talConnNO=" + talConnNO + ", title=" + title + ", content="
				+ content + ", writeDate=" + writeDate + ", repairDate=" + repairDate + ", state=" + state + ", name="
				+ name + ", nickName=" + nickname + "]";
	}

	public String getTalExcNO() {
		return talExcNO;
	}

	public void setTalExcNO(String talExcNO) {
		this.talExcNO = talExcNO;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	
	

}