package com.simpact.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.Criteria;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalCategoryVO;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalBoardVO;

@Repository
public class TalBoardDAOImpl implements TalBoardDAO {
	@Inject
	private SqlSession sqlsession;

	@Override
	public void create(TalBoardVO vo) throws Exception {
		sqlsession.insert("talentBoard.create", vo);
	}

	@Override
	public void update(TalBoardVO vo) throws Exception {
		sqlsession.update("talentBoard.update", vo);
	}

	@Override
	public void delete(int talDocNO) throws Exception {
		sqlsession.delete("talentBoard.delete", talDocNO);
	}

	@Override
	public TalBoardVO read(String talDocNO) throws Exception {
		return sqlsession.selectOne("talentBoard.read", talDocNO);
	}

	@Override
	public List<TalBoardVO> listAll() throws Exception {
		return sqlsession.selectList("talentBoard.listAll");
	}

	@Override
	public List<TalBoardVO> listPage(int page) throws Exception {
		if (page <= 0)
			page = 1;

		page = page - 1 * 10;
		RowBounds bounds = new RowBounds(page, 10);

		return sqlsession.selectList("talentBoard.listAll", null, bounds);
	}

	@Override
	public List<TalBoardVO> listCriteria(Criteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlsession.selectList("talentBoard.listAll", null, bounds);
	}

	@Override
	public int countPaging() throws Exception {
		return sqlsession.selectOne("talentBoard.countPaging");
	}

	@Override
	public List<TalBoardVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlsession.selectList("talentBoard.listSearch", cri, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlsession.selectOne("talentBoard.listSearchCount", cri);
	}

	@Override
	public List<TalCategoryVO> categoryList() throws Exception {
		return sqlsession.selectList("talentBoard.categoryList");
	}

	@Override
	public List<TalDivVO> divList() throws Exception {
		return sqlsession.selectList("talentBoard.divList");
	}

}
