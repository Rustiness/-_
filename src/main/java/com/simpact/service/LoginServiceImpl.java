package com.simpact.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.simpact.domain.MemberVO;
import com.simpact.persistence.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	private LoginDAO dao;

	@Override
	public int loginCheck(String email, String pass) throws Exception {
		return dao.loginCheck(email, pass);
	}

	@Override
	public String selectMemberNO(String email) throws Exception {
		return dao.selectMemberNO(email);
	}

	@Override
	public MemberVO selectMemberinfo(String memNO) throws Exception {
		return dao.selectMemberinfo(memNO);
	}

	@Override
	public int memberUpdate(MemberVO vo) throws Exception {
		return dao.memberUpdate(vo);
	}

	@Override
	public String findpass(String email, String name, String tel) throws Exception {

		return dao.findpass(email, name, tel);
	}

	@Override
	public int uppasscheck(String memNO, String uppass) throws Exception {
		return dao.uppasscheck(memNO, uppass);
	}

	@Override
	public int delpasscheck(String memNO, String delpass) throws Exception {
		return dao.delpasscheck(memNO, delpass);
	}

	@Override
	public void latestDateUpdate(String memNO) throws Exception {
		dao.latestDateUpdate(memNO);
	}

}
