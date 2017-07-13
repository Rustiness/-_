package com.simpact.domain;

import oracle.sql.DATE;

public class CounselAnswerVO {

		private String answerNO; /* 문의답변번호 */
		private String csNO;  /* 문의번호 */
		private String empNO; /* 직원번호 */
		private String content; /* 답변내용 */
		private DATE writeDate; /* 등록일시 */
		@Override
		public String toString() {
			return "CounselAnswerVO [answerNO=" + answerNO + ", csNO=" + csNO + ", empNO=" + empNO + ", content="
					+ content + ", writeDate=" + writeDate + "]";
		}
		public String getAnswerNO() {
			return answerNO;
		}
		public void setAnswerNO(String answerNO) {
			this.answerNO = answerNO;
		}
		public String getCsNO() {
			return csNO;
		}
		public void setCsNO(String csNO) {
			this.csNO = csNO;
		}
		public String getEmpNO() {
			return empNO;
		}
		public void setEmpNO(String empNO) {
			this.empNO = empNO;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public DATE getWriteDate() {
			return writeDate;
		}
		public void setWriteDate(DATE writeDate) {
			this.writeDate = writeDate;
		}
		
		
}






