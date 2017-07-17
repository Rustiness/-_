package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.EmployeeVO;
import com.simpact.domain.GradeDFVO;
import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import com.simpact.domain.PositionDFVO;
import com.simpact.domain.SearchCriteria;

public interface AdEmployeeDAO {

	public MemberVO read(String memNO) throws Exception;//상세보기직원기본정보

	public EmployeeVO reademp(String memNO) throws Exception;//상세보기직원추가정보

	public List<MemberVO> readmsg(String memNO) throws Exception;//상세보기메신저리스트

	public List<GradeDFVO> readgrade(String memNO) throws Exception;//상세보기 관리등급

	public List<PositionDFVO> readposition(String memNO) throws Exception;//상세보기 직챙정보

	public int update(EmployeeVO vo) throws Exception;//수정

	public void delete(int bno) throws Exception;// 삭제

	public List<MemberVO> listSearch(SearchCriteria cri) throws Exception;    // 목록보기 및 검색

	public int listSearchCount(SearchCriteria cri) throws Exception;    //페이징처리

	public List<MessengerVO> listmsg() throws Exception;//메신저목록 리스트 보기
}
