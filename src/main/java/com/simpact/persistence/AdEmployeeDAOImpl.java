package com.simpact.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.EmployeeVO;
import com.simpact.domain.GradeDFVO;
import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import com.simpact.domain.PositionDFVO;
import com.simpact.domain.SearchCriteria;

@Repository
public class AdEmployeeDAOImpl implements AdEmployeeDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public MemberVO read(String memNO) throws Exception {
		return sqlsession.selectOne("Ademployee.read",memNO);
	}
	
	@Override
	public EmployeeVO reademp(String memNO) throws Exception {
		return sqlsession.selectOne("Ademployee.reademp",memNO);
	}


	@Override
	public List<MemberVO> readmsg(String memNO) throws Exception {
		return sqlsession.selectList("Ademployee.readmsg",memNO);
	}
	
	@Override
	public List<GradeDFVO> readgrade(String memNO) throws Exception {
		return sqlsession.selectList("Ademployee.readgrade",memNO);
	}
	
	@Override
	public List<PositionDFVO> readposition(String memNO) throws Exception {
		return sqlsession.selectList("Ademployee.readposition",memNO);
	}

	@Override
	public int update(EmployeeVO vo) throws Exception {
		return sqlsession.update("Ademployee.update",vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MemberVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlsession.selectList("Ademployee.listSearch",cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlsession.selectOne("Ademployee.listSearchCount",cri);
	}

	@Override
	public List<MessengerVO> listmsg() throws Exception {
		return sqlsession.selectList("messenger.memMesInfo");
	}

}
