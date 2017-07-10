package com.simpact.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;

@Repository
public class LoginDAOIpml implements LoginDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public int loginCheck(String email,String pass) {	//로그인 가능한지 확인 -- id 와 pass를 비교하여 있으면 1 없으면 0 return;
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("pass", pass);
		return sqlSession.selectOne("login.login",map);
	}

	@Override
	public String selectMemberNO(String email) {		//이메일로 회원정보
		return sqlSession.selectOne("login.getMemNO", email);
	}

	@Override
	public MemberVO selectMemberinfo(String memNO) {		//회원번호로 회원정보 전체
		return sqlSession.selectOne("login.getMeminfo",memNO);
	}
	
	@Override
	public List<MessengerVO> selectMembermsg(String memNO) {		//회원번호로 메신저리스트
		return sqlSession.selectList("login.getMembermsg",memNO);
	}


	@Override
	public String findpass(String email, String name, String tel) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("name", name);
		map.put("tel", tel);
		return sqlSession.selectOne("login.findpass", map);
	}

	@Override
	public void latestDateUpdate(String memNO) {
		sqlSession.update("login.latestDateUpdate",memNO);
	}

}
