package com.simpact.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.simpact.domain.Criteria;
import com.simpact.domain.TalReviewReplyVO;
import com.simpact.persistence.TalExchangeReplyDAO;

@Service
public class TalExchageReplyServiceImpl implements TalExchageReplyService {
	//Controller ---> Service ---> DAO ---> xml

	@Inject
	private TalExchangeReplyDAO dao;

	@Override
	public void addReply(TalReviewReplyVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void modifyReply(TalReviewReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public int removeReply(String commExNO) throws Exception {
		return dao.delete(commExNO);
	}

	@Override
	public List<TalReviewReplyVO> listReply(String commExNO) throws Exception {
		return dao.list(commExNO);
	}

	@Override
	public List<TalReviewReplyVO> listReplyPage(String commExNO, Criteria cri) throws Exception {
		return dao.listPage(commExNO, cri);
	}

	@Override
	public int count(String commExNO) throws Exception {
		return dao.count(commExNO);
	}

}
