package com.simpact.service;

import java.util.List;
import java.util.Map;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalReviewVO;

public interface TalReviewService {

	// 게시물에 대한 조회,수정,삭제
	public void regist(TalReviewVO vo) throws Exception;//입력

	public void modify(TalReviewVO vo) throws Exception;//수정

	public void remove(String talReviewNO) throws Exception;//삭제

	public TalReviewVO read(String talReviewNO) throws Exception;//상세읽기

	public TalReviewVO nickName(String talReviewNO) throws Exception;//상세읽기

	public List<TalReviewVO> listCriteria(Criteria cri) throws Exception;//페이지관련

	public int listCountCriteria() throws Exception;//페이지관련

	public List<TalReviewVO> listSearch(SearchCriteria cri) throws Exception;//페이지관련

	public int listSearchCount(SearchCriteria cri) throws Exception; //검색관련
		
	public List<TalDivVO> talhave(Map<String,String> map) throws Exception;

}
