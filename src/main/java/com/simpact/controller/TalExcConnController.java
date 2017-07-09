package com.simpact.controller;

import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalExcConnVO;
import com.simpact.service.TalExcConnService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
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
	public @ResponseBody String applyPOST(TalExcConnVO talExcConnVO, String talWantDiv, String talHaveDiv) throws Exception {
		talExcConnVO.setMemNO("MEM_A00001");
		talExcConnVO.setTalDocNO("TB_A00005");

		System.out.println("Title:" + talExcConnVO.getTitle());
		System.out.println("Content:" + talExcConnVO.getContent());
		System.out.println("memNO:" + talExcConnVO.getMemNO());
		System.out.println("talWantDiv:" + talWantDiv);
		System.out.println("talHaveDiv:" + talHaveDiv);
		System.out.println(talExcConnVO.toString());

		//예외처리 ~ 재능 항목
		if(talExcConnVO.getTitle().length() == 0){
			return "fail_title";
		}
		if(talExcConnVO.getContent().length() == 0){
			return "fail_content";
		}
		if(talWantDiv.length() == 0){
			return "fail_talWantDiv";
		}
		if(talHaveDiv.length() == 0){
			return "fail_talHaveDiv";
		}

		TalDivVO talWantDivVO = new TalDivVO(); // 원하는 재능 항목 준비
		TalDivVO talHaveDivVO = new TalDivVO(); // 보유한 재능 항목 준비

		String[] talWantDivlist = talWantDiv.split(","); //"D_TD08,D_TD08,D_TD08";
		for (int i = 0; i < talWantDivlist.length; i++) {
			System.out.println("가져온값[" + i + "] : " + talWantDivlist[i]);
		}

		TreeSet talWantDivTS = new TreeSet();
		for (int i = 0; i < talWantDivlist.length; i++) {
			talWantDivTS.add(talWantDivlist[i]);
		}

		String[] talHaveDivlist = talHaveDiv.split(","); //"D_TD08,D_TD08,D_TD08";
		for (int i = 0; i < talHaveDivlist.length; i++) {
			System.out.println("가져온값[" + i + "] : " + talHaveDivlist[i]);
		}

		TreeSet talHaveDivTS = new TreeSet();
		for (int i = 0; i < talHaveDivlist.length; i++) {
			talHaveDivTS.add(talHaveDivlist[i]);
		}

		Iterator it; //이터레이터 생성
		int result;
		result = service.createConn(talExcConnVO); //재능 신청글 전송
		if(result == 1){
			/* 원하는 재능 등록 시작 */
			talWantDivVO.setTalConnNO(talExcConnVO.getTalConnNO());
			it = talWantDivTS.iterator();
			while (it.hasNext()) {
				talWantDivVO.setTalDivDF((String) it.next());
				System.out.println("talExcConnVO.getTalConnNO() : " + talWantDivVO.getTalConnNO());
				System.out.println("talWantDivVO.getTalDivDF() : " + talWantDivVO.getTalDivDF());
				service.createWantCn(talWantDivVO);
			}
			/* 원하는 재능 등록 끝 */

			/* 보유한 재능 등록 시작 */
			talHaveDivVO.setTalConnNO(talExcConnVO.getTalConnNO());
			it = talHaveDivTS.iterator();
			while (it.hasNext()) {
				talHaveDivVO.setTalDivDF((String) it.next());
				System.out.println("talExcConnVO.getTalConnNO() : " + talHaveDivVO.getTalConnNO());
				System.out.println("talHaveDivVO.getTalDivDF() : " + talHaveDivVO.getTalDivDF());
				service.createHaveCn(talHaveDivVO);
			}
			/* 보유한 재능 등록 끝 */

			return "success";
		}
		else{
			return "fail";
		}
	}

	/* 재능교환신청 상세정보 (신청인) */
	@RequestMapping("/infoSender")
	public String infoSender() {

		return "/client/talExcConn/infoSender";
	}

	/* 재능교환신청 상세정보 (수령인) */
	@RequestMapping(value = "/infoRecipient", method = RequestMethod.GET)
	public String infoRecipient(TalExcConnVO talExcConnVO, Model model, SearchCriteria cri) throws Exception {

//		TalDivVO talDivVO = new TalDivVO();
//		model.addAttribute("cri", cri);
//		model.addAttribute("TalExcConnVO", service.infoSend(talExcConnVO));


		return "/client/talExcConn/infoRecipient";
	}


}
