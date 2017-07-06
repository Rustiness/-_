package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.MemberVO;
import com.simpact.domain.SearchCriteria;

public interface AdMemberDAO {

	public MemberVO read(String memNO)throws Exception;//상세보기
	
	public void update(MemberVO vo)throws Exception;//수정
	
	public void delete(int bno)throws Exception;// 삭제

	public List<MemberVO> listSearch(SearchCriteria cri)throws Exception;	// 목록보기 및 검색
	
	public int listSearchCount(SearchCriteria cri)throws Exception;	//페이징처리
	
	
	
	
}
