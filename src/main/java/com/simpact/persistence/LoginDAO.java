package com.simpact.persistence;

import java.util.List;

import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;

public interface LoginDAO {
	
	public int loginCheck(String email, String pass);//로그인 가능체크

	public String selectMemberNO(String email);	// 회원번호로 회원정보 가져오기
	
	public void latestDateUpdate(String memNO);	// 회원번호로 회원정보 가져오기
	
	public MemberVO selectMemberinfo(String memNO);	// 회원번호로 회원정보 가져오기
	
	public List<MessengerVO> selectMembermsg(String memNO);	// 회원번호로 메신저리스트

	public String findpass(String email, String name, String tel);	// 비밀번호찾기
	
}
