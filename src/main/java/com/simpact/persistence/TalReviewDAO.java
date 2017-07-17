package com.simpact.persistence;

import java.util.List;
import java.util.Map;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalReviewVO;


public interface TalReviewDAO {

	public void create(TalReviewVO vo) throws Exception;// 추가

	public TalReviewVO read(String talReviewNO) throws Exception;//상세읽기

	public boolean update(TalReviewVO vo) throws Exception;//수정

	public boolean delete(String talReviewNO) throws Exception;

	public List<TalReviewVO> listPage(int page) throws Exception;//조회(여러행-리스트)

	public List<TalDivVO> talDivVO(Map<String, String> map) throws Exception;//재능카테고리 불러오기

	public List<TalReviewVO> listCriteria(Criteria cri) throws Exception;//전체레코드 수

	//전체레코드 수
	public int countPaging() throws Exception;

	public List<TalReviewVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public TalReviewVO nickread(String talReviewNO) throws Exception;//닉네임상세읽기

}
