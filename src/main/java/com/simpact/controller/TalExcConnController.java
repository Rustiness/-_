package com.simpact.controller;

import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.service.TalExcConnService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

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

	/* 재능교환신청 등록 페이지 이동 */
	@RequestMapping(value="/app", method=RequestMethod.GET)
	public String applyGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		List<TalDivVO> listUseCate = service.listUseCate();
		List<TalDivVO> listAllCateDiv = service.listAllCateDiv();
		model.addAttribute("listUseCate", listUseCate);// 사용중 카테고리 목록
		model.addAttribute("listAllCateDiv", listAllCateDiv);// 전체 카테고리 및 항목 목록

		return "/client/talExcConn/apply";
	}

	/* 재능교환신청 등록 ~ 선택한 카테고리의 항목 목록 가져오기 */
	@RequestMapping(value = "/app/{selItemNO}", method = RequestMethod.POST)
	public @ResponseBody List<TalDivVO> listDiv(@PathVariable("selItemNO") String talCateDF) throws Exception {
		System.out.println("조회할 기준 게시물번호:" + talCateDF);

		List<TalDivVO> list = service.selCateCallDiv(talCateDF); // 선택한 카테고리와 관련된 항목 목록

		System.out.println(list.toString());

		return list;
	}

	/* 재능교환신청 등록 */
	@RequestMapping(value="/app", method=RequestMethod.POST)
	public String applyPOST() throws Exception {

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
