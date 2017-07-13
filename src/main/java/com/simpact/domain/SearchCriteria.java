package com.simpact.domain;

public class SearchCriteria extends Criteria {

	private String searchType;
	private String keyword;

	private String connMemNO; /* Á¢¼ÓÀÚNO */

	public SearchCriteria() {
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getConnMemNO() {
		return connMemNO;
	}

	public void setConnMemNO(String connMemNO) {
		this.connMemNO = connMemNO;
	}

	@Override
	public String toString() {
		return "SearchCriteria{" +
				"searchType='" + searchType + '\'' +
				", keyword='" + keyword + '\'' +
				", connMemNO='" + connMemNO + '\'' +
				'}';
	}
}