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
@RequestMapping("/ad/te")
public class AdTalExcController {

	/* 교환 목록 */
	@RequestMapping("/list")
	public String list() {

		return "/admin/talExc/list";
	}

	/* 교환 상세정보 */
	@RequestMapping("/read")
	public String read() {

		return "/admin/talExc/read";
	}

	/* 교환정보 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/admin/talExc/modify";
	}

}
