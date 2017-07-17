package com.simpact.Interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.simpact.domain.MemberVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	//로그인 인증상태를 확인(특정 Mapping(수정폼,삭제,등록)에 대한 전처리)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		List<MemberVO> list = (List<MemberVO>) request.getSession().getAttribute("memberList");

		if (list == null) {//로그인 처리가 되지 않았다면
			response.sendRedirect("/admin");    //로그인폼으로 이동
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
