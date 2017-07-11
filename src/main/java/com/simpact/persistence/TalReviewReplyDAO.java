package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.Criteria;
import com.simpact.domain.TalReviewReplyVO;

public interface TalReviewReplyDAO {
	
	public List<TalReviewReplyVO> list(String talReviewNO) throws Exception;
	
	public void create(TalReviewReplyVO vo) throws Exception;
	
	public void update(TalReviewReplyVO vo) throws Exception;
	
	public void delete(String commExNO) throws Exception;
	
	public List<TalReviewReplyVO> listPage(String talReviewNO, Criteria cri) throws Exception;//특정게시물에 대한 댓글

	public int count(String commExNO) throws Exception;//특정게시물에 대한 댓글
}
