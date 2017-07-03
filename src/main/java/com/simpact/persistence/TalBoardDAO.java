package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.TalBoardVO;
import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalCategoryVO;
import com.simpact.domain.TalDivVO;

public interface TalBoardDAO {

	public void create(TalBoardVO vo) throws Exception;//내용추가

	public void update(TalBoardVO vo) throws Exception;//수정

	public void delete(int talDocNO) throws Exception;//삭제

	public TalBoardVO read(String talDocNO) throws Exception;//조회 한행

	public List<TalBoardVO> listAll() throws Exception;//조회 여러행

	public List<TalBoardVO> listPage(int page) throws Exception;//조회 여러행-리스트

	public List<TalBoardVO> listCriteria(Criteria cri) throws Exception;//조회 여러행-리스트

	//전체레코드 수
	public int countPaging() throws Exception;

	//검색어 조회
	public List<TalBoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	//카테고리 조회
	public List<TalCategoryVO> categoryList() throws Exception;

	//항목조회
	public List<TalDivVO> divList() throws Exception;
}
