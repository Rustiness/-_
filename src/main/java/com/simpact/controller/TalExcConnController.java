package com.simpact.controller;

import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;
import com.simpact.service.TalExcConnService;
import com.simpact.service.TalExchangeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:55
 */
@Controller
@RequestMapping("/tec")
public class TalExcConnController {

	@Inject
	private TalExcConnService service;// DB서비스

	/* 재능교환신청 목록 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		model.addAttribute("divList", service.listTalDivCn(cri));

		model.addAttribute("list", service.listSearch(cri));
		PageMaker maker = new PageMaker();
		maker.setCri(cri);

		maker.setTotalCount(service.listSearchCount(cri));// 끝페이지 번호를 조정
		model.addAttribute("pageMaker", maker);
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
