package com.simpact.controller;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpact.domain.CounselVO;
import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;
import com.simpact.service.CounselService;

/**
 * Created
 * User: 정지욱
 * Date: 2017-06-30
 * Time: 오후 4:55
 */
@Controller
@RequestMapping("/c")
public class CounselController {

	@Inject
	private CounselService service;

	/* 고객문의 목록 */
	@RequestMapping("/list")
	public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception { //게시물 목록 출력
		List<CounselVO> list = service.listSearchCriteria(cri);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", maker);

		return "client/counsel/list";
	}

	///////////////////////////////////////////////////////////////////
	//입력폼으로가라~
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String information_uploadget() throws Exception {
		return "client/counsel/write";
	}

	/* 고객문의 등록 */
	//입력한거 db에 넣어라~ 넣고나면 list목록으로 가라~
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String information_uploadpost(CounselVO vo, RedirectAttributes attr) throws Exception {
		service.regist(vo);
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/c/list";
	}

	/* 고객문의 상세정보 */
	//////////////////////////////////////////////////////////////////////////////////
	//게시물 읽기
	@RequestMapping("/read")
	public String readPage(String csNO, Model model, SearchCriteria cri) throws Exception {
		model.addAttribute("boardVO", service.read(csNO));
		model.addAttribute("cri", cri);
		return "client/counsel/read";//이동 JSP
	}

	/* 고객문의 수정 */
	//수정폼 보이기
	@RequestMapping(value = "/mod", method = RequestMethod.GET) //요청 URL
	public String upform2(String csNO, Model model, SearchCriteria cri) throws Exception {
		model.addAttribute("boardVO", service.read(csNO));
		model.addAttribute("cri", cri);
		return "client/counsel/modify";
	}

	//DB수정
	@RequestMapping(value = "/mod", method = RequestMethod.POST) //요청 URL
	public String update2(CounselVO vo, SearchCriteria cri, RedirectAttributes attr) throws Exception {
		service.modify(vo);

		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		attr.addAttribute("searchType", cri.getSearchType());
		attr.addAttribute("keyword", cri.getKeyword());
		attr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/c/list";
	}

	//DB삭제
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String removePage(String csNO,
	                         SearchCriteria cri,
	                         RedirectAttributes attr) throws Exception {
		//삭제작업
		service.remove(csNO);
		//수정 또는 삭제 후   원래(이전)페이지로 되돌아 가기 위해 page정보 전달.
		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		attr.addAttribute("searchType", cri.getSearchType());
		attr.addAttribute("keyword", cri.getKeyword());
		attr.addFlashAttribute("msg", "delete");

		return "redirect:/c/list";
	}
}
