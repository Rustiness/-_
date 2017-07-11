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
	public TalBoardVO infoTalBoard(String talDocNO) throws Exception {
		return sqlSession.selectOne("talentBoard.read", talDocNO);
	}

	@Override
	public List<TalDivVO> readTalDivHave(String talDocNO) throws Exception {
		return sqlSession.selectList("talentBoard.readTalDivHave", talDocNO);
	}

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
	public TalExcConnVO readReception(String talConnNO) throws Exception {

		return sqlSession.selectOne("talExcConn.readReception", talConnNO);
	}

	@Override
	public List<TalDivVO> listSenderWantDiv(String talConnNO) throws Exception {
		return sqlSession.selectList("talExcConn.listSenderWantDiv", talConnNO);
	}

	@Override
	public List<TalDivVO> listSenderHaveDiv(String talConnNO) throws Exception {
		return sqlSession.selectList("talExcConn.listSenderHaveDiv", talConnNO);
	}

	@Override
	public int updIsView(TalExcConnVO talExcConnVO) throws Exception {
		return sqlSession.update("talExcConn.updIsView", talExcConnVO);
	}

	@Override
	public int updTecAccept(TalExcConnVO talExcConnVO) throws Exception {
		return sqlSession.update("talExcConn.updTecAccept", talExcConnVO);
	}

	@Override
	public int updTecRefuse(TalExcConnVO talExcConnVO) throws Exception {
		return sqlSession.update("talExcConn.updTecRefuse", talExcConnVO);
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
