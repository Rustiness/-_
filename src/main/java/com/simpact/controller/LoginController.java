package com.simpact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:38
 */
@Controller
@RequestMapping("/l")
public class LoginController {

	/* 로그인 */
	@RequestMapping("/confirm")
	public String confirm() {

		return "/client/login/confirm";
	}

	/* 비밀번호 찾기 */
	@RequestMapping("/findPass")
	public String findPass() {

		return "/client/login/findPass";
	}

}
