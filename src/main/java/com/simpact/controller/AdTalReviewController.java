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
@RequestMapping("/ad/tr")
public class AdTalReviewController {

	/* 교환후기 목록 */
	@RequestMapping("/list")
	public String list() {
		return "/admin/talReview/list";
	}

	/* 교환후기 상세정보 */
	@RequestMapping("/read")
	public String read() {
		return "/admin/talReview/read";
	}

	/* 교환후기정보 수정 */
	@RequestMapping("/mod")
	public String mod() {
		return "/admin/talReview/modify";
	}

}
