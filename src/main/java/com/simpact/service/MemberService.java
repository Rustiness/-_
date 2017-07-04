package com.simpact.service;

import java.util.List;

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

	public void regist(MemberVO vo) throws Exception;//회원정보 등록(메신저 이름, 아이디빼고)

	public int idCheck(String email) throws Exception;//회원 이메일 중복체크

	public int nickNameCheck(String nickName) throws Exception;//회원 닉네임 중복체크

	public String findMemNo(String email) throws Exception;////이메일로 회원번호 찾기

	public void msgRegist(MessengerVO vo) throws Exception;//찾은 회원번호로  메신저 테이블NP_MemMes에 등록

	public String findMesDF(String memNo) throws Exception; //회원번호로 메신저 구분번호 찾고

	public List<MessengerVO> listmsg() throws Exception;
}
