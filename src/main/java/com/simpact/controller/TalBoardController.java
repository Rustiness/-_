package com.simpact.controller;

import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalBoardVO;
import com.simpact.domain.TalDivVO;
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

	/* 재능교환신청 등록 ~ 선택한 카테고리의 항목 목록 가져오기 */
	@RequestMapping(value = "/write1s/{selItemNO}", method = RequestMethod.POST)
	public @ResponseBody List<TalDivVO> listDiv(@PathVariable("selItemNO") String talCateDF) throws Exception {
		System.out.println("조회할 기준 게시물번호:" + talCateDF);

		List<TalDivVO> list = service.selCateCallDiv(talCateDF); // 선택한 카테고리와
																	// 관련된 항목 목록

		System.out.println(list.toString());

		return list;
	}

	@RequestMapping(value = "/write1s", method = RequestMethod.POST)
	public @ResponseBody String uploadFirstPost(TalBoardVO vo, HttpSession session, Model model, String talHaveDiv)
			throws Exception {
		System.out.println("talHaveDiv:" + talHaveDiv);
		session.setAttribute("TalBoardVO", vo);
		session.setAttribute("talHaveDiv", talHaveDiv);

		model.addAttribute("listUseCate", service.categoryList());
		model.addAttribute("divList", service.divList());

		return "success";
	}

	// 재능글 등록 (2단계)
	@RequestMapping(value = "/write2s", method = RequestMethod.POST)
	public @ResponseBody String uploadSecondPost(TalBoardVO vo, HttpSession session, String talHaveDiv,
			String talWantDiv) throws Exception {
		session.setAttribute("TalBoardVO", vo);
		session.setAttribute("talHaveDiv", talHaveDiv);
		session.setAttribute("talWantDiv", talWantDiv);

		return "success";
	}

	@RequestMapping(value = "/write2s", method = RequestMethod.GET)
	public String uploadSecondGet(TalBoardVO vo, HttpSession session, Model model, String talHaveDiv) throws Exception {

		// session.setAttribute("TalBoardVO", vo);
		// session.setAttribute("talHaveDiv", talHaveDiv);
		model.addAttribute("listUseCate", service.categoryList());
		model.addAttribute("divList", service.divList());

		return "client/talBoard/write2step";
	}

	// 재능글 등록 (등록 전 확인페이지로 이동)
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String uploadThirdGET(TalBoardVO vo, HttpSession session, String talHaveDiv, String talWantDiv)
			throws Exception {

		return "client/talBoard/write";
	}

	// 재능글 등록
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String uploadThirdPOST(TalBoardVO vo, String talWantDiv, String talHaveDiv) throws Exception {

		TalDivVO talWantDivVO = new TalDivVO(); // 원하는 재능 항목 준비
		TalDivVO talHaveDivVO = new TalDivVO(); // 보유한 재능 항목 준비

		String[] talWantDivlist = talWantDiv.split(","); // "D_TD08,D_TD08,D_TD08";

		TreeSet talWantDivTS = new TreeSet();
		for (int i = 0; i < talWantDivlist.length; i++) {
			talWantDivTS.add(talWantDivlist[i]);
		}

		String[] talHaveDivlist = talHaveDiv.split(","); // "D_TD08,D_TD08,D_TD08";

		TreeSet talHaveDivTS = new TreeSet();
		for (int i = 0; i < talHaveDivlist.length; i++) {
			talHaveDivTS.add(talHaveDivlist[i]);
		}

		Iterator it; // 이터레이터 생성
		int result;
		result = service.regist(vo); // 재능 신청글 전송
		if (result == 1) {
			/* 원하는 재능 등록 시작 */
			talWantDivVO.setTalDocNO(vo.getTalDocNO());
			it = talWantDivTS.iterator();
			while (it.hasNext()) {
				talWantDivVO.setTalDivDF((String) it.next());
				System.out.println("talExcConnVO.getTalConnNO() : " + talWantDivVO.getTalConnNO());
				System.out.println("talWantDivVO.getTalDivDF() : " + talWantDivVO.getTalDivDF());
				service.createWant(talWantDivVO);
			}
			/* 원하는 재능 등록 끝 */

			/* 보유한 재능 등록 시작 */
			talHaveDivVO.setTalDocNO(vo.getTalDocNO());
			it = talHaveDivTS.iterator();
			while (it.hasNext()) {
				talHaveDivVO.setTalDivDF((String) it.next());
				System.out.println("talExcConnVO.getTalConnNO() : " + talHaveDivVO.getTalConnNO());
				System.out.println("talHaveDivVO.getTalDivDF() : " + talHaveDivVO.getTalDivDF());
				service.createHave(talHaveDivVO);
			}
			/* 보유한 재능 등록 끝 */

			return "redirect:/tb/list";
		} else {
			return "fail";
		}

	}

	// 재능글 상세정보
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String listread(TalBoardVO vo, HttpServletRequest req, String talDocNO, String loginMem, SearchCriteria cri)
			throws Exception {
		req.setAttribute("cri", cri);

		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		req.setAttribute("pageMaker", maker);

		req.setAttribute("readDivHave", service.readTalDivHave(talDocNO));
		req.setAttribute("readDivWant", service.readTalDivWant(talDocNO));
		req.setAttribute("TalBoardVO", service.read(talDocNO));
		req.setAttribute("loginMem", loginMem);
		// req.setAttribute("divList", service.listTalDiv(cri));
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
	public String updateHaveGET(Model model, TalBoardVO vo, String loginMem, String talDocNO, SearchCriteria cri)
			throws Exception {
		model.addAttribute("cri", cri);
		model.addAttribute("readDivHave", service.readTalDivHave(talDocNO));

		// model.addAttribute("divList", service.divList());
		model.addAttribute("TalBoardVO", vo);
		model.addAttribute("loginMem", loginMem);
		model.addAttribute("listUseCate", service.categoryList());
		model.addAttribute("divList", service.divList());

		return "client/talBoard/modifyHave";
	}
	// 보유한 재능 수정
	@RequestMapping(value = "/modHave", method = RequestMethod.POST)
	public String updateHavePOST(HttpServletRequest req, TalBoardVO vo, String talDocNO, String loginMem,
			SearchCriteria cri) throws Exception {
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
	public String updateWant(Model model, TalBoardVO vo, String loginMem, String talDocNO, SearchCriteria cri)
			throws Exception {
		model.addAttribute("cri", cri);
		model.addAttribute("readDivWant", service.readTalDivWant(talDocNO));

		// model.addAttribute("divList", service.divList());
		model.addAttribute("TalBoardVO", vo);
		model.addAttribute("loginMem", loginMem);

		return "client/talBoard/modifyWant";
	}
	// 원하는 재능 수정
	@RequestMapping(value = "/modWant", method = RequestMethod.POST)
	public String updateWantPOST(HttpServletRequest req, TalBoardVO vo, String talDocNO, String loginMem,
			SearchCriteria cri) throws Exception {
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
