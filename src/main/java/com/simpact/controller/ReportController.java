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
@RequestMapping("/r")
public class ReportController {

	/* 신고글 등록 */
	@RequestMapping("/write")
	public String write() {

		return "/client/report/write";
	}

}
