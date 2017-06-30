package com.simpact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:55
 */
@Controller
@RequestMapping("/m")
public class MemberController {

	/* 비밀번호 확인 */
	@RequestMapping("/chkPass")
	public String chkPass() {

		return "/client/member/chkPass";
	}

	/* 회원 상세정보 */
	@RequestMapping("/info")
	public String info() {

		return "/client/member/info";
	}

	/* 회원정보 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/client/member/modify";
	}

	/* 회원 탈퇴 */
	@RequestMapping("/withdrawal")
	public String withdrawal() {

		return "/client/member/withdrawal";
	}

}
