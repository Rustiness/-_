package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalExchangeVO;
import com.simpact.domain.TalExchangelistVO;


public interface TalReviewDAO {

	public void create(TalExchangeVO vo) throws Exception;// 추가

	public TalExchangeVO read(String talExcNO) throws Exception;//상세읽기

	public boolean update(TalExchangeVO vo) throws Exception;//수정

	public boolean delete(String talExcNO) throws Exception;

	public List<TalExchangeVO> listPage(int page) throws Exception;//조회(여러행-리스트)

	public List<TalExchangelistVO> catelist() throws Exception;//재능카테고리 읽어오기

	public List<TalExchangeVO> listCriteria(Criteria cri) throws Exception;//전체레코드 수

	//전체레코드 수
	public int countPaging() throws Exception;

	public List<TalExchangeVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public TalExchangeVO nickread(String talExcNO) throws Exception;//닉네임상세읽기

}
