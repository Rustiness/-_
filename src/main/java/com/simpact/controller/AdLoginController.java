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
@RequestMapping("/ad")
public class AdLoginController {

	/* 로그인 */
	@RequestMapping("/l")
	public String adminLogin() {

		return "/admin/login/confirm";
	}

}
