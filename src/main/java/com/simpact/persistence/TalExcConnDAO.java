package com.simpact.persistence;

import com.simpact.domain.*;

import java.util.List;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 6:01
 */
public interface TalExcConnDAO {

	public int createConn(TalExcConnVO talExcConnVO) throws Exception;// 신청 등록

	public void createWantCn(TalDivVO talDivVO) throws Exception;// 신청의 항목 연결 등록

	public void createHaveCn(TalDivVO talDivVO) throws Exception;// 신청의 항목 연결 등록

	public TalExcConnVO readReception(String talConnNO) throws Exception;	/* 신청글 상세정보 */

	public List<TalDivVO> listSenderWantDiv(String talConnNO) throws Exception;	/* 신청자가 원하는 재능 정보 */

	public List<TalDivVO> listSenderHaveDiv(String talConnNO) throws Exception;	/* 신청자가 보유한 재능 정보 */
	public List<TalExcConnVO> listCriteria(Criteria cri) throws Exception;//전체레코드 수

	//전체레코드 수
	public int countPaging() throws Exception;

	public List<TalExcConnVO> listSearch(SearchCriteria cri) throws Exception;

	public List<TalDivVO> listTalDivCn(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;


	public List<TalDivVO> listUseCate() throws Exception; // 사용하는 카테고리 목록 가져오기

	public List<TalDivVO> selCateCallDiv(String  talCateDF) throws Exception; // 선택한 카테고리의 항목 목록 가져오기

	public List<TalDivVO> listAllCateDiv() throws Exception; // 전체 카테고리 및 항목 목록 가져오기
}
