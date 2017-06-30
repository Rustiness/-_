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
@RequestMapping("/ad/e")
public class AdEmployeeController {

	/* 직원목록 */
	@RequestMapping("/list")
	public String list() {

		return "/admin/employee/list";
	}

	/* 직원 상세정보 */
	@RequestMapping("/read")
	public String read() {

		return "/admin/employee/read";
	}

	/* 직원등록 */
	@RequestMapping("/write")
	public String write() {

		return "/admin/employee/write";
	}

	/* 직원정보 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/admin/employee/modify";
	}

}
