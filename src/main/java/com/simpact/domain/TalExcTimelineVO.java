package com.simpact.domain;

import java.util.Date;

/**
 * Created
 * User: kosta
 * Date: 2017-07-13
 * Time: ���� 3:30
 */
public class TalExcTimelineVO {
	private String talTimeNO;   /* Ÿ�Ӷ��ι�ȣ */
	private String talConnNO;   /* ��ɿ����ȣ */
	private String memNO;       /* ȸ����ȣ */
	private String nickName;    /* �г��� */
	private String content;     /* ��û���� */
	private Date   writeDate;   /* ����Ͻ� */
	private String isYNview;    /* ��ûȮ������ */
	private String state;       /* ������� */

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
