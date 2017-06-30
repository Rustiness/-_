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
@RequestMapping("/ad/trr")
public class AdTalReviewReplyController {

	/* 교환후기댓글 목록 */
	@RequestMapping("/list")
	public String list() {

		return "/admin/talReview/reply/list";
	}

	/* 교환후기댓글 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/admin/talReview/reply/modify";
	}

}
