package com.simpact.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String read() {

		return "/admin/employee/read";
	}

	/* 직원등록 */
	@RequestMapping("/write")
	public String write() {

		return "/admin/employee/write";
	}

	/* 직원정보 수정 */
	@RequestMapping("/mod")
	public String mod() {

		return "/admin/employee/modify";
	}

}
