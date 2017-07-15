package com.simpact.domain;

import java.util.Date;

public class TalExcConnVO {
	private String talConnNO; /* 재능연결번호 */
	private String talDocNO; /* 재능글번호 */
	private String memNO; /* 회원번호(신청자) */
	private String title; /* 신청제목 */
	private String content; /* 신청내용 */
	private Date reqDate; /* 신청일시 */
	private String isYNview; /* 신청확인유무 */
	private String state; /* 진행상태 */

	private String nickName;//신청자 닉네임

	public TalExcConnVO() {
	}

	@Override
	public String toString() {
		return "TalExcConnVO{" +
				"talConnNO='" + talConnNO + '\'' +
				", talDocNO='" + talDocNO + '\'' +
				", memNO='" + memNO + '\'' +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", reqDate=" + reqDate +
				", isYNview='" + isYNview + '\'' +
				", state='" + state + '\'' +
				", nickName='" + nickName + '\'' +
				'}';
	}

	public String getTalConnNO() {
		return talConnNO;
	}

	public void setTalConnNO(String talConnNO) {
		this.talConnNO = talConnNO;
	}

	public String getTalDocNO() {
		return talDocNO;
	}

	public void setTalDocNO(String talDocNO) {
		this.talDocNO = talDocNO;
	}

	public String getMemNO() {
		return memNO;
	}

	public void setMemNO(String memNO) {
		this.memNO = memNO;
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

	public Date getReqDate() {
		return reqDate;
	}

	public void setReqDate(Date reqDate) {
		this.reqDate = reqDate;
	}

	public String getIsYNview() {
		return isYNview;
	}

	public void setIsYNview(String isYNview) {
		this.isYNview = isYNview;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getnickName() {
		return nickName;
	}

	public void setnickName(String nickName) {
		this.nickName = nickName;
	}
}
