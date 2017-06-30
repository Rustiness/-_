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
@RequestMapping("/ad/c")
public class AdCounselController {

	/* 고객문의 목록 */
	@RequestMapping("/list")
	public String list() {

		return "/admin/counsel/list";
	}

	/* 고객문의 상세정보 */
	@RequestMapping("/read")
	public String read() {

		return "/admin/counsel/read";
	}

	/* 고객문의정보 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/admin/counsel/modify";
	}

}
