package com.simpact.service;

import java.util.List;

import com.simpact.domain.CounselAnswerVO;
import com.simpact.domain.Criteria;

public interface CounselAnswerService {

	public void addReply(CounselAnswerVO vo) throws Exception;
	public void modifyReply(CounselAnswerVO vo) throws Exception;
	public void removeReply(String answerNO) throws Exception;
	
	public List<CounselAnswerVO> listReply(String csNO) throws Exception;
	public List<CounselAnswerVO> listReplyPage(String csNO, Criteria cri) throws Exception;
	public int count(String csNO) throws Exception;
	
}
