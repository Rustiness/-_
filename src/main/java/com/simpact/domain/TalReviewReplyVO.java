package com.simpact.domain;

import java.util.Date;

public class TalReviewReplyVO {
	private String commExNO;  /* 댓글번호 */
	private String  talExcNO;  /* 재능교환번호 */
	private String  content; /* 댓글내용 */
	private Date  writeDate; /* 등록일시 */
	private Date  repairDate; /* 수정일시 */
	private String  state;  /* 표시상태 */
	
	@Override
	public String toString() {
		return "TalReviewReplyVO [commExNO=" + commExNO + ", talExcNO=" + talExcNO + ", content=" + content
				+ ", writeDate=" + writeDate + ", repairDate=" + repairDate + ", state=" + state + "]";
	}
	public String getCommExNO() {
		return commExNO;
	}
	public void setCommExNO(String commExNO) {
		this.commExNO = commExNO;
	}
	public String getTalExcNO() {
		return talExcNO;
	}
	public void setTalExcNO(String talExcNO) {
		this.talExcNO = talExcNO;
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
