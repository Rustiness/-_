package com.simpact.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.CounselAnswerVO;
import com.simpact.domain.Criteria;

@Repository
public class CounselAnswerDAOImpl implements CounselAnswerDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void create(CounselAnswerVO vo) throws Exception {

		sqlSession.insert("csreply.create", vo);
	}

	@Override
	public void update(CounselAnswerVO vo) throws Exception {
		sqlSession.update("csreply.update", vo);
	}

	@Override
	public void delete(String answerNO) throws Exception {
		sqlSession.delete("csreply.delete", answerNO);
	}

	@Override
	public List<CounselAnswerVO> list(String csNO) throws Exception {

		return sqlSession.selectList("csreply.list", csNO);
	}

	@Override
	public List<CounselAnswerVO> listPage(String csNO, Criteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("csreply.list", csNO, bounds);
	}

	@Override
	public int count(String csNO) throws Exception {
		return sqlSession.selectOne("csreply.count", csNO);
	}

}
