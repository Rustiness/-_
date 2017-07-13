package com.simpact.service;

import java.util.List;


import com.simpact.domain.Criteria;
import com.simpact.domain.QuestionVO;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.CounselVO;

public interface CounselService {

	public void regist(CounselVO vo) throws Exception; //등록

	public void modify(CounselVO vo) throws Exception; //수정

	public void remove(String csNO) throws Exception; //삭제

	public CounselVO read(String csNO) throws Exception; //조회

	public List<CounselVO> listAll() throws Exception; //전체조회
	
	public List<QuestionVO> listcate() throws Exception; //카테고리조회
		
	public List<CounselVO> listCriteria(Criteria cri) throws Exception; //전체조회

	public int listCountCriteria() throws Exception;

	public List<CounselVO> listSearchCriteria(SearchCriteria cri) throws Exception;//닉네임 조회 여기에 합쳤음

	public int listSearchCount(SearchCriteria cri) throws Exception;
}
