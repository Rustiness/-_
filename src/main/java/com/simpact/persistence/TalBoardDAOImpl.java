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

/**
 * Created
 * User: simpact
 * Date: 2017-07-17
 * Time: 오후 5:03
 */

@Repository
public class TalBoardDAOImpl implements TalBoardDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public int create(TalBoardVO vo) throws Exception {
		return sqlSession.insert("talentBoard.create", vo);
	}

	@Override
	public void createWant(TalDivVO talDivVO) throws Exception {
		sqlSession.insert("talentBoard.createWant", talDivVO);
	}

	@Override
	public void createHave(TalDivVO talDivVO) throws Exception {
		sqlSession.insert("talentBoard.createHave", talDivVO);
	}

	@Override
	public void delete(int talDocNO) throws Exception {
		sqlSession.delete("talentBoard.delete", talDocNO);
	}

	@Override
	public TalBoardVO read(String talDocNO) throws Exception {
		return sqlSession.selectOne("talentBoard.read", talDocNO);
	}

	@Override
	public List<TalBoardVO> listAll() throws Exception {
		return sqlSession.selectList("talentBoard.listAll");
	}

	@Override
	public List<TalBoardVO> listPage(int page) throws Exception {
		if (page <= 0)
			page = 1;

		page = page - 1 * 10;
		RowBounds bounds = new RowBounds(page, 10);

		return sqlSession.selectList("talentBoard.listAll", null, bounds);
	}

	@Override
	public List<TalBoardVO> listCriteria(Criteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("talentBoard.listAll", null, bounds);
	}

	@Override
	public int countPaging() throws Exception {
		return sqlSession.selectOne("talentBoard.countPaging");
	}

	@Override
	public List<TalBoardVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("talentBoard.listSearch", cri, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne("talentBoard.listSearchCount", cri);
	}

	@Override
	public List<TalCategoryVO> categoryList() throws Exception {
		return sqlSession.selectList("talentBoard.categoryList");
	}

	@Override
	public List<TalDivVO> divList() throws Exception {

		return sqlSession.selectList("talentBoard.divList");
	}

	@Override
	public void talHaveUpdate(TalBoardVO vo) throws Exception {
		sqlSession.selectList("talentBoard.talHaveUpdate", vo);

	}

	@Override
	public void talWantUpdate(TalBoardVO vo) throws Exception {
		sqlSession.selectList("talentBoard.talWantUpdate", vo);

	}

	@Override
	public List<TalDivVO> listTalDivHave(SearchCriteria cri) throws Exception {
		//RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		//List<TalDivVO> list = sqlsession.selectList("talentBoard.listTalDivHave", null, bounds);
		return sqlSession.selectList("talentBoard.listTalDivHave", cri);
	}

	@Override
	public List<TalDivVO> readTalDivHave(String talDocNO) throws Exception {
		return sqlSession.selectList("talentBoard.readTalDivHave", talDocNO);
	}

	@Override
	public List<TalDivVO> listTalDivWant(SearchCriteria cri) throws Exception {
		//RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		//List<TalDivVO> list = sqlsession.selectList("talentBoard.listTalDivWant", null, bounds);
		return sqlSession.selectList("talentBoard.listTalDivWant", cri);
	}

	@Override
	public List<TalDivVO> readTalDivWant(String talDocNO) throws Exception {
		return sqlSession.selectList("talentBoard.readTalDivWant", talDocNO);
	}

	@Override
	public List<TalDivVO> selCateCallDiv(String talCateDF) throws Exception {
		return sqlSession.selectList("talDivision.selCateCallDiv", talCateDF);
	}

	@Override
	public List<TalBoardVO> selBeforeTal(String memNO) throws Exception {
		return sqlSession.selectList("talentBoard.beforeTal", memNO);
	}

	@Override
	public void deleteTal(String talDocNO) throws Exception {
		sqlSession.update("talentBoard.deleteTal", talDocNO);

	}

	@Override
	public void deleteDivHave(String talDocNO) throws Exception {
		sqlSession.delete("talentBoard.removeDivHave", talDocNO);
	}

	@Override
	public void deleteDivWant(String talDocNO) throws Exception {
		sqlSession.delete("talentBoard.removeDivWant", talDocNO);
	}

}
