package com.simpact.persistence;

import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 6:01
 */
@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;


	@Override
	public int create(MemberVO vo) throws Exception { //회원정보 등록
		return sqlSession.insert("member.create", vo);
	}

	@Override
	public int selectEmail(String email) throws Exception { //이메일 중복체크

		System.out.println("email:" + email);
		return sqlSession.selectOne("member.idCheckSelect", email);
	}

	@Override
	public int selectNickName(String nickName) throws Exception {//닉네임중복체크
		System.out.println("nickName중복체크:" + nickName);
		return sqlSession.selectOne("member.nickNameCheckSelect", nickName);
	}

	@Override
	public String selectMsgMno(String email) throws Exception {//이메일로 회원번호 찾기

		return sqlSession.selectOne("member.selectMsgMno", email);
	}

	@Override
	public void msgCreate(MessengerVO vo) throws Exception { //찾은 회원번호로  메신저 테이블에 등록
		//System.out.println("");
		sqlSession.insert("messenger.msgCreate", vo);

	}

	/*@Override
	public String selectMesDF(String memNo) throws Exception {//회원번호로 메신저 구분번호 찾고 

		return sqlSession.selectOne("member.selectMesDF", memNo);
	}*/

	@Override
	public List<MessengerVO> listmsg() throws Exception { //메신저 목록 브라우저에 출력하기 위함

		return sqlSession.selectList("messenger.memMesInfo");
	}

	@Override
	public void createMES(MessengerVO vo) throws Exception {
		sqlSession.insert("messenger.insert",vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return sqlSession.update("member.memberUpdate",vo);
	}

	
	@Override
	public int messengerUpdate(MessengerVO vo) {
		return sqlSession.update("messenger.update",vo);
	}
	
	@Override
	public int uppasscheck(String memNO, String uppass) {
		Map<String, String> map = new HashMap<>();
		map.put("memNO", memNO);
		map.put("pass", uppass);
		return sqlSession.selectOne("member.passcheck",map);
	}

	@Override
	public int delpasscheck(String memNO, String delpass) {
		Map<String, String> map = new HashMap<>();
		map.put("memNO", memNO);
		map.put("pass", delpass);
		return sqlSession.update("member.delete",map);
	}

}
