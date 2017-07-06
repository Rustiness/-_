package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 6:01
 */
public interface MemberDAO {

	public int create(MemberVO vo) throws Exception;
	
	public void createMES(MessengerVO vo) throws Exception; //메신저 등록

	public int selectEmail(String email) throws Exception;//이메일 중복체크

	public int selectNickName(String nickName) throws Exception;//닉네임 중복체크

	public String selectMsgMno(String email) throws Exception;//이메일로 회원번호 찾기

	public void msgCreate(MessengerVO vo) throws Exception; //찾은 회원번호로  메신저 테이블에 등록

   	
	//public String selectMesDF(String memNo) throws Exception;//회원번호로 메신저 구분번호 찾고

	public List<MessengerVO> listmsg() throws Exception;//메신저목록 리스트 보기

}
