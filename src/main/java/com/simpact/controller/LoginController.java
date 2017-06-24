package com.simpact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginController {
	@RequestMapping("/login")
	public String login() {
		return "/test_LRG/login";
	}

	@RequestMapping("/confirm")
	public String memCheck() {
		return "/test_LRG/confirm";
	}

	@RequestMapping("/agree")
	public String agree() {
		return "/test_LRG/agree";
	}
	
	@RequestMapping("/login_findinfo")
	public String login_findinfo() {
		return "/test_LRG/login_findinfo";
	}
	
	@RequestMapping("/mem_modify")
	public String mem_modify() {
		return "/test_LRG/mem_modify";
	}
}
