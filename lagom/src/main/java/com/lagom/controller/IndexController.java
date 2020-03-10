package com.lagom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lagom.domain.ProductDTO;
import com.lagom.service.index.IndexService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	//@inject, @Autowired, @Resource중 1개라도 붙어있으면 의존성 주입
	
	//@Inject와 @Autowired는 타입(변수타입)으로 의존성 주입
	//타입으로 가져오기때문에 IndexService 이부분이 중요하지 iService는 노중요
	//IndexService는 인터페이스... IndexServiec, IndexServiceImpl도 가능함 왜냐면 타입으로 의존해서
	//@Resource는 변수명으로 의존성 주입
	
	@Autowired
	IndexService iService;
	// iService에 indexServiceImpl Beans가 들어가있는것
	
	@RequestMapping("/")
	public String indexView(Model model, HttpSession session) {
		log.info(">>>>> INDEX PAGE 출력");
		
		//1.view단에 출력할 데이터, 베스트상품 5건
		model.addAttribute("BestPdt", iService.bestPdtList()); //이름표, 담을데이터
		
		//신상품 5건을 출력하는 비즈니스 로직을 처리하는 서비스단으로 이동
		//view단에 출력할 신상품 5건
		model.addAttribute("NewPdt",iService.newPdtList());
		
		//개발종료시 삭제할것 (로그인 계속하기 귀찮아서 한거임)
		session.removeAttribute("userid");
		session.removeAttribute("name");
		session.setAttribute("userid", "aaa@aaa.com");
		session.setAttribute("name", "관리자");
		
		//2.출력할 화면을 결정
		//1,2 가지고 dispatcher고고
		return "index";
	}

}
