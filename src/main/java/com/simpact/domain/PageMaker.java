package com.simpact.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PageMaker {//페이징에 관련된 속성 저장

	private int totalCount;//전체 레코드수
	private int startPage;// 현페이지 13, startPage=11
	private int endPage;//현페이지 13,   endPage=20
	private boolean prev;// <<버튼
	private boolean next;// >>버튼

	private int displayPageNum = 10;//화면에 보여줄 번호의 묶음 단위
  /*
      10  ---> 1 2 3 4 5 6 7 8 9 10               현페이지 3일 경우
             11 12 13 14 15 16 17 18 19 20        현페이지 19일 경우
             
      5   ---> 1 2 3 4 5          현페이지 3일 경우
               6 7 8 9 10         현페이지 6일 경우
               11 12 13 14 15     현페이지 12일 경우
   
   */

	private Criteria cri;

	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = endPage - (displayPageNum - 1);
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		//  190레코드/10 ---> 19
		if (endPage > tempEndPage)
			endPage = tempEndPage;
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

	}

	public String makeQuery(int page) {//쿼리 생성     ?page=3&perPageNum=10
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
						.queryParam("page", page)
						.queryParam("perPageNum", cri.getPerPageNum())
						.build();
		return uriComponents.toUriString();//"?page=3&perPageNum=10"
	}

	public String makeSearch(int page) {
		//쿼리 생성     ?page=3&perPageNum=10&searchType=Writer&keyword=길동

		String keyword = ((SearchCriteria) cri).getKeyword();
		try {
//			System.out.println("keyword: " + keyword);
			if (keyword == null) keyword = "";
			keyword = URLEncoder.encode(keyword, "UTF-8");//URL에 전달되는 한글 처리
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
						.queryParam("page", page)
						.queryParam("perPageNum", cri.getPerPageNum())
						.queryParam("searchType", ((SearchCriteria) cri).getSearchType())
						.queryParam("keyword", keyword)
						.build();
		return uriComponents.toUriString();//"?page=3&perPageNum=10"
	}


	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

}
