package com.simpact.service;

import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import com.simpact.persistence.MemberDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 6:02
 */
@Service
public class MemberServiceImpl implements MemberService {

	//Controller ----> Service ----> DAO  -----> XML(sql문)

	@Inject
	private MemberDAO dao;

	@Override
	public void regist(MemberVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public int idCheck(String email) throws Exception {
		return dao.selectEmail(email);
	}

	@Override
	public int nickNameCheck(String nickName) throws Exception {
		System.out.println("nickName:" + nickName);
		return dao.selectNickName(nickName);
	}

	@Override
	public String findMemNo(String email) throws Exception {//이메일로 회원번호 찾기
		return dao.selectMsgMno(email);
	}

	@Override
	public void msgRegist(MessengerVO vo) throws Exception { //찾은 회원번호로  메신저 테이블NP_MemMes에 등록
		dao.msgCreate(vo);
	}

	@Override
	public String findMesDF(String memNo) throws Exception { //회원번호로 메신저 구분번호 찾고 
		return dao.selectMesDF(memNo);
	}

	@Override
	public List<MessengerVO> listmsg() throws Exception {
		return dao.listmsg();
	}


}
