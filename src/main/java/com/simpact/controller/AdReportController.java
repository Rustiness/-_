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
@RequestMapping("/ad/r")
public class AdReportController {

	/* 신고 목록 */
	@RequestMapping("/list")
	public String list() {
		return "/admin/report/list";
	}

	/* 신고 상세정보 */
	@RequestMapping("/read")
	public String read() {
		return "/admin/report/read";
	}

}
