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
@RequestMapping("/j")
public class JoinController {

	/* 가입약관 */
	@RequestMapping("/terms")
	public String terms() {

		return "/client/join/terms";
	}

	/* 회원정보 등록 */
	@RequestMapping("/confirm")
	public String confirm() {

		return "/client/join/confirm";
	}

	/* 회원가입 완료 */
	@RequestMapping("/res")
	public String result() {

		return "/client/join/result";
	}

}
