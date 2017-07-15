package com.simpact.domain;

import java.util.Date;

/**
 * Created
 * User: kosta
 * Date: 2017-07-13
 * Time: 오후 3:30
 */
public class TalExcTimelineVO {
	private String talTimeNO;   /* 타임라인번호 */
	private String talConnNO;   /* 재능연결번호 */
	private String memNO;       /* 회원번호 */
	private String nickName;    /* 닉네임 */
	private String content;     /* 신청내용 */
	private Date   writeDate;   /* 등록일시 */
	private String isYNview;    /* 신청확인유무 */
	private String state;       /* 진행상태 */

	public TalExcTimelineVO() {
	}

	@Override
	public String toString() {
		return "TalExcTimelineVO{" +
				"talTimeNO='" + talTimeNO + '\'' +
				", talConnNO='" + talConnNO + '\'' +
				", memNO='" + memNO + '\'' +
				", nickName='" + nickName + '\'' +
				", content='" + content + '\'' +
				", writeDate=" + writeDate +
				", isYNview='" + isYNview + '\'' +
				", state='" + state + '\'' +
				'}';
	}

	public String getTalTimeNO() {
		return talTimeNO;
	}

	public void setTalTimeNO(String talTimeNO) {
		this.talTimeNO = talTimeNO;
	}

	public String getTalConnNO() {
		return talConnNO;
	}

	public void setTalConnNO(String talConnNO) {
		this.talConnNO = talConnNO;
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
}
