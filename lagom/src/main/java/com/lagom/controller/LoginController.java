package com.lagom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lagom.domain.MemberDTO;
import com.lagom.service.login.LoginService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/login")
@Slf4j
@Controller

public class LoginController {
	
	@Autowired
	LoginService lservice;
	
	@ResponseBody
	@PostMapping("/in")
	public Integer logIn(MemberDTO mDto, HttpSession session) {
		//스프링이 자동으로 객체생성 해줌, 이미 session에 객체생성 됨
		log.info(">>>>POST: LOGIN/LOGIN ACTION");
		log.info(mDto.toString());
		
		
		//로그인
		int result = lservice.login(mDto, session);
		log.info("결과는~~~~~~~" + result);
		
		
		return result;
	}

}
