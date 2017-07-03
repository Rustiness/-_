package com.simpact.service;

import java.util.List;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalExchangeVO;

public interface TalExchangeService {

	// 게시물에 대한 조회,수정,삭제
	public void regist(TalExchangeVO vo) throws Exception;//입력

	public void modify(TalExchangeVO vo) throws Exception;//수정

	public void remove(String talExcNO) throws Exception;//삭제

	public TalExchangeVO read(String talExcNO) throws Exception;//상세읽기

	public TalExchangeVO nickname(String talExcNO) throws Exception;//상세읽기

	public List<TalExchangeVO> listCriteria(Criteria cri) throws Exception;//페이지관련

	public int listCountCriteria() throws Exception;//페이지관련

	public List<TalExchangeVO> listSearch(SearchCriteria cri) throws Exception;//페이지관련

	public int listSearchCount(SearchCriteria cri) throws Exception; //검색관련

}
