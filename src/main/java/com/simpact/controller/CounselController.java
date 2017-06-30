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
@RequestMapping("/c")
public class CounselController {

	/* 고객문의 목록 */
	@RequestMapping("/list")
	public String list() {

		return "/client/counsel/list";
	}

	/* 고객문의 등록 */
	@RequestMapping("/write")
	public String write() {

		return "/client/counsel/write";
	}

	/* 고객문의 상세정보 */
	@RequestMapping("/read")
	public String read() {

		return "/client/counsel/read";
	}

	/* 고객문의 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/client/counsel/modify";
	}

}
