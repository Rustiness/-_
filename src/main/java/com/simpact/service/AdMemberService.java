package com.simpact.service;

import java.util.List;

import com.simpact.domain.MemberVO;
import com.simpact.domain.SearchCriteria;

public interface AdMemberService {
	
	public void modify(MemberVO vo)throws Exception;  //수정
	public void remove(int bno)throws Exception;	//삭제
	
	public MemberVO read(String memNO)throws Exception;	//상세보기
	
	public List<MemberVO> listSearchCriteria(SearchCriteria cri)throws Exception;	//목록 + 검색까지
	public int listSearchCount(SearchCriteria cri)throws Exception;  //페이지 카운트(10개씩 나누는거)
}
