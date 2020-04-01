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
		//이전 페이지 URL을 GET
		String referer = request.getHeader("referer");
		log.info(">> 이전 URL : " + referer);
		
		//로그인 NO
		//sessin에 값이 없다면(로그인 안된상태) 
		if(session.getAttribute("userid") == null) {
			log.info(">>>>NOLOGIN");
			//URL만 신경, get or post 중요하지 않음
			//회원 수정 페이지 출력 : GET:/member/update
			//회원 수정 DB : post:/member/update
			//request(GET,POST) > response(forword, sendRedirect)를 해줘야함(ajax빼고)
			//session이 없어서 null인경우 = 다른 사이트에서 url만 쓰고 옴 (외부에서 접속했을때)
			
			//
			String uri = request.getRequestURI();
			log.info(">>>>>> 목적지 : " + uri);
			
			
			if(referer == null ) {
				//URL로 바로 접근한 경우 (referer이 없는 경우) 인덱스로 넘어감
				referer = "http://localhost:8081/lagom/";
			} else {
				//내부에서 접속했는데 문제가 있을때
			
			//login no
			//게시글 등록, 수정(로그인이 필요한 view단 <- 이때만)
			 int index = referer.lastIndexOf("/");
			 int len = referer.length();
			// log.info(">>>>>>> index : " + index);
			// log.info(">>>>>>> 길이 : " + len);
			 String mapword = referer.substring(index, len);
			// log.info("수정된 URL : " + mapword);
			 
			 
			 //글쓰기 창에서 로그아웃하면 board/list로 가게 만듦
			 if(mapword.equals("/write")) {
				 response.sendRedirect(request.getContextPath() + "/board/list");
				 return false;
			 	}
   			 }
				
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin"); // 메시지를 보내줌
			fMap.put("uri", uri); // 로그인이 필요한 시스템중에 사용자가 사용하려고 했던것 (인터셉트가 가지고 있던거)
				
			// 1회성으로 데이터 한번만 보내주는것 flashMap == sendattribute
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
				
			return false; // 이동X
	
		}else {//Login OK
			log.info(">>>LOGIN");
			return true; // 원래 가려던 곳으로 이동 interceptor을 끄라는 뜻. 가던길로 가라고
			
		}
	
	}
	//URL후
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		super.postHandle(request, response, handler, modelAndView);
//	}

}
