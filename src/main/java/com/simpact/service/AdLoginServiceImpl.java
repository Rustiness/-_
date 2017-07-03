package com.simpact.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.simpact.domain.MemberVO;
import com.simpact.persistence.AdLoginDAO;

@Service
public class AdLoginServiceImpl implements AdLoginService {

	@Inject
	AdLoginDAO dao;

	@Override
	public int loginCheck(String email, String pass) throws Exception {
		return dao.loginCheck(email, pass);
	}

	@Override
	public String selectMemberNO(String email) throws Exception {
		return dao.selectMemberNO(email);
	}

	@Override
	public void latestDateUpdate(String memNO) throws Exception {
		dao.latestDateUpdate(memNO);
	}

	@Override
	public MemberVO selectMemberinfo(String memNO) throws Exception {
		return dao.selectMemberinfo(memNO);
	}

}
