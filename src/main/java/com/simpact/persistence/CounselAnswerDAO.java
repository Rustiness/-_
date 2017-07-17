package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.CounselAnswerVO;
import com.simpact.domain.Criteria;


public interface CounselAnswerDAO {

	public void create(CounselAnswerVO vo) throws Exception; // 추가

	public void update(CounselAnswerVO vo) throws Exception; // 수정

	public void delete(String answerNO) throws Exception; // 삭제

	public List<CounselAnswerVO> list(String csNO) throws Exception;

	public List<CounselAnswerVO> listPage(String csNO, Criteria cri) throws Exception;

	public int count(String csNO) throws Exception;
}
