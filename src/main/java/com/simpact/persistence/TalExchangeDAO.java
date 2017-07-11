package com.simpact.persistence;

import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalExchangeVO;

import java.util.List;

/**
 * Created
 * User: kosta
 * Date: 2017-07-11
 * Time: 오후 2:33
 */
public interface TalExchangeDAO {

	public List<TalExchangeVO> listSearch(SearchCriteria cri) throws Exception; /* 페이징 목록표시 */

	public int listSearchCount(SearchCriteria cri) throws Exception; /* 페이징 검색 게시물 수 */

	public List<TalDivVO> listTalDivHave(SearchCriteria cri) throws Exception; /* 상대 보유 재능 */
}
