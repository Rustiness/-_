package com.simpact.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simpact.domain.EmployeeVO;
import com.simpact.domain.MemberVO;
import com.simpact.domain.MessengerVO;
import com.simpact.domain.PageMaker;
import com.simpact.domain.SearchCriteria;
import com.simpact.service.AdEmployeeService;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:55
 */
@Controller
@RequestMapping("/ad/e")
public class AdEmployeeController {

	@Inject
	AdEmployeeService service;
	
	/* 직원목록 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		
		
		model.addAttribute("list",service.listSearchCriteria(cri));  //목록
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		
		maker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker",maker);		//페이징
		return "/admin/employee/list";
	}

	/* 직원 상세정보 */
	@RequestMapping("/read")
	public String read(@RequestParam("memNO") String memNO, SearchCriteria cri, Model model,HttpServletRequest req) throws Exception {
		List<MemberVO> list = (List<MemberVO>) req.getSession().getAttribute("memberList"); // 로그인한 사람의 정보 LIST
		String loginMemNO = list.get(0).getMemNO();											// 그중 memNO을 얻음
		model.addAttribute("loginMemNO",service.reademp(loginMemNO));// "로그인한 직원"의 직원정보
		
		
		model.addAttribute("memberVO",service.read(memNO)); //직원기본정보 
		model.addAttribute("employeeVO",service.reademp(memNO)); //직원추가정보 
		
		model.addAttribute("empmessengerVO",service.readmsg(memNO));	//직원메신저정보 list
		model.addAttribute("cri",cri);
		return "/admin/employee/read";
	}

	/* 직원정보 수정폼으로 */
	@RequestMapping("/mod")
	public String mod(@RequestParam("memNO") String memNO, SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("memberVO",service.read(memNO)); //직원기본정보 
		model.addAttribute("employeeVO",service.reademp(memNO)); //직원추가정보 
		
		model.addAttribute("gradeDF",service.readgrade(memNO)); //관리등급정보 (memNO에 따른)
		model.addAttribute("positionDF",service.readposition(memNO)); //직챙정보(memNO에 따른)
		
		model.addAttribute("empmessengerVO",service.readmsg(memNO));	//직원메신저정보 list
		model.addAttribute("cri",cri);
		return "/admin/employee/modify";
	}
	
	/* 직원정보 DB수정 */
	@RequestMapping("/mod/db")
	public @ResponseBody String modDB(EmployeeVO vo) throws Exception {
		if(service.modify(vo)==1){
			return "empUPSUCCESS";
		}
		return "empUPFAIL";
	}

}
