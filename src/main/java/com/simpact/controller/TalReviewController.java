package com.simpact.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simpact.domain.MemberVO;
import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;
import com.simpact.domain.TalDivVO;
import com.simpact.domain.TalReviewVO;
import com.simpact.service.TalReviewService;

/**
 * Created
 * User: 선유란
 * Date: 2017-07-08
 * Time: 오후 4:55
 */

@Controller
@RequestMapping("/tr")
public class TalReviewController {

	@Inject
	private TalReviewService service;// DB관련작업

	// 전체페이지 보기(페이징포함)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		//session.getAttribute("clientMemberVO");

		List<TalReviewVO> list = service.listSearch(cri);

		for (TalReviewVO talReview : list) {
			Map<String, String> map = new HashMap<>();
			map.put("talConnNO", talReview.getTalConnNO());
			map.put("connMemNO", talReview.getMemNO());

			List<TalDivVO> nameList = service.talhave(map);
			String nameStr = "";
			for (int j = 0; j < nameList.size(); j++) {
				nameStr += nameList.get(j).getName() + " ";
			}
			talReview.setName(nameStr);

		}

//		System.out.println("체크>>>>"+ list);
		model.addAttribute("list", list);
		PageMaker maker = new PageMaker();
		maker.setCri(cri);

		maker.setTotalCount(service.listSearchCount(cri));// 끝페이지 번호를 조정
		model.addAttribute("pageMaker", maker);
		return "/client/talReview/list";
	}// listPage

	//DB입력 후 계속 입력 안되게하기 위해 direct로 받고 list로 페이지 이동
		/*@RequestMapping("/list")
		public String ListAll() throws Exception {
			return "/client/talReview/list";
		}*/

	// 입력폼만 보기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String registerGET(String talConnNO, Model model, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("clientMemberVO");
		/*String memNo = ((MemberVO)session.getAttribute("clientMemberVO")).getMemNO();
		List<TalExchangelistVO> list = service.listcate();
		model.addAttribute("list",list);
		System.out.println(list.toString());*/
		Map<String, String> map = new HashMap<>();
		map.put("talConnNO", talConnNO);
		map.put("connMemNO", member.getMemNO());

		List<TalDivVO> list = service.talhave(map);
		model.addAttribute("list", list);

		return "/client/talReview/write";
	}

	// 입력폼 보기 후 DB입력하기
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String registerPOST(TalReviewVO vo) throws Exception {
//		System.out.println(vo);
		service.regist(vo);
		return "redirect:/tr/list";
	}


	// list에서 후기내역 상세보기 
	@RequestMapping("/read")
	public String readPage(String talReviewNO, Model model, SearchCriteria cri, HttpServletRequest req) throws Exception {
		
		/*List<TalReviewVO> list = (List<TalReviewVO>) service.read(talReviewNO);
		
		for(int i=0; i<list.size(); i++){
			TalReviewVO talReview =list.get(i);
			Map<String,String> map = new HashMap<>();
			  map.put("talConnNO", talReview.getTalConnNO());
			  map.put("connMemNO", talReview.getMemNO());
			
			List<TalDivVO> nameList = service.talhave(map);
			String nameStr="";
			for(int j=0; j<nameList.size(); j++){
				nameStr+=nameList.get(j).getName() +" ";
			}
			talReview.setName(nameStr);
			
		}*/

		try {
			TalReviewVO vo = service.read(talReviewNO);
			model.addAttribute("talReviewVO", vo);
			model.addAttribute("cri", cri);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/client/talReview/read";
	}// read

	// 내용 변경후에 페이지 이동 없이 그 페이지 머물게 하는거(3페이지에서 수정했어도 3페이지에 머물기)
	@RequestMapping(value = "/mod", method = RequestMethod.GET)
	public String modifyPageGET(String talReviewNO, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("talReviewVO", service.read(talReviewNO));
		return "client/talReview/modify";
	}

	// 내용 변경 후 DB에 저장하기
	@RequestMapping(value = "/mod", method = RequestMethod.POST)
	public String modifyPagePOST(TalReviewVO vo, SearchCriteria cri, RedirectAttributes attr) throws Exception {
		service.modify(vo);

		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		attr.addAttribute("searchType", cri.getSearchType());
		attr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/tr/list";
	}//modifyPage


	// 게시물삭제해도 해당 페이지에 머무르기
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePage(@RequestParam("talReviewNO") String talReviewNO, SearchCriteria cri, RedirectAttributes attr) throws Exception {
		service.remove(talReviewNO);

		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPageNum", cri.getPerPageNum());
		attr.addAttribute("searchType", cri.getSearchType());
		attr.addAttribute("keyword", cri.getKeyword());
		return "redirect:list";
	}
}//TalReviewController
