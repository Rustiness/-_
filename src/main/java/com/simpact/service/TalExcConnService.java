package com.simpact.service;

import com.simpact.domain.*;

import java.util.List;

public interface TalExcConnService {

	public TalBoardVO infoTalBoard(String talDocNO) throws Exception; /* 작성글 및 작성자 정보 */

	public  List<TalDivVO>readTalDivHave(String talDocNO) throws Exception; /* 작성글의 작성자가 보유한 재능 */

	public int createConn(TalExcConnVO talExcConnVO) throws Exception;	/* 신청 등록 */

	public void createWantCn(TalDivVO talDivVO) throws Exception; /* 신청의 원하는 항목 연결 등록 */

	public void createHaveCn(TalDivVO talDivVO) throws Exception; /* 신청의 보유한 항목 연결 등록 */

	public TalExcConnVO readReception(String talConnNO) throws Exception;	/* 신청글 상세정보 */

	public List<TalDivVO> listSenderWantDiv(String talConnNO) throws Exception;	/* 신청자가 원하는 재능 정보 */

	public List<TalDivVO> listSenderHaveDiv(String talConnNO) throws Exception;	/* 신청자가 보유한 재능 정보 */

	public int updIsView(TalExcConnVO talExcConnVO) throws Exception;	/* 수신자가 글을 읽음 */

	public int updTecAccept(TalExcConnVO talExcConnVO) throws Exception;	/* 연결 수락 */

	public int updTecRefuse(TalExcConnVO talExcConnVO) throws Exception;	/* 연결 거절 */

	public List<TalDivVO> listTalDivCn(SearchCriteria cri) throws Exception;  /* 값 */

	public List<TalExcConnVO> listSearch(SearchCriteria cri) throws Exception;	/* 페이징 */

	public int listSearchCount(SearchCriteria cri) throws Exception;	/* 검색 */

	public List<TalDivVO> listUseCate() throws Exception; // 사용하는 카테고리 목록 가져오기

	public List<TalDivVO> selCateCallDiv(String talCateDF) throws Exception; // 사용하는 카테고리 목록 가져오기

	public List<TalDivVO> listAllCateDiv() throws Exception; // 카테고리 및 항목 목록 가져오기
}
