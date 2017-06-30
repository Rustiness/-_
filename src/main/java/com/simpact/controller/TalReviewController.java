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
@RequestMapping("/tr")
public class TalReviewController {

	/* 재능교환후기 목록 */
	@RequestMapping("/list")
	public String list() {

		return "/client/talReview/list";
	}

	/* 재능교환후기 등록 */
	@RequestMapping("/write")
	public String write() {

		return "/client/talReview/write";
	}

	/* 재능교환후기 상세정보 */
	@RequestMapping("/read")
	public String read() {

		return "/client/talReview/read";
	}

	/* 재능교환후기 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/client/talReview/modify";
	}

}
