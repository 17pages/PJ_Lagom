package com.lagom.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

/*
 * Login이 필요한 기능 수행시 
 * Session 체크를 하는 Interceptor
 * */

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	//URL전
	
	//boolean => T or F 로 결과
	// T면 놓아줌 F면 안보냄
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//Session 객체 생성
		HttpSession session = request.getSession();
		
		//로그인 NO
		if(session.getAttribute("userid") == null) {
			log.info(">>>>NOLOGIN");
			//이전 페이지 URL을 GET
			String referer = request.getHeader("referer");
			log.info(">> 이전 URL : " + referer);
			
			//URL만 신경, get or post 중요하지 않음
			//회원 수정 페이지 출력 : GET:/member/update
			//회원 수정 DB : post:/member/update
			
			//request(GET,POST) > response(forword, sendRedirect)를 해줘야함(ajax빼고)
			
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			
		
			
			//URL로 바로 접근한 경우(referer이 없는 경우) 인덱스로 넘어감
			if(referer==null) {
				referer = "http://localhost:8081/lagom/";
			}
			// 1회성으로 데이터 한번만 보내주는것 flashMap == sendattribute
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			return false; // 이동X
		}else {//Login OK
			log.info(">>>LOGIN");
			return true; // 원래 가려던 곳으로 이동
			
		}
	
	}
	//URL후
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		super.postHandle(request, response, handler, modelAndView);
//	}

}
