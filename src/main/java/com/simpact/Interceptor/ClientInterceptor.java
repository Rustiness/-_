package com.simpact.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.simpact.domain.MemberVO;

public class ClientInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		MemberVO vo = (MemberVO) request.getSession().getAttribute("clientMemberVO");
		if (vo == null) {
			response.sendRedirect("/lte");    //초기화면으로
			return false;
		}
		return super.preHandle(request, response, handler);
	}

}
