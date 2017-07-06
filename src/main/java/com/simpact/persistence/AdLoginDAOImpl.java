package com.simpact.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.simpact.domain.MemberVO;

@Repository
public class AdLoginDAOImpl implements AdLoginDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public int loginCheck(String email, String pass) {
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("pass", pass);
		return sqlSession.selectOne("Adlogin.login", map);
	}

	@Override
	public String selectMemberNO(String email) {
		return sqlSession.selectOne("Adlogin.getMemNO", email);
	}

	@Override
	public void latestDateUpdate(String memNO) {
		sqlSession.update("Adlogin.latestDateUpdate");
	}

	@Override
	public List<MemberVO> selectMemberinfo(String memNO) {
		return sqlSession.selectList("Adlogin.getMeminfo", memNO);
	}


}
