package com.simpact.service;

import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalExcTimelineVO;
import com.simpact.domain.TalExchangeVO;

import java.util.List;

/**
 * Created
 * User: kosta
 * Date: 2017-07-11
 * Time: 오후 2:34
 */
public interface TalExchangeService {

	public List<TalExchangeVO> listSearch(SearchCriteria cri) throws Exception; /* 페이징 목록표시 */

	public int listSearchCount(SearchCriteria cri) throws Exception; /* 페이징 검색 게시물 수 */

	public List<TalDivVO> listTalDivHave(SearchCriteria cri) throws Exception; /* 상대 보유 재능 */

	public int createTalExcTimeLine(TalExcTimelineVO talExcTimelineVO) throws Exception; /* 타임라인 등록 */

	public List<TalExcTimelineVO> infoTalExcTimeLine(TalExcTimelineVO talExcTimelineVO) throws Exception; /* 교환 타임라인 정보 */
}
