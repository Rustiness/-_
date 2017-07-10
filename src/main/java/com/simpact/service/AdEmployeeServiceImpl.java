package com.simpact.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.simpact.domain.EmployeeVO;
import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import com.simpact.domain.SearchCriteria;
import com.simpact.persistence.AdEmployeeDAO;

@Service
public class AdEmployeeServiceImpl implements AdEmployeeService {

	@Inject
	AdEmployeeDAO dao;
	
	@Override
	public MemberVO read(String memNO) throws Exception {
		return dao.read(memNO);
	}
	
	@Override
	public EmployeeVO reademp(String memNO) throws Exception {
		return dao.reademp(memNO);
	}
	
	@Override
	public List<MemberVO> readmsg(String memNO) throws Exception {
		return dao.readmsg(memNO);
	}
	
	@Override
	public void modify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(int bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<MemberVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<MessengerVO> listmsg() throws Exception {
		return dao.listmsg();
	}

	
}
