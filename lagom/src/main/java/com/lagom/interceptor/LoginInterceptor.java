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
		//이전 페이지 URL을 GET // 이동하기 전 있었던 page url
		String referer = request.getHeader("referer"); // http://localhost:8081/metop/board/list
		log.info(">>>>>>>>>referer : " + referer);
		//referer : 이전페이지 (내가 있던 곳)
		//uri : 내가 가려고 했던 page
		String uri = request.getRequestURI(); // context루트 부터 -> 끝까지가 uri / url은 http://부터 // [/lagom/board/wirte] 
		String ctx = request.getContextPath(); //=context-root, 프로젝트 [/lagom]
		String nextUrl = uri.substring(ctx.length()); // substring(문자열 특정부분만 골라낼때 쓰는 매서드)은 uri에서 ctx의 길이만큼 자름 = [/board/wirte] // 가고싶은 곳
		String prevUrl = ""; //[공백], 이전것
		String finalUrl = "http://localhost:8081/lagom/"; // 인덱스로 이동하셈
		
		
		//비정상적인 접근을 막는 기능!
		if(referer ==null) { // url을 direct로 치고 들어온것
			log.info("WARNING >> 비정상적인 접근");
			response.sendRedirect(finalUrl); //메인으로 보내버림
			return false;
		}else{//무언가를 클릭해서 온 것
			 int indexQuery = referer.lastIndexOf("?");//  ?없으면 -1 
			 if(indexQuery == -1) {
				 prevUrl = referer.substring(finalUrl.length()-1);
			 }else { // ?가 있는 경우
				 prevUrl = referer.substring(finalUrl.length()-1, indexQuery);
				 // http://localhost:8081/lagom/board/update?bno = 21
				 //http://localhost:8081/lagom  //28-1=27
				 //indexQuery = 40
			 }
			log.info("PREV URL >>>>> " + prevUrl);
			log.info("NEXT URL >>>>> " + nextUrl);
			
			if(nextUrl.equals("/board/update") || nextUrl.equals("/board/delete")) {//상세게시글에서 넘어왔을때만 정상
				if(request.getParameter("title")==null){
					log.info("alasdfasdf : " + prevUrl.indexOf("board/view")); 
						if(prevUrl.indexOf("board/view")== -1) {// 작성자만이 수정할 수 있도록 하는 것 (board/view에서 왔는지 물어봄- 로그인 하지않는한 불가능)
					//수정삭제를 원하면 반드시 view테이블에서 와야함.
					log.info("WARNING >> 비정상적인 접근");
					response.sendRedirect(finalUrl);
					return false;
				}
			}
		}
	}
			
		//정상적인 접근인 경우 실행
		//로그인 NO
		//session에 값이 없다면(로그인 안된상태) 
		if(session.getAttribute("userid") == null) { //똑같으면 메인으로 보내버림
			if(prevUrl.equals(nextUrl)) {
				log.info("WARNING >> prevUrl == nextUrl :/");
				response.sendRedirect(finalUrl);
				return false;
			}
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin"); // 메시지를 보내줌
			fMap.put("uri", uri); // 로그인이 필요한 시스템중에 사용자가 사용하려고 했던것 (인터셉트가 가지고 있던거)
				
			// 1회성으로 데이터 한번만 보내주는것 flashMap == sendattribute
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
				
			return false; // 이동X 
		}else{//Login OK
			log.info(">>>LOGIN");
			return true; //이동O
			
		}
	}
			
			//URL만 신경, get or post 중요하지 않음
			//회원 수정 페이지 출력 : GET:/member/update
			//회원 수정 DB : post:/member/update
			//request(GET,POST) > response(forword, sendRedirect)를 해줘야함(ajax빼고)
			//session이 없어서 null인경우 = 다른 사이트에서 url만 쓰고 옴 (외부에서 접속했을때)
		
			//String uri = request.getRequestURI();
			//log.info(">>>>>> 목적지 : " + uri);
					
			//if(referer == null ) {
				//URL로 바로 접근한 경우 (referer이 없는 경우) 인덱스로 넘어감
				//referer = "http://localhost:8081/lagom/";
	//		} else {
				//내부에서 접속했는데 문제가 있을때
					 
			 //글쓰기 창에서 로그아웃하면 board/list로 가게 만듦
		//	 if(mapword.equals("/write")) {
			//	 response.sendRedirect(request.getContextPath() + "/board/list");
				// return false;
			 	//}
   			// }
			
		//}else {//Login OK
			
	//		return true; // 원래 가려던 곳으로 이동 interceptor을 끄라는 뜻. 가던길로 가라고
			
	//	}
	
	//}
	//URL후
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		super.postHandle(request, response, handler, modelAndView);
//	}

}
