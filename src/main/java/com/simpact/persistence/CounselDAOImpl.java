package com.simpact.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;



import com.simpact.domain.Criteria;
import com.simpact.domain.QuestionVO;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.CounselVO;

@Repository
public class CounselDAOImpl implements CounselDAO {

	
	@Inject
	private SqlSession sqlSession;
	@Override
	public void create(CounselVO vo) throws Exception {
		
		sqlSession.insert("csboard2.create", vo);
		
	}

	@Override
	public void update(CounselVO vo) throws Exception {
		sqlSession.update("csboard2.update", vo);
		
	}

	@Override
	public void delete(String csNO) throws Exception {

		sqlSession.delete("csboard2.delete",csNO);
	}

	@Override
	public CounselVO read(String csNO) throws Exception {

		return sqlSession.selectOne("csboard2.read", csNO);
	}

	@Override
	public List<CounselVO> listAll() throws Exception {

		return sqlSession.selectList("csboard2.listAll");
	}

	@Override
	public List<CounselVO> listPage(int page) throws Exception {

		if(page < 1) page=1;
		
		page = (page-1)*10;		
		
		RowBounds bounds = new RowBounds(page, 10);
		
		return sqlSession.selectList("csboard2.listPage",null, bounds);
	}

	@Override
	public List<CounselVO> listCriteria(Criteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("csboard2.listPage",null, bounds);
	}

	@Override
	public int countPaging() throws Exception {
		return sqlSession.selectOne("csboard2.countPaging");
	}

	@Override
	public List<CounselVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("csboard2.listSearch",cri,bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {		
		return sqlSession.selectOne("csboard2.listSearchCount",cri);
	}

	@Override
	public List<QuestionVO> listcate() throws Exception {

		return sqlSession.selectList("quest.cate");
	}

	@Override
	public List<CounselVO> listnick() throws Exception {
		return sqlSession.selectList("csboard2.nick");
	}
}
