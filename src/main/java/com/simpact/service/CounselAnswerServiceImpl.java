package com.simpact.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.simpact.domain.CounselAnswerVO;
import com.simpact.domain.Criteria;
import com.simpact.persistence.CounselAnswerDAO;

@Service
public class CounselAnswerServiceImpl implements CounselAnswerService {

	@Inject
	private CounselAnswerDAO dao;

	@Override
	public void addReply(CounselAnswerVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void modifyReply(CounselAnswerVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void removeReply(String answerNO) throws Exception {
		dao.delete(answerNO);
	}

	@Override
	public List<CounselAnswerVO> listReply(String csNO) throws Exception {
		return dao.list(csNO);
	}

	@Override
	public List<CounselAnswerVO> listReplyPage(String csNO, Criteria cri) throws Exception {
		return dao.listPage(csNO, cri);
	}

	@Override
	public int count(String csNO) throws Exception {
		return dao.count(csNO);
	}


}
