package com.simpact.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.simpact.domain.MemberVO;
import com.simpact.service.AdLoginService;
import com.simpact.service.LoginService;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:38
 */
@Controller
@RequestMapping("/ad")
public class AdLoginController {

	@Inject
	private AdLoginService service;

	/* 로그인 */
	@RequestMapping("/l")
	public String adminLogin() {
		return "/admin/login/confirm";
	}

	@RequestMapping("/check")
	public @ResponseBody String logincheck(String email, String pass, HttpServletRequest req, Model model) {    //로그인에 시도하여 성공 or 실패 판별
		int t = 0;
		try {
			t = service.loginCheck(email, pass);
			if (t == 1) {    //로그인성공
				String memNO = service.selectMemberNO(email);        //이메일을 통해 memno값 얻어오기
				service.latestDateUpdate(memNO);            //최근 접속일 최신화
				MemberVO vo = service.selectMemberinfo(memNO);                //회원번호로 회원정보 얻어오기
				req.getSession().setAttribute("AdSUCCESS", vo);        // 로그인에 성공시 아이디(유일한값)를  키값으로하는 세션부여
				return "success";    //성공후 메인페이지로이동
			} else {
				return "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;    //실패시 재 로그인
	}

	@RequestMapping("/logout")        //로그아웃!!
	public String logout(HttpServletRequest req) {    //로그인화면 출력
		req.getSession().invalidate();            //로그아웃시 모든 세션제거
		return "redirect:/ad/l";
	}
}
