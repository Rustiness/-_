package com.simpact.service;

import java.util.List;

import com.simpact.domain.Criteria;
import com.simpact.domain.TalReviewReplyVO;


public interface TalReviewReplyService {
	
	public void addReply(TalReviewReplyVO vo) throws Exception;

	public void modifyReply(TalReviewReplyVO vo) throws Exception;

	public void removeReply(String commExNO) throws Exception;

	public List<TalReviewReplyVO> listReply(String commExNO) throws Exception;

	public List<TalReviewReplyVO> listReplyPage(String commExNO, Criteria cri) throws Exception;

	public int count(String commExNO) throws Exception;
}
