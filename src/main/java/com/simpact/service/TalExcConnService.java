package com.simpact.service;

import com.simpact.domain.*;

import java.util.List;

public interface TalExcConnService {

	public TalExcConnVO read(String talExcConnNO) throws Exception;	/* 상세정보 */

	public List<TalExcConnVO> listCriteria(Criteria cri) throws Exception;	/* 페이징 */

	public List<TalDivVO> listTalDivCn(SearchCriteria cri) throws Exception;  /* 값 */

	public int listCountCriteria() throws Exception;	/* 페이징 */

	public List<TalExcConnVO> listSearch(SearchCriteria cri) throws Exception;	/* 페이징 */

	public int listSearchCount(SearchCriteria cri) throws Exception;	/* 검색 */

}
