package com.lagom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lagom.domain.DailyDTO;
import com.lagom.service.daily.DailyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/daily")
public class DailyController {
	
	//ex)등록기능 
	// ㄴ 1) 화면단 (View) - 메서드 1개
	// ㄴ 2) 실제 동작(Action) - 메서드 1개
	
	
	
	// 조회 (1개의 메서드 필요)
	// 등록 (1개의 메서드 필요 - action)
	// 수정 (1개의 메서드 필요 - action)
	// 삭제 (1개의 메서드 필요 - action)
	
	@Autowired // 의존성 주입
	DailyService dService;
	
	@GetMapping("/create") //C
	public void dailyAppend(DailyDTO dDto){
		log.info("▶▶▶▶▶▶▶▶▶▶Daily Appled◀◀◀◀◀◀◀◀◀◀");
		log.info(dDto.toString());
//		DailyService ds  = new DailyService(); // 개발자가 아니라 스프링이 만들어줌. 
	//		ds.dailyCreate(); 원래 자바라면 이렇게 함 ㅇㅇ
		
		dService.dailyCreate(); // 서비스단과 연결하는 것.
	}
	@PostMapping("/read") //R
	public void dailySelectAll() {
		log.info("▶▶▶▶▶▶▶▶▶▶Daily Select◀◀◀◀◀◀◀◀◀◀");
		dService.dailyRead();
	}
	
	@PostMapping("/update") //U
	public void dailyUpdate() {
		log.info("▶▶▶▶▶▶▶▶▶▶Daily Update◀◀◀◀◀◀◀◀◀◀");
		dService.dailyUpdate();
	}
	@PostMapping("/delete") //D
	public void dailyDelete() {
		log.info("▶▶▶▶▶▶▶▶▶▶Daily Delete◀◀◀◀◀◀◀◀◀◀");
		dService.dailyDelete();
	}
	
}
