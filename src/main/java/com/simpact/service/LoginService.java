package com.simpact.service;

import com.simpact.domain.MemberVO;

public interface LoginService {	//로그인관련 servive

	public int loginCheck(String email, String pass)throws Exception;	// 회원인지 체크
	
	public String selectMemberNO(String email)throws Exception;	// 회원이메일로 회원번호 가져오기

	public void latestDateUpdate(String memNO)throws Exception;	// 로그인 성공시 최근 접속일 최신화
	
	public MemberVO selectMemberinfo(String memNO)throws Exception;	// 회원번호로 회원정보 가져오기
	
	public int memberUpdate(MemberVO vo)throws Exception;	// 회원정보 수정

	public String findpass(String email, String name, String tel)throws Exception;	// 비밀번호찾기
	
	public int uppasscheck(String memNO,String uppass)throws Exception;	//정보수정을 위한 비밀번호 확인
	
	public int delpasscheck(String memNO,String delpass)throws Exception;	//삭제를 위한 비밀번호 확인

	
}
	
	