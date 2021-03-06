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
	public int regist(MemberVO vo) throws Exception {
		return dao.create(vo);
	}

	@Override
	public int idCheck(String email) throws Exception {//이메일 중복체크
		return dao.selectEmail(email);
	}

	@Override
	public int nickNameCheck(String nickName) throws Exception {//닉네임 중복체크
//		System.out.println("nickName중복체크:" + nickName);
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
	public List<MessengerVO> listmsg() throws Exception { //메신저 목록 브라우저에 출력하기 위함
		return dao.listmsg();
	}

	@Override
	public void registMES(MessengerVO vo) throws Exception {
		dao.createMES(vo);
	}

	@Override
	public int memberUpdate(MemberVO vo) throws Exception {
		return dao.memberUpdate(vo);
	}

	@Override
	public int messengerUpdate(MessengerVO vo) throws Exception {
		return dao.messengerUpdate(vo);
	}

	@Override
	public int messengerDelete(MessengerVO vo) throws Exception {
		return dao.messengerDelete(vo);
	}

	@Override
	public int messengerAdd(MessengerVO vo) throws Exception {
		return dao.messengerAdd(vo);
	}

	@Override
	public int uppasscheck(String memNO, String uppass) throws Exception {
		return dao.uppasscheck(memNO, uppass);
	}

	@Override
	public int delpasscheck(String memNO, String delpass) throws Exception {
		return dao.delpasscheck(memNO, delpass);
	}
}
