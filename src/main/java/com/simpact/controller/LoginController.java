package com.simpact.controller;

import com.simpact.domain.MemberVO;
import com.simpact.service.LoginService;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

/**
 * Created
 * User: simpact
 * Date: 2017-06-30
 * Time: 오후 4:38
 */

@Controller
@RequestMapping("/l")
public class LoginController {

	@Inject
	private LoginService service;

	/* 로그인 */
	@RequestMapping("/confirm")
	public String login(HttpServletRequest req) {                //로그인화
		req.getSession().invalidate();            //로그아웃시 모든 세션제거
		return "client/login/confirm";
	}

	@RequestMapping("/logout")        //로그아웃!!
	public String logout(HttpServletRequest req) {    //로그인화면 출력
		req.getSession().invalidate();            //로그아웃시 모든 세션제거
		return "redirect:/l/confirm";
	}

	@RequestMapping("/check")
	public @ResponseBody String logincheck(String email, String pass, HttpServletRequest req, Model model) {    //로그인에 시도하여 성공 or 실패 판별
		int t = 0;
		try {
			t = service.loginCheck(email, pass);
			if (t == 1) {    //로그인성공
				String memNO = service.selectMemberNO(email);        //이메일을 통해 memno값 얻어오기
				service.latestDateUpdate(memNO);                    //최근 접속일 최신화
				List<MemberVO> list = service.selectMemberinfo(memNO);                //회원번호로 회원정보 얻어오기
				
				req.getSession().setAttribute("SUCCESS", list);        // 로그인에 성공시 아이디(유일한값)를  키값으로하는 세션부여
				return "success";    //성공후 메인페이지로
			} else {

				return "fail";		//실패시 재 로그인
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;    
	}

	/* 비밀번호 찾기 */
	@RequestMapping("/findPass")
	public String findPass(HttpServletRequest req) { //비밀번호 찾기 폼 출력
		return "client/login/findPass";
	}

	@RequestMapping(value="/findpass/check",method=RequestMethod.POST)
	public @ResponseBody String findPasscheck(String email, String name, String tel) { //db에서 비밀번호 찾기
		String findpass = null;
		try {
			findpass = service.findpass(email, name, tel);
			if (findpass != null) {
				return "success:"+findpass;	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail:";
	}

}

