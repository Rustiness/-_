package com.simpact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: ���� 4:38
 */
@Controller
@RequestMapping("/l")
public class LoginController {

	/* �α��� */
	@RequestMapping("/confirm")
	public String confirm() {

		return "/client/login/confirm";
	}

	/* ��й�ȣ ã�� */
	@RequestMapping("/findPass")
	public String findPass() {

		return "/client/login/findPass";
	}

}
