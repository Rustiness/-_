package com.simpact.service;

import java.util.List;

import com.simpact.domain.EmployeeVO;
import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import com.simpact.domain.SearchCriteria;

public interface AdEmployeeService {
	public void modify(MemberVO vo)throws Exception;  //수정
	public void remove(int bno)throws Exception;	//삭제
	
	public MemberVO read(String memNO)throws Exception;	//상세보기직원기본정보
	public EmployeeVO reademp(String memNO)throws Exception;	//상세보기직원추가정보
	public List<MemberVO> readmsg(String memNO)throws Exception;	//상세보기직원 메신저리스트
	
	public List<MemberVO> listSearchCriteria(SearchCriteria cri)throws Exception;	//목록 + 검색까지
	public int listSearchCount(SearchCriteria cri)throws Exception;  //페이지 카운트(10개씩 나누는거)
	
	public List<MessengerVO> listmsg() throws Exception; //기존에 있는 (DB) 메신저항목가져오기
}
