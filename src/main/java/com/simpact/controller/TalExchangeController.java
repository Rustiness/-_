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
@RequestMapping("/te")
public class TalExchangeController {

	/* 재능교환 목록 */
	@RequestMapping("/list")
	public String list() {

		return "/client/talExc/list";
	}

	/* 재능교환 상세정보 */
	@RequestMapping("/read")
	public String read() {

		return "/client/talExc/read";
	}

}
