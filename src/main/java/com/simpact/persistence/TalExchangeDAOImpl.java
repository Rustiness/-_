package com.simpact.persistence;

import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalExchangeVO;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

/**
 * Created
 * User: kosta
 * Date: 2017-07-11
 * Time: 오후 2:33
 */
@Repository
public class TalExchangeDAOImpl implements TalExchangeDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<TalExchangeVO> listSearch(SearchCriteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("talExchange.listSearch", cri, bounds);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne("talExchange.listSearchCount", cri);
	}

	@Override
	public List<TalDivVO> listTalDivHave(SearchCriteria cri) throws Exception {
		return sqlSession.selectList("talExchange.listTalDivHave", cri);
	}
}
