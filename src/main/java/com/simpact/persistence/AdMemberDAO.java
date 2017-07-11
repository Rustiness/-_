package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.MemberVO;
import com.simpact.domain.PersonDFVO;
import com.simpact.domain.SearchCriteria;

public interface AdMemberDAO {

	public MemberVO read(String memNO)throws Exception;//상세보기멤버
	
	public List<PersonDFVO> getGrade()throws Exception;//메신저항목얻어오기

	public List<MemberVO> readmsg(String memNO)throws Exception;//상세보기메신저
	
	public int update(MemberVO vo)throws Exception;//수정

	public void modifyTOEMP(String memNO)throws Exception;//회원분류 직원으로 변경시 기본값 넣어주기
	
	public List<MemberVO> listSearch(SearchCriteria cri)throws Exception;	// 목록보기 및 검색
	
	public int listSearchCount(SearchCriteria cri)throws Exception;	//페이징처리
	
	
	
	
}
