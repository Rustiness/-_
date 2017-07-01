package com.simpact.domain;

public class Criteria {
	// 페이지 정보(page)와 한 페이지당 보여질 레코드 수(perPageNum)를 표현
	private int page;//현재 조회하는 페이지의 번호
	private int perPageNum;//한페이지당 출력하는 데이터의 개수
	
	public Criteria() {
		//기본값
		page=1;
		perPageNum=10;
	}
	
	//속성정보
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	

	public int getPage() {
		return page;
	}


	public void setPage(int page) {		
		this.page = page;
		if(page<=0) this.page=1;		
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
		if(perPageNum <=0 || perPageNum>100) this.perPageNum=10;
	}
	
	public int getPageStart(){
		return (page-1)*perPageNum;//RowBounds의 offset으로 사용할 정수 리턴.
	}
	
	

}
