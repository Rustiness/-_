 package com.simpact.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalBoardVO;
import com.simpact.service.TalBoardService;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:55
 */
@Controller
@RequestMapping("/tb")
public class TalBoardController {

	@Inject
	private TalBoardService service;// DB관련 작업

	// 재능글 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(SearchCriteria cri, Model model) throws Exception {// 게시물
																			// 목록
																			// 출력

		// model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearch(cri));
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		// maker.setTotalCount(service.listCountCriteria());
		maker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("categoryList", service.categoryList());
		model.addAttribute("pageMaker", maker);

		return "client/talBoard/list";

	}

	// 재능글 등록 (1단계)
	@RequestMapping(value = "/write1s", method = RequestMethod.GET)
	public String uploadFirstGET(Model model, SearchCriteria cri, HttpSession session, TalBoardVO vo,
			HttpServletRequest req) throws Exception {

		model.addAttribute("categoryList", service.categoryList());
		model.addAttribute("divList", service.divList());
		model.addAttribute("cri", cri);
		model.addAttribute("TalentListVO", vo);
		return "client/talBoard/write1step";
	}

	@RequestMapping(value = "/write1s", method = RequestMethod.POST)
	public String uploadFirstPOST(TalBoardVO vo, HttpSession session, HttpServletRequest req, RedirectAttributes attr)
			throws Exception {

		session.setAttribute("TalentListVO", vo);

		return "redirect:/tb/write2s";

	}

	// 재능글 등록 (2단계)
	@RequestMapping(value = "/write2s", method = RequestMethod.GET)
	public String uploadSecondGET() throws Exception {
		return "client/talBoard/write2step";
	}

	@RequestMapping(value = "/write2s", method = RequestMethod.POST)
	public String uploadSecond(TalBoardVO vo, HttpServletRequest req, HttpSession session) throws Exception {

		req.setAttribute("TalentListVO", vo);

		return "redirect:/tb/write";
	}

	// 재능글 등록 (등록 전)
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String uploadThirdGET(TalBoardVO vo, HttpServletRequest req) throws Exception {

		req.setAttribute("TalentListVO", vo);

		return "client/talBoard/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String uploadThirdPOST(TalBoardVO vo) throws Exception {

		service.regist(vo);

		return "redirect:/tb/list";
	}

	// 재능글 상세정보
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String listread(TalBoardVO vo, HttpServletRequest req, String talDocNO) throws Exception {

		req.setAttribute("TalentListVO", service.read(talDocNO));

		return "client/talBoard/read";
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
