package com.simpact.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.MemberVO;

@Repository
public class LoginDAOIpml implements LoginDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public int loginCheck(String email,String pass) {	//�α��� �������� Ȯ�� -- id �� pass�� ���Ͽ� ������ 1 ������ 0 return; 
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("pass", pass);
		return sqlSession.selectOne("login.login",map);
	}
	
	@Override
	public String selectMemberNO(String email) {		//�̸��Ϸ� ȸ������
		return sqlSession.selectOne("login.getMemNO", email);
	}

	@Override
	public MemberVO selectMemberinfo(String memNO) {		//ȸ����ȣ�� ȸ������ ��ü
		
		return sqlSession.selectOne("login.getMeminfo",memNO);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return sqlSession.update("login.memberUpdate",vo);
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
	public int uppasscheck(String memNO, String uppass) {
		Map<String, String> map = new HashMap<>();
		map.put("memNO", memNO);
			map.put("pass", uppass);
		return sqlSession.selectOne("login.passcheck",map);
	}
	
	@Override
	public int delpasscheck(String memNO, String delpass) {
		Map<String, String> map = new HashMap<>();
		map.put("memNO", memNO);
		map.put("pass", delpass);
		return sqlSession.update("login.delete",map); 
	}

	@Override
	public void latestDateUpdate(String memNO) {
		sqlSession.update("login.latestDateUpdate",memNO);
	}

}
