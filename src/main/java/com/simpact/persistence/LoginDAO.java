package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.MemberVO;

public interface LoginDAO {
	
	public int loginCheck(String email, String pass);//로그인 가능체크

	public String selectMemberNO(String email);	// 회원번호로 회원정보 가져오기
	
	public void latestDateUpdate(String memNO);	// 회원번호로 회원정보 가져오기
	
	public List<MemberVO> selectMemberinfo(String memNO);	// 회원번호로 회원정보 가져오기

	public int memberUpdate(MemberVO vo);	// 회원 정보 수정
	
	public String findpass(String email, String name, String tel);	// 비밀번호찾기
	
	public int uppasscheck(String memNO,String uppass);	// 비밀번호 통과 확인(수정용)
	
	public int delpasscheck(String memNO,String delpass);	// 비밀번호 통과 확인(삭제용)
	
}
