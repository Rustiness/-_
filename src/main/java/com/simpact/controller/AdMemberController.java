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
@RequestMapping("/ad/m")
public class AdMemberController {

	/* 회원 목록 */
	@RequestMapping("/list")
	public String list() {

		return "/admin/member/list";
	}

	/* 회원 상세정보 */
	@RequestMapping("/read")
	public String read() {

		return "/admin/member/read";
	}

	/* 회원정보 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/admin/member/modify";
	}

}
