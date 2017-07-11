package com.simpact.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simpact.domain.Criteria;
import com.simpact.domain.MemberVO;
import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;
import com.simpact.service.AdMemberService;
import com.simpact.service.MemberService;

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
	
	@Inject
	MemberService memberservice;
	
	
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
	public String read(@RequestParam("memNO") String memNO, SearchCriteria cri, Model model)throws Exception {
		model.addAttribute("memberVO",service.read(memNO)); //회원정보 
		model.addAttribute("messengerVO",service.readmsg(memNO));	//메신저정보 list
		model.addAttribute("cri",cri);
		return "/admin/member/read";
	}

	/* 회원정보 수정페이지*/
	@RequestMapping("/mod")
	public String mod(@RequestParam("memNO") String memNO, SearchCriteria cri, Model model)throws Exception {
		model.addAttribute("memberVO",service.read(memNO)); //회원정보 
		model.addAttribute("personDFVO",service.getGrade());//회원분류 얻어오기
		model.addAttribute("messengerList",memberservice.listmsg());//메신저 항목
		model.addAttribute("messengerVO",service.readmsg(memNO));	//메신저정보 list
		model.addAttribute("cri",cri);
		return "/admin/member/modify";
	}
	
	/* 회원정보 DB수정*/
	@RequestMapping("/update")
	public @ResponseBody String update(MemberVO vo)throws Exception {
		if(service.modify(vo)==1){
			return "memberUPSUCCESS";
		}
		return "memberUPFAIL";
	}
	
	
	/* 회원 등급 직원으로 변경시 */
	@RequestMapping("/updateToEMP")
	public @ResponseBody void updateToEMP(String memNO)throws Exception {
		service.modifyTOEMP(memNO);
	}
	
}
