package com.simpact.domain;

import java.sql.Date;

public class TalReviewReplyVO {
	private String commExNO;    /* 댓글번호 */
	private String talReviewNO; /* 재능교환번호 */
	private String content;     /* 댓글내용 */
	private Date writeDate;     /* 등록일시 */
	private Date repairDate;    /* 수정일시 */
	private String state;       /* 표시상태 */
	private String memNO;       /* 회원번호 */

	@Override
	public String toString() {
		return "TalReviewReplyVO [commExNO=" + commExNO + ", talReviewNO=" + talReviewNO + ", content=" + content
				+ ", writeDate=" + writeDate + ", repairDate=" + repairDate + ", state=" + state + ", memNO=" + memNO
				+ "]";
	}

	public String getCommExNO() {
		return commExNO;
	}

	public void setCommExNO(String commExNO) {
		this.commExNO = commExNO;
	}

	public String getTalReviewNO() {
		return talReviewNO;
	}

	public void setTalReviewNO(String talReviewNO) {
		this.talReviewNO = talReviewNO;
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

	public String getMemNO() {
		return memNO;
	}

	public void setMemNO(String memNO) {
		this.memNO = memNO;
	}


}
