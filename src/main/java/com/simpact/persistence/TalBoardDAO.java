package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.TalBoardVO;
import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalCategoryVO;
import com.simpact.domain.TalDivVO;

public interface TalBoardDAO {

	public int create(TalBoardVO vo) throws Exception;//내용추가

	public void createWant(TalDivVO talDivVO) throws Exception;// 신청의 항목 연결 등록

	public void createHave(TalDivVO talDivVO) throws Exception;// 신청의 항목 연결 등록

	public void talHaveUpdate(TalBoardVO vo) throws Exception;//수정 보유한 재능

	public void talWantUpdate(TalBoardVO vo) throws Exception;//수정 원하는 재능

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

	//재능항목 조회
	public List<TalDivVO> listTalDivHave(SearchCriteria cri) throws Exception;

	public List<TalDivVO> listTalDivWant(SearchCriteria cri) throws Exception;

	//특정 게시물 재능항목 조회
	public List<TalDivVO> readTalDivHave(String talDocNO) throws Exception;

	public List<TalDivVO> readTalDivWant(String talDocNO) throws Exception;

	//카테고리 조회
	public List<TalCategoryVO> categoryList() throws Exception;

	//항목조회
	public List<TalDivVO> divList() throws Exception;

	public List<TalDivVO> selCateCallDiv(String talCateDF) throws Exception; // 선택한 카테고리의 항목 목록 가져오기

	public List<TalBoardVO> selBeforeTal(String memNO) throws Exception; // 재능글 이전 게시글 가져오기

	public void deleteTal(String talDocNO) throws Exception; // 재능글 삭제

	public void deleteDivHave(String talDocNO) throws Exception; // 재능글 보유한 항목 삭제

	public void deleteDivWant(String talDocNO) throws Exception; // 재능글 원하는 항목 삭제


}
