package com.simpact.service;

import java.util.List;

import com.simpact.domain.MemberVO;
import com.simpact.domain.PersonDFVO;
import com.simpact.domain.SearchCriteria;

public interface AdMemberService {
	
	public int modify(MemberVO vo)throws Exception;  //수정
	public void modifyTOEMP(String memNO)throws Exception;  //수정
	
	public MemberVO read(String memNO)throws Exception;	//상세보기(멤버)
	public List<PersonDFVO> getGrade()throws Exception;	//회원분류 얻어오기
	public List<MemberVO> readmsg(String memNO)throws Exception;	//상세보기(메신저)
	
	public List<MemberVO> listSearchCriteria(SearchCriteria cri)throws Exception;	//목록 + 검색까지
	public int listSearchCount(SearchCriteria cri)throws Exception;  //페이지 카운트(10개씩 나누는거)
}
