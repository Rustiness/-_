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
@RequestMapping("/tb")
public class TalBoardController {

	/* 재능글 목록 */
	@RequestMapping("/list")
	public String list() {

		return "/client/talBoard/list";
	}

	/* 재능글 등록 (1단계) */
	@RequestMapping("/write1s")
	public String write1s() {

		return "/client/talBoard/write1step";
	}

	/* 재능글 등록 (2단계) */
	@RequestMapping("/write2s")
	public String write2s() {

		return "/client/talBoard/write2step";
	}

	/* 재능글 등록 (등록 전) */
	@RequestMapping("/write")
	public String write() {

		return "/client/talBoard/write";
	}

	/* 재능글 상세정보 */
	@RequestMapping("/read")
	public String read() {

		return "/client/talBoard/read";
	}

	/* 재능글 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/client/talBoard/modify";
	}

	/* 재능글 수정 (보유한재능) */
	@RequestMapping("/modHave")
	public String modHave() {

		return "/client/talBoard/modifyHave";
	}

	/* 재능글 수정 (원하는재능) */
	@RequestMapping("/modWant")
	public String modWant() {

		return "/client/talBoard/modifyWant";
	}

}
