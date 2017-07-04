package com.simpact.persistence;

import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

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
	public void create(MemberVO vo) throws Exception {
		System.out.println(vo.toString());
		sqlSession.insert("member.create", vo);
	}

	@Override
	public int selectEmail(String email) throws Exception {

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
		sqlSession.insert("member.msgCreate", vo);

	}

	@Override
	public String selectMesDF(String memNo) throws Exception {//회원번호로 메신저 구분번호 찾고 

		return sqlSession.selectOne("member.selectMesDF", memNo);
	}

	@Override
	public List<MessengerVO> listmsg() throws Exception {

		return sqlSession.selectList("messenger.memMesInfo");
	}


}
