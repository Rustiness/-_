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
@RequestMapping("/ad/tec")
public class AdTalExcConnController {

	/* 교환신청 목록 */
	@RequestMapping("/list")
	public String list() {
		return "/admin/talExcConn/list";
	}

	/* 교환신청 상세정보 */
	@RequestMapping("/read")
	public String read() {
		return "/admin/talExcConn/read";
	}

	/* 교환신청정보 수정 */
	@RequestMapping("/mod")
	public String mod() {
		return "/admin/talExcConn/modify";
	}

}
