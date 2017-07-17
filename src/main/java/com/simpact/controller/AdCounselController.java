package com.simpact.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpact.domain.CounselVO;
import com.simpact.domain.PageMaker;
import com.simpact.domain.QuestionVO;
import com.simpact.domain.SearchCriteria;
import com.simpact.service.CounselService;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:55
 */
@Controller
@RequestMapping("/ad/c")
public class AdCounselController {

	@Inject
	private CounselService service;

	/* 고객문의 목록 */
	@RequestMapping("/list")
	public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req) throws Exception { //게시물 목록 출력
		req.getSession().getAttribute("clientMemberVO");
		List<CounselVO> list = service.listSearchCriteria(cri);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", maker);
		return "/admin/counsel/list";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String information_uploadget(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req) throws Exception {
		req.getSession().getAttribute("clientMemberVO");
		List<QuestionVO> list = service.listcate();
		List<CounselVO> list2 = service.listSearchCriteria(cri);
		model.addAttribute("list", list);//문의항목
		model.addAttribute("list2", list2);//전체리스트 + 닉네임
//		System.out.println(list.toString());
//		System.out.println(list2.toString());
		return "admin/counsel/write";
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
	@RequestMapping("/read")
	public String readPage(String csNO, Model model, SearchCriteria cri) throws Exception {
		List<QuestionVO> list = service.listcate();
		model.addAttribute("list", list);
		model.addAttribute("boardVO", service.read(csNO));
		model.addAttribute("cri", cri);
		return "/admin/counsel/read";
	}

	/* 고객문의정보 수정 */
	@RequestMapping("/mod")
	public String upform2(String csNO, Model model, SearchCriteria cri) throws Exception {
		model.addAttribute("boardVO", service.read(csNO));
		model.addAttribute("cri", cri);
		return "/admin/counsel/modify";
	}

}
