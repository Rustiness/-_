package com.simpact.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.EmployeeVO;
import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import com.simpact.domain.SearchCriteria;

@Repository
public class AdEmployeeDAOImpl implements AdEmployeeDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public MemberVO read(String memNO) throws Exception {
		return sqlsession.selectOne("employee.read",memNO);
	}
	
	@Override
	public EmployeeVO reademp(String memNO) throws Exception {
		return sqlsession.selectOne("employee.reademp",memNO);
	}


	@Override
	public List<MemberVO> readmsg(String memNO) throws Exception {
		return sqlsession.selectList("employee.readmsg",memNO);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MemberVO> listSearch(SearchCriteria cri) throws Exception {
		return sqlsession.selectList("employee.listSearch",cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlsession.selectOne("employee.listSearchCount",cri);
	}

	@Override
	public List<MessengerVO> listmsg() throws Exception {
		return sqlsession.selectList("messenger.memMesInfo");
	}

}
