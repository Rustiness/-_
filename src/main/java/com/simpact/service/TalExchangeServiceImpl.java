package com.simpact.service;

import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalExcTimelineVO;
import com.simpact.domain.TalExchangeVO;
import com.simpact.persistence.TalExchangeDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

/**
 * Created
 * User: kosta
 * Date: 2017-07-11
 * Time: 오후 2:34
 */
@Service
public class TalExchangeServiceImpl implements TalExchangeService {

	@Inject
	private TalExchangeDAO dao;

	@Override
	public List<TalExchangeVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<TalDivVO> listTalDivHave(SearchCriteria cri) throws Exception {
		return dao.listTalDivHave(cri);
	}

	@Override
	public int createTalExcTimeLine(TalExcTimelineVO talExcTimelineVO) throws Exception {
		return dao.createTalExcTimeLine(talExcTimelineVO);
	}

	@Override
	public List<TalExcTimelineVO> infoTalExcTimeLine(TalExcTimelineVO talExcTimelineVO) throws Exception {
		return dao.infoTalExcTimeLine(talExcTimelineVO);
	}
}
