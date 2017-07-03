package com.simpact.controller;

import com.simpact.domain.MemberVO;
import com.simpact.service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:55
 */
@Controller
@RequestMapping("/m")
public class MemberController {

	@Inject
	private LoginService service;

	/* 비밀번호 확인 */
	@RequestMapping("/chkPass")
	public String chkPass() {

		return "/client/member/chkPass";
	}

	/* 회원 상세정보 */
	@RequestMapping("/info")
	public String info(HttpServletRequest req) {
		req.getSession().getAttribute("SUCCESS");
		return "/client/member/info";
	}

	//비밀번호 확인폼 (수정을 위한)
	@RequestMapping("/upchkPassform")
	public String updatechk(HttpServletRequest req) {
		return "/client/member/chkPass";
	}

	//비밀번호 DB에서 확인(수정용)
	@RequestMapping("/upchkPass")
	public @ResponseBody String uppasscheck(String memNO, String uppass) {
		int t = 0;
		try {
			t = service.uppasscheck(memNO, uppass);
			if (t == 1) {
				return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "fail";
	}

	/* 회원정보 수정 (수정폼) */
	@RequestMapping("/mod")
	public String modifyfrom(HttpServletRequest req) {
		req.getSession().getAttribute("SUCCESS");
		return "/client/member/modify";
	}

	/* 회원정보 수정 */
	@RequestMapping("/mod/result")
	public @ResponseBody String mod(HttpServletRequest req, MemberVO vo) {
		int t = 0;
		try {
			t = service.memberUpdate(vo);            //수정 되면 1 안되면 0
			if (t == 1) {
				req.getSession().removeAttribute("SUCCESS");
				return t + "";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	//비밀번호 확인폼 (삭제를 위한)
	@RequestMapping("/delchkPassform")
	public String deletechk(HttpServletRequest req, Model model) {
		model.addAttribute("delete", "123");
		return "/client/member/chkPass";
	}

	/* 회원 탈퇴 */
	@RequestMapping("/delchkPass")
	public @ResponseBody String withdrawal(String memNO, String delpass) {
		int t = 0;
		try {
			t = service.delpasscheck(memNO, delpass);
			if (t == 1) {
				return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "fail";
	}

	/* 회원 탈퇴 */
	@RequestMapping("/withdrawal")
	public String withdrawal() {

		return "/client/member/withdrawal";
	}

}