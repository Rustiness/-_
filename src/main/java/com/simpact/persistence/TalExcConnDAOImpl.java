package com.simpact.persistence;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalExcConnVO;
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
	public int createConn(TalExcConnVO talExcConnVO) throws Exception {
		return sqlSession.insert("talExcConn.createConn", talExcConnVO);
	}

	@Override
	public void createWantCn(TalDivVO talDivVO) throws Exception {
		sqlSession.insert("talExcConn.createWantCn", talDivVO);
	}

	@Override
	public void createHaveCn(TalDivVO talDivVO) throws Exception {
		sqlSession.insert("talExcConn.createHaveCn", talDivVO);
	}

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


	@Override
	public List<TalDivVO> listUseCate() throws Exception {
		return sqlSession.selectList("talDivision.listCateUse");
	}

	@Override
	public List<TalDivVO> selCateCallDiv(String talCateDF) throws Exception {
		return sqlSession.selectList("talDivision.selCateCallDiv", talCateDF);
	}

	@Override
	public List<TalDivVO> listAllCateDiv() throws Exception {
		return sqlSession.selectList("talDivision.listAllCateDiv");
	}
}
