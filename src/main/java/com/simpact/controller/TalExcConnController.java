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
@RequestMapping("/tec")
public class TalExcConnController {

	/* 재능교환신청 목록 */
	@RequestMapping("/list")
	public String list() {

		return "/client/talExcConn/list";
	}

	/* 재능교환신청 등록 */
	@RequestMapping("/app")
	public String app() {

		return "/client/talExcConn/apply";
	}

	/* 재능교환신청 상세정보 (신청인) */
	@RequestMapping("/infoSender")
	public String infoSender() {

		return "/client/talExcConn/infoSender";
	}

	/* 재능교환신청 상세정보 (수령인) */
	@RequestMapping("/infoRecipient")
	public String infoRecipient() {

		return "/client/talExcConn/infoRecipient";
	}

}
