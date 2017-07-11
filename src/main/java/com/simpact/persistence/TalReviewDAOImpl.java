package com.simpact.persistence;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalExchangelistVO;
import com.simpact.domain.TalReviewVO;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class TalReviewDAOImpl implements TalReviewDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void create(TalReviewVO vo) throws Exception {
		sqlSession.insert("rboard.create", vo);
	}

	@Override
	public TalReviewVO read(String talReviewNO) throws Exception {

		return sqlSession.selectOne("rboard.read", talReviewNO);
	}

	@Override
	public boolean update(TalReviewVO vo) throws Exception {
		int t = sqlSession.update("rboard.update", vo);
		if (t == 1) {
			System.out.println(vo);
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String talReviewNO) throws Exception {
		int t = sqlSession.delete("rboard.delete", talReviewNO);
		if (t == 1)
			return true;
		return false;
	}

	@Override
	public List<TalReviewVO> listPage(int page) throws Exception {
		if (page < 1)
			page = 1;
		page = (page - 1) * 10;

		RowBounds bounds = new RowBounds(page, 10);
		return sqlSession.selectList("rboard.listAll", null, bounds);
	}

	@Override
	public List<TalReviewVO> listCriteria(Criteria cri) throws Exception {

		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("rboard.listAll", null, bounds);
	}

	@Override
	public int countPaging() throws Exception {
		return sqlSession.selectOne("rboard.countPaging");
	}

	@Override
	public List<TalReviewVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		List<TalReviewVO> list = sqlSession.selectList("rboard.listSearch", cri, bounds);
		return sqlSession.selectList("rboard.listSearch", cri, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne("rboard.listSearchCount", cri);
	}

	@Override
	public TalReviewVO nickread(String talReviewNO) throws Exception {
		return sqlSession.selectOne("rboard.nickname", talReviewNO);
	}

	@Override
	public List<TalExchangelistVO> catelist() throws Exception {
		return sqlSession.selectList("rboardlist.catelist");
	}

}
