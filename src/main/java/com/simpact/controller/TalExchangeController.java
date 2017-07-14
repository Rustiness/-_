package com.simpact.controller;

import com.simpact.domain.MemberVO;
import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;

import com.simpact.service.TalExchangeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:55
 */
@Controller
@RequestMapping("/te")
public class TalExchangeController {

	@Inject
	private TalExchangeService service;// DB서비스

	/* 재능교환 목록 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("cri") SearchCriteria cri, HttpServletRequest request, Model model)  throws Exception {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("clientMemberVO");

		cri.setConnMemNO(memberVO.getMemNO()); //자신의 아이디 저장
		model.addAttribute("listSearch", service.listSearch(cri));
		model.addAttribute("talDivHave", service.listTalDivHave(cri)); // 상대 보유재능
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalCount(service.listSearchCount(cri));// 끝페이지 번호를 조정
		model.addAttribute("pageMaker", maker);
		return "/client/talExc/list";
	}

/*	 재능교환 상세정보 
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest request, ) throws Exception {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("clientMemberVO");
		model.addAttribute("cri", cri);
		model.addAttribute("connMemVO", memberVO);
		talExcTimelineVO.setMemNO(memberVO.getMemNO());
		System.out.println(talExcTimelineVO.toString());
		//talExcTimelineVO = service.infoTalExcTimeLine(talExcTimelineVO); //접속자와 연결정보
		model.addAttribute("talExcTimelineVO", talExcTimelineVO);


		return "/client/talExc/read";
	}*/

}
