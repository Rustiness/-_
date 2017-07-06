package com.simpact.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;
import com.simpact.service.AdMemberService;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:55
 */
@Controller
@RequestMapping("/ad/m")
public class AdMemberController {

	@Inject
	AdMemberService service;
	
	/* 회원 목록 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		
		model.addAttribute("list",service.listSearchCriteria(cri));  //목록
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		
		maker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker",maker);		//페이징
		return "/admin/member/list";
	}

	/* 회원 상세정보 */
	@RequestMapping("/read")
	public String read(@RequestParam("memNO") String memNO)throws Exception {
		service.read(memNO);
		
		return "/admin/member/read";
	}

	/* 회원정보 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/admin/member/modify";
	}

}
