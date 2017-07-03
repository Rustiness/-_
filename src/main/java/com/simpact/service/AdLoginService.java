package com.simpact.service;

import com.simpact.domain.MemberVO;

public interface AdLoginService {//관리자 로그인 Service
	
	public int loginCheck(String email, String pass)throws Exception;	// 회원인지 체크
	
	public String selectMemberNO(String email)throws Exception;	// 회원이메일로 회원번호 가져오기

	public void latestDateUpdate(String memNO)throws Exception;	// 로그인 성공시 최근 접속일 최신화
	
	public MemberVO selectMemberinfo(String memNO)throws Exception;	// 회원번호로 회원정보 가져오기
}
