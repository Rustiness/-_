package com.simpact.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.simpact.domain.Criteria;
import com.simpact.domain.TalReviewReplyVO;
import com.simpact.persistence.TalReviewReplyDAO;

/**
 * Created
 * User: kosta
 * Date: 2017-07-11
 * Time: 오후 2:34
 */

@Service
public class TalReviewReplyServiceImpl implements TalReviewReplyService {
	//Controller ---> Service ---> DAO ---> xml

	@Inject
	private TalReviewReplyDAO dao;

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
