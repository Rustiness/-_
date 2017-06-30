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
@RequestMapping("/ad/ca")
public class AdCounselAnswerController {

	/* 고객문의답변 등록 */
	@RequestMapping("/write")
	public String write() {

		return "/admin/counsel/answer/write";
	}

	/* 고객문의답변 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/admin/counsel/answer/modify";
	}

}
