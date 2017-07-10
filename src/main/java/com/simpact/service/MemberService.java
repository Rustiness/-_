package com.simpact.service;

import java.util.List;

import org.springframework.ui.Model;

import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 6:02
 */
public interface MemberService {
	//브라우저 사용자(고객)입장에서 메소드를 정의.
	//컨트롤러에서 데이터 받아옴

	
	public int regist(MemberVO vo) throws Exception;//회원정보 등록(메신저 이름, 아이디빼고)

	public void registMES(MessengerVO vo) throws Exception;//(메신저vo)
	
	public int idCheck(String email) throws Exception;//회원 이메일 중복체크

	public int nickNameCheck(String nickName) throws Exception;//회원 닉네임 중복체크

	public String findMemNo(String email) throws Exception;////이메일로 회원번호 찾기

	public void msgRegist(MessengerVO vo) throws Exception;//찾은 회원번호로  메신저 테이블NP_MemMes에 등록

	public List<MessengerVO> listmsg() throws Exception; // 메신저 리스트
	
	public int memberUpdate(MemberVO vo) throws Exception;    // 회원정보 수정

	public int messengerUpdate(MessengerVO vo) throws Exception;    // 회원메신저정보 수정

	public int uppasscheck(String memNO, String uppass) throws Exception;    //정보수정을 위한 비밀번호 확인

	public int delpasscheck(String memNO, String delpass) throws Exception;    //삭제를 위한 비밀번호 확인
}
