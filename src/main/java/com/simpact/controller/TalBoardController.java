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
	public String list(SearchCriteria cri, Model model, HttpSession session) throws Exception {// 게시물 목록 출력

		
		model.addAttribute("talDivHave", service.listTalDivHave(cri));
		model.addAttribute("talDivWant", service.listTalDivWant(cri));
		model.addAttribute("list", service.listSearch(cri));
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		
		maker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("categoryList", service.categoryList());
		model.addAttribute("pageMaker", maker);

		return "client/talBoard/list";
	}

	// 재능글 등록 (1단계)
	@RequestMapping(value = "/write1s", method = RequestMethod.GET)
	public String uploadFirstGET(TalBoardVO vo, HttpSession session,Model model) throws Exception {
		session.setAttribute("TalBoardVO", vo);
		model.addAttribute("listUseCate", service.categoryList());
		model.addAttribute("divList", service.divList());

		
		
		return "client/talBoard/write1step";
	}

	// 재능글 등록 (2단계)
	@RequestMapping(value = "/write2s", method = RequestMethod.POST)
	public String uploadSecond(TalBoardVO vo, HttpSession session,Model model) throws Exception {
		session.setAttribute("TalBoardVO", vo);
		model.addAttribute("listUseCate", service.categoryList());
		model.addAttribute("divList", service.divList());
		
		return "client/talBoard/write2step";
	}

	// 재능글 등록 (등록 전 확인페이지로 이동)
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String uploadThirdGET(TalBoardVO vo, HttpSession session) throws Exception {

		session.setAttribute("TalBoardVO", vo);

		return "client/talBoard/write";
	}

	// 재능글 등록
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String uploadThirdPOST(TalBoardVO vo, HttpSession session) throws Exception {

		service.regist(vo);

		return "redirect:list";
	}

	// 재능글 상세정보
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String listread(TalBoardVO vo, HttpServletRequest req, String talDocNO, String loginMem,SearchCriteria cri) throws Exception {
		req.setAttribute("cri", cri);
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		req.setAttribute("pageMaker", maker);
		
		req.setAttribute("readDivHave", service.readTalDivHave(talDocNO));
		req.setAttribute("readDivWant", service.readTalDivWant(talDocNO));
		req.setAttribute("TalBoardVO", service.read(talDocNO));
		req.setAttribute("loginMem", loginMem);
		//req.setAttribute("divList", service.listTalDiv(cri));
		return "client/talBoard/read";
	}

//	/* 재능글 수정 */
//사용 안하기로 함
//	@RequestMapping("/mod")
//	public String mod() {
//
//		return "/client/talBoard/modify";
//	}

	

	/* 재능글 수정 (보유한 재능 수정 페이지 이동) */
	@RequestMapping(value = "/modHave", method = RequestMethod.GET)
	public String updateHaveGET(Model model, TalBoardVO vo, String loginMem, String talDocNO,SearchCriteria cri) throws Exception {
		model.addAttribute("cri", cri);
		model.addAttribute("readDivHave", service.readTalDivHave(talDocNO));
		model.addAttribute("categoryList", service.categoryList());
		//model.addAttribute("divList", service.divList());
		model.addAttribute("TalBoardVO", vo);
		model.addAttribute("loginMem", loginMem);

		return "client/talBoard/modifyHave";
	}
	// 보유한 재능 수정
	@RequestMapping(value = "/modHave", method = RequestMethod.POST)
	public String updateHavePOST(HttpServletRequest req, TalBoardVO vo,String talDocNO,String loginMem,SearchCriteria cri) throws Exception {
		req.setAttribute("cri", cri);
		req.setAttribute("readDivHave", service.readTalDivHave(talDocNO));
		req.setAttribute("readDivWant", service.readTalDivWant(talDocNO));
         System.out.println(talDocNO);
         System.out.println(loginMem);
		service.talHavemodify(vo);
		req.setAttribute("TalBoardVO", service.read(talDocNO));
		req.setAttribute("loginMem", loginMem);

		return "client/talBoard/read";

	}

	/* 재능글 수정 (원하는 재능 수정 페이지 이동) */
	@RequestMapping(value = "/modWant", method = RequestMethod.GET)
	public String updateWant(Model model, TalBoardVO vo, String loginMem,String talDocNO,SearchCriteria cri) throws Exception {
		model.addAttribute("cri", cri);
		model.addAttribute("readDivWant", service.readTalDivWant(talDocNO));
		model.addAttribute("categoryList", service.categoryList());
		//model.addAttribute("divList", service.divList());
		model.addAttribute("TalBoardVO", vo);
		model.addAttribute("loginMem", loginMem);

		return "client/talBoard/modifyWant";
	}
	// 원하는 재능 수정
	@RequestMapping(value = "/modWant", method = RequestMethod.POST)
	public String updateWantPOST(HttpServletRequest req, TalBoardVO vo,String talDocNO,String loginMem,SearchCriteria cri) throws Exception {
		req.setAttribute("cri", cri);
		req.setAttribute("readDivHave", service.readTalDivHave(talDocNO));
		req.setAttribute("readDivWant", service.readTalDivWant(talDocNO));
         System.out.println(talDocNO);
         System.out.println(loginMem);
		service.talWantmodify(vo);
		req.setAttribute("TalBoardVO", service.read(talDocNO));
		req.setAttribute("loginMem", loginMem);

		return "client/talBoard/read";

	}
}
