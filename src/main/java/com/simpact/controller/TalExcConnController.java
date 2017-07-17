package com.simpact.controller;

import com.simpact.domain.*;
import com.simpact.service.TalExcConnService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

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

	/* 재능교환신청 수신함 목록 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("cri") SearchCriteria cri, HttpServletRequest request, Model model) throws Exception {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("clientMemberVO");
//		System.out.println("memberVO.getMemNO() : " + memberVO.getMemNO());

		//자기에게로 전달된 신청목록만 표시
		//게시물의 자기 넘버목록 중 연결목록에 있는 리스트만 출력
		cri.setConnMemNO(memberVO.getMemNO());

		model.addAttribute("divList", service.listTalDivCn(cri));

		model.addAttribute("list", service.listSearch(cri));
		PageMaker maker = new PageMaker();
		maker.setCri(cri);

		maker.setTotalCount(service.listSearchCount(cri));// 끝페이지 번호를 조정
		model.addAttribute("pageMaker", maker);
		return "/client/talExcConn/list";
	}

	/* 재능교환신청 등록 페이지 이동 */
	@RequestMapping(value = "/app", method = RequestMethod.GET)
	public String applyGET(@ModelAttribute("cri") SearchCriteria cri, Model model, TalExcConnVO talExcConnVO) throws Exception {

//		System.out.println("cri ===> " + cri.toString());
//		System.out.println("model.toString() ===> " + model.toString());
//		System.out.println("talExcConnVO.toString() ===> " + talExcConnVO.toString());
		model.addAttribute("cri", cri);
		model.addAttribute("talExcConnVO", talExcConnVO);

		TalBoardVO talBoardVO = service.infoTalBoard(talExcConnVO.getTalDocNO()); //작성글 및 작성자 정보
//		System.out.println("talBoardVO" + talBoardVO);
		model.addAttribute("talBoardVO", talBoardVO);
		model.addAttribute("readDivHave", service.readTalDivHave(talExcConnVO.getTalDocNO())); //작성글의 작성자가 보유한 재능
		List<TalDivVO> listUseCate = service.listUseCate();
		List<TalDivVO> listAllCateDiv = service.listAllCateDiv();
		model.addAttribute("listUseCate", listUseCate);// 사용중 카테고리 목록
		model.addAttribute("listAllCateDiv", listAllCateDiv);// 전체 카테고리 및 항목 목록

		return "/client/talExcConn/apply";
	}

	/* 재능교환신청 등록 ~ 선택한 카테고리의 항목 목록 가져오기 */
	@RequestMapping(value = "/app/{selItemNO}", method = RequestMethod.POST)
	public @ResponseBody List<TalDivVO> listDiv(@PathVariable("selItemNO") String talCateDF) throws Exception {
//		System.out.println("조회할 기준 게시물번호:" + talCateDF);

		List<TalDivVO> list = service.selCateCallDiv(talCateDF); // 선택한 카테고리와 관련된 항목 목록

//		System.out.println(list.toString());

		return list;
	}

	/* 재능교환신청 등록 */
	@RequestMapping(value = "/app", method = RequestMethod.POST)
	public @ResponseBody String applyPOST(TalExcConnVO talExcConnVO, String talWantDiv, String talHaveDiv) throws Exception {

//		System.out.println("Title:" + talExcConnVO.getTitle());
//		System.out.println("Content:" + talExcConnVO.getContent());
//		System.out.println("memNO:" + talExcConnVO.getMemNO());
//		System.out.println("talWantDiv:" + talWantDiv);
//		System.out.println("talHaveDiv:" + talHaveDiv);
//		System.out.println(talExcConnVO.toString());

		//예외처리 ~ 재능 항목
		if (talExcConnVO.getTitle().length() == 0) {
			return "fail_title";
		}
		if (talExcConnVO.getContent().length() == 0) {
			return "fail_content";
		}
		if (talWantDiv.length() == 0) {
			return "fail_talWantDiv";
		}
		if (talHaveDiv.length() == 0) {
			return "fail_talHaveDiv";
		}

		TalDivVO talWantDivVO = new TalDivVO(); // 원하는 재능 항목 준비
		TalDivVO talHaveDivVO = new TalDivVO(); // 보유한 재능 항목 준비

		String[] talWantDivlist = talWantDiv.split(","); //"D_TD08,D_TD08,D_TD08";
//		for (int i = 0; i < talWantDivlist.length; i++) {
//			System.out.println("가져온값[" + i + "] : " + talWantDivlist[i]);
//		}

		TreeSet talWantDivTS = new TreeSet();
		for (int i = 0; i < talWantDivlist.length; i++) {
			talWantDivTS.add(talWantDivlist[i]);
		}

		String[] talHaveDivlist = talHaveDiv.split(","); //"D_TD08,D_TD08,D_TD08";
//		for (int i = 0; i < talHaveDivlist.length; i++) {
//			System.out.println("가져온값[" + i + "] : " + talHaveDivlist[i]);
//		}

		TreeSet talHaveDivTS = new TreeSet();
		for (int i = 0; i < talHaveDivlist.length; i++) {
			talHaveDivTS.add(talHaveDivlist[i]);
		}

		Iterator it; //이터레이터 생성
		int result;
		result = service.createConn(talExcConnVO); //재능 신청글 전송
		if (result == 1) {
			/* 원하는 재능 등록 시작 */
			talWantDivVO.setTalConnNO(talExcConnVO.getTalConnNO());
			it = talWantDivTS.iterator();
			while (it.hasNext()) {
				talWantDivVO.setTalDivDF((String) it.next());
//				System.out.println("talExcConnVO.getTalConnNO() : " + talWantDivVO.getTalConnNO());
//				System.out.println("talWantDivVO.getTalDivDF() : " + talWantDivVO.getTalDivDF());
				service.createWantCn(talWantDivVO);
			}
			/* 원하는 재능 등록 끝 */

			/* 보유한 재능 등록 시작 */
			talHaveDivVO.setTalConnNO(talExcConnVO.getTalConnNO());
			it = talHaveDivTS.iterator();
			while (it.hasNext()) {
				talHaveDivVO.setTalDivDF((String) it.next());
//				System.out.println("talExcConnVO.getTalConnNO() : " + talHaveDivVO.getTalConnNO());
//				System.out.println("talHaveDivVO.getTalDivDF() : " + talHaveDivVO.getTalDivDF());
				service.createHaveCn(talHaveDivVO);
			}
			/* 보유한 재능 등록 끝 */

			return "success";
		} else {
			return "fail";
		}
	}//applyPOST

	/* 재능교환신청 상세정보 (신청인) */
	@RequestMapping("/infoSender")
	public String infoSender() {
		return "/client/talExcConn/infoSender";
	}

	/* 재능교환신청 상세정보 (수령인) */
	@RequestMapping(value = "/infoRecipient", method = RequestMethod.GET)
	public String infoRecipientGET(TalExcConnVO talExcConnVO, Model model, SearchCriteria cri) throws Exception {
//		System.out.println("talExcConnVO.toString()" + talExcConnVO.toString());
		String talConnNO = talExcConnVO.getTalConnNO(); // 재능연결번호
		int result = 0;
//		System.out.println("talExcConnVO.getIsYNview()   " + talExcConnVO.getIsYNview());
		if ("N".equals(talExcConnVO.getIsYNview())) {
			result = service.updIsView(talExcConnVO); //글 읽은상태
//			System.out.println("글 읽은 상태 : " + result);
		}

		model.addAttribute("cri", cri);
		TalExcConnVO talResult = service.readReception(talConnNO); //신청글 정보
//		System.out.println(talResult.toString());
		model.addAttribute("talExcConnVO", talResult); //신청글 정보
		model.addAttribute("listSenderWantDiv", service.listSenderWantDiv(talConnNO)); //신청자가 원하는 재능 정보
		model.addAttribute("listSenderHaveDiv", service.listSenderHaveDiv(talConnNO)); //신청자가 보유한 재능 정보

		return "/client/talExcConn/infoRecipient";
	}//infoRecipientGET

	/* 재능교환신청 상세정보 (수령인) */
	@RequestMapping(value = "/infoRecipient", method = RequestMethod.POST)
	public @ResponseBody String infoRecipientPOST(TalExcConnVO talExcConnVO) throws Exception {
//		System.out.println("talConnNO : " + talExcConnVO.toString());
		int result = 0;
		if (talExcConnVO.getState().length() != 0 && "3".equals(talExcConnVO.getState())) {
			result = service.updTecAccept(talExcConnVO); //연결 수락
			if (result == 1) {
				return "successAccept"; //성공
			} else {
				return "failAccept"; //실패
			}
		} else if (talExcConnVO.getState().length() != 0 && "4".equals(talExcConnVO.getState())) {
			result = service.updTecRefuse(talExcConnVO); //연결 거절
			if (result == 1) {
				return "successRefuse"; //성공
			} else {
				return "failRefuse"; //실패
			}
		}
		return "failError"; // 조건 성립이 안될 때
	}
}
