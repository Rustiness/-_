package com.simpact.service;

import java.util.List;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalCategoryVO;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalBoardVO;

public interface TalBoardService {

	//브라우저 사용자(고객)입장에서 메소드를 정의
	public void regist(TalBoardVO vo) throws Exception;

	public void talHavemodify(TalBoardVO vo) throws Exception;

	public void talWantmodify(TalBoardVO vo) throws Exception;

	public void remove(int talDocNO) throws Exception;

	public TalBoardVO read(String talDocNO) throws Exception;

	public List<TalBoardVO> listAll() throws Exception;

	public List<TalBoardVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria() throws Exception;

	public List<TalBoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public List<TalCategoryVO> categoryList() throws Exception; // 카테고리 조회

	public List<TalDivVO> divList() throws Exception;

	public List<TalDivVO> listTalDivHave(SearchCriteria cri) throws Exception;

	public List<TalDivVO> readTalDivHave(String talDocNO) throws Exception; // 특정게시물 항목조회

	public List<TalDivVO> listTalDivWant(SearchCriteria cri) throws Exception;

	public List<TalDivVO> readTalDivWant(String talDocNO) throws Exception; // 특정 게시물 항목조회

}
