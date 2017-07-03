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

	public TalExcConnVO read(String talConnNO) throws Exception;//상세읽기

	public List<TalExcConnVO> listCriteria(Criteria cri) throws Exception;//전체레코드 수

	//전체레코드 수
	public int countPaging() throws Exception;

	public List<TalExcConnVO> listSearch(SearchCriteria cri) throws Exception;

	public List<TalDivVO> listTalDivCn(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;


}
