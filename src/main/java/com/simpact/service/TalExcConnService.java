package com.simpact.service;

import com.simpact.domain.*;

import java.util.List;

public interface TalExcConnService {


	public void regist(TalExcConnVO vo) throws Exception;	/* 등록 */

	public void modify(TalExcConnVO vo) throws Exception;	/* 수정 */

	public void remove(String talExcConnNO) throws Exception;	/* 삭제 */

	public TalExcConnVO read(String talExcConnNO) throws Exception;	/* 상세정보 */

	public TalExcConnVO nickname(String talExcConnNO) throws Exception; /* 상세정보 */

	public List<TalExcConnVO> listCriteria(Criteria cri) throws Exception;	/* 페이징 */

	public List<TalDivVO> listTalDivCn(SearchCriteria cri) throws Exception;  /* 값 */

	public int listCountCriteria() throws Exception;	/* 페이징 */

	public List<TalExcConnVO> listSearch(SearchCriteria cri) throws Exception;	/* 페이징 */

	public int listSearchCount(SearchCriteria cri) throws Exception;	/* 검색 */

}
