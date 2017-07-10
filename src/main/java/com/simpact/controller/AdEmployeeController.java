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

import com.simpact.domain.EmployeeVO;
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
	public String read(@RequestParam("memNO") String memNO, SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("memberVO",service.read(memNO)); //직원기본정보 
		model.addAttribute("employeeVO",service.reademp(memNO)); //직원추가정보 
		
		model.addAttribute("empmessengerVO",service.readmsg(memNO));	//직원메신저정보 list
		model.addAttribute("cri",cri);
		return "/admin/employee/read";
	}

	/* 직원등록 */
	@RequestMapping("/write")
	public String write() {

		return "/admin/employee/write";
	}

	/* 직원정보 수정 */
	@RequestMapping(value="/mod",method=RequestMethod.GET)
	public String mod(HttpServletRequest req) throws Exception {
		
		List<MessengerVO> list = service.listmsg();
		
		req.getSession().setAttribute("list", list);	//기존에 있는 메신저항목  
		return "/admin/employee/modify";
	}

}
