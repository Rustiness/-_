package com.simpact.controller;

import com.simpact.domain.*;
import com.simpact.service.TalExchangeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
	public String list(@ModelAttribute("cri") SearchCriteria cri, HttpServletRequest request, Model model) throws Exception {
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

	/* 재능교환 타임라인 상세정보 */
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String readGET(@ModelAttribute("cri") SearchCriteria cri, TalExcConnVO talExcConnVO, Model model, HttpServletRequest request, TalExcTimelineVO talExcTimelineVO) throws Exception {
		talExcConnVO.setMemNO(((MemberVO) request.getSession().getAttribute("clientMemberVO")).getMemNO());
		model.addAttribute("cri", cri);
		model.addAttribute("connMemVO", talExcConnVO);
		System.out.println("talExcConnVO : " + talExcConnVO.toString());
		//상대와 자신의 정보가져와야함.
		talExcTimelineVO.setMemNO(talExcConnVO.getMemNO());
		talExcTimelineVO.setMemNO(talExcConnVO.getTalConnNO());
		System.out.println("타임라인 입장 : " + talExcTimelineVO.toString());
		List<TalExcTimelineVO> listTalExcTimelineVO = service.infoTalExcTimeLine(talExcTimelineVO); //접속자와 연결정보
		model.addAttribute("listTalExcTimelineVO", listTalExcTimelineVO);

		return "/client/talExc/read";
	}

	/* 교환 타임라인 등록 */
	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public @ResponseBody String readPOST(@ModelAttribute("cri") SearchCriteria cri, TalExcConnVO talExcConnVO, Model model, HttpServletRequest request) throws Exception {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("clientMemberVO");
		model.addAttribute("cri", cri);
		System.out.println("멤부오" + memberVO.toString());
		TalExcTimelineVO talExcTimelineVO = new TalExcTimelineVO();
		talExcTimelineVO.setMemNO(talExcConnVO.getMemNO());
		talExcTimelineVO.setTalConnNO(talExcConnVO.getTalConnNO());
		talExcTimelineVO.setContent(talExcConnVO.getContent());
		System.out.println("등록 : " + talExcTimelineVO.toString());
		int result = 0;
		result = service.createTalExcTimeLine(talExcTimelineVO); // 타임라인 등록
		if (result == 1) {
			System.out.print("타임라인 등록 후 : "+ talExcTimelineVO.toString());
			//service.listTalExcTimeLine(talExcTimelineVO);
			//model.addAttribute("talExcTimelineVO", talExcTimelineVO);
			return "successSubmit"; /* 타임라인 등록 성공 */
		} else {
			return "failSubmit"; /* 타임라인 등록 실패 */
		}
	}


}
