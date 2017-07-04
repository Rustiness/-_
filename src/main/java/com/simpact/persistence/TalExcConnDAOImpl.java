package com.simpact.persistence;

import com.simpact.domain.*;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 6:01
 */
@Repository
public class TalExcConnDAOImpl implements TalExcConnDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public TalExcConnVO read(String talConnNO) throws Exception {

		return sqlSession.selectOne("talExcConn.read", talConnNO);
	}

	@Override
	public List<TalExcConnVO> listCriteria(Criteria cri) throws Exception {

		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("talExcConn.listAll", null, bounds);
	}

	@Override
	public int countPaging() throws Exception {
		return sqlSession.selectOne("talExcConn.countPaging");
	}

	@Override
	public List<TalExcConnVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		List<TalExcConnVO> list = sqlSession.selectList("talExcConn.listSearch", cri, bounds);
		return sqlSession.selectList("talExcConn.listSearch", cri, bounds);
	}

	@Override
	public List<TalDivVO> listTalDivCn(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		List<TalDivVO> list = sqlSession.selectList("talExcConn.listTalDivCn", null, bounds);

		return sqlSession.selectList("talExcConn.listTalDivCn", null, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne("talExcConn.listSearchCount", cri);
	}

}