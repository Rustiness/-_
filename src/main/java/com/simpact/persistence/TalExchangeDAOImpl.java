package com.simpact.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalExchangeVO;

@Repository
public class TalExchangeDAOImpl implements TalExchangeDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void create(TalExchangeVO vo) throws Exception {
		sqlSession.insert("rboard.create", vo);

	}

	@Override
	public TalExchangeVO read(String talExcNO) throws Exception {
	
		return sqlSession.selectOne("rboard.read", talExcNO);
	}

	@Override
	public boolean update(TalExchangeVO vo) throws Exception {
		int t = sqlSession.update("rboard.update", vo);
		if (t == 1) {
			System.out.println(vo);
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String talExcNO) throws Exception {
		int t = sqlSession.delete("rboard.delete", talExcNO);
		if (t == 1)
			return true;
		return false;
	}

	@Override
	public List<TalExchangeVO> listPage(int page) throws Exception {
		if (page < 1)
			page = 1;
		page = (page - 1) * 10;

		RowBounds bounds = new RowBounds(page, 10);
		return sqlSession.selectList("rboard.listAll", null, bounds);
	}

	@Override
	public List<TalExchangeVO> listCriteria(Criteria cri) throws Exception {

		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("rboard.listAll", null, bounds);
	}

	@Override
	public int countPaging() throws Exception {
		return sqlSession.selectOne("rboard.countPaging");
	}

	@Override
	public List<TalExchangeVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		List<TalExchangeVO> list = sqlSession.selectList("rboard.listSearch", cri, bounds);
		return sqlSession.selectList("rboard.listSearch", cri, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne("rboard.listSearchCount", cri);
	}

	@Override
	public TalExchangeVO nickread(String talExcNO) throws Exception {
		return sqlSession.selectOne("rboard.nickname", talExcNO);
	}

}
