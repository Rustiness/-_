package com.simpact.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.Criteria;
import com.simpact.domain.TalReviewReplyVO;

/**
 * Created
 * User: simpact
 * Date: 2017-07-17
 * Time: 오후 5:03
 */

@Repository
public class TalReviewReplyDAOImpl implements TalReviewReplyDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<TalReviewReplyVO> list(String talReviewNO) throws Exception {
		return sqlSession.selectList("talreview.list", talReviewNO);
	}

	@Override
	public void create(TalReviewReplyVO vo) throws Exception {
		sqlSession.insert("talreview.create", vo);
	}

	@Override
	public void update(TalReviewReplyVO vo) throws Exception {
		sqlSession.update("talreview.update", vo);
	}

	@Override
	public int delete(String commExNO) throws Exception {
		return sqlSession.delete("talreview.delete", commExNO);
	}

	@Override
	public List<TalReviewReplyVO> listPage(String talReviewNO, Criteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("talreview.list", talReviewNO);
	}

	@Override
	public int count(String talReviewNO) throws Exception {
		return sqlSession.selectOne("talreview.count", talReviewNO);
	}

}
