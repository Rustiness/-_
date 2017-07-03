package com.simpact.persistence;

import com.simpact.domain.MemberVO;

public interface AdLoginDAO {

	public int loginCheck(String email, String pass);//로그인 가능체크

	public String selectMemberNO(String email);    // 이메일로 회원번호 가져오기

	public void latestDateUpdate(String memNO);    // 로그인시 최근접속 최신화

	public MemberVO selectMemberinfo(String memNO);    // 회원번호로 회원정보 가져오기
}
