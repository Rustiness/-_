package com.simpact.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.simpact.domain.MemberVO;
import com.simpact.domain.SearchCriteria;
import com.simpact.persistence.AdMemberDAO;

@Service
public class AdMemberServiceImpl implements AdMemberService {

	@Inject
	AdMemberDAO dao;
	
	@Override
	public void modify(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(int bno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVO read(String memNO) throws Exception {
		return dao.read(memNO);
	}

	@Override
	public List<MemberVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
