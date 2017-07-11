package com.simpact.domain;

import java.util.Date;

/**
 * Created
 * User: kosta
 * Date: 2017-07-11
 * Time: 오후 4:58
 */
public class TalExchangeVO {
	private String talConnNO;   /* 재능연결번호 */
	private String talDocNO;    /* 재능글번호 */
	private String memNO;       /* 회원번호(신청자) */
	private String title;       /* 신청제목 */
	private String content;     /* 신청내용 */
	private Date reqDate;       /* 신청일시 */
	private String isYNview;    /* 신청확인유무 */
	private String state;       /* 진행상태 */

	private String email;       /* 회원아이디(이메일) */
	private String nickName;    /* 교환상대 닉네임 */
	private String tel;         /* 전화번호 */
	private Date connDate;      /* 연결일시 */

	public TalExchangeVO() {
	}

	@Override
	public String toString() {
		return "TalExchangeVO{" +
				"talConnNO='" + talConnNO + '\'' +
				", talDocNO='" + talDocNO + '\'' +
				", memNO='" + memNO + '\'' +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", reqDate=" + reqDate +
				", isYNview='" + isYNview + '\'' +
				", state='" + state + '\'' +
				", email='" + email + '\'' +
				", nickName='" + nickName + '\'' +
				", tel='" + tel + '\'' +
				", connDate=" + connDate +
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getConnDate() {
		return connDate;
	}

	public void setConnDate(Date connDate) {
		this.connDate = connDate;
	}
}
