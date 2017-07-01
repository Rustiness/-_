package com.simpact.domain;

public class TalDivVO {
	
	
		
		private String taldivdf;
		private String talcatedf;
		private String name;
		private String memo;
		private String isyn;
		
		public String getTaldivdf() {
			return taldivdf;
		}
		public void setTaldivdf(String taldivdf) {
			this.taldivdf = taldivdf;
		}
		public String getTalcatedf() {
			return talcatedf;
		}
		public void setTalcatedf(String talcatedf) {
			this.talcatedf = talcatedf;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getMemo() {
			return memo;
		}
		public void setMemo(String memo) {
			this.memo = memo;
		}
		public String getIsyn() {
			return isyn;
		}
		public void setIsyn(String isyn) {
			this.isyn = isyn;
		}
		
		@Override
		public String toString() {
			return "TalDivVo [taldivdf=" + taldivdf + ", talcatedf=" + talcatedf + ", name=" + name + ", memo=" + memo
					+ ", isyn=" + isyn + "]";
		}

}
