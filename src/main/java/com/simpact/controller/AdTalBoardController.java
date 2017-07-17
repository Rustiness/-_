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
@RequestMapping("/ad/tb")
public class AdTalBoardController {

	/* 재능글목록 */
	@RequestMapping("/list")
	public String list() {
		return "/admin/talBoard/list";
	}

	/* 재능글 상세정보 */
	@RequestMapping("/read")
	public String read() {
		return "/admin/talBoard/read";
	}

	/* 재능글정보 수정 */
	@RequestMapping("/mod")
	public String mod() {
		return "/admin/talBoard/modify";
	}

	/* 재능글정보 수정 (보유한재능) */
	@RequestMapping("/modHave")
	public String modHave() {
		return "/admin/talBoard/modifyHave";
	}

	/* 재능글정보 수정 (원하는재능) */
	@RequestMapping("/modWant")
	public String modWant() {
		return "/admin/talBoard/modifyWant";
	}
}
