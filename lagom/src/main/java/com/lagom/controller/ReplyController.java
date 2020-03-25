package com.lagom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lagom.domain.ReplyDTO;
import com.lagom.service.reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	@GetMapping("/list")
	public String list(int bno, Model model) {
		log.info(">>>>> GET : Reply List page");
		//List<ReplyDTO> list = rService.list(bno);
		
	//	for (ReplyDTO replyDTO : list) {
	//		log.info(replyDTO.toString());
	//	}
		
		//화면단으로 전송할 데이터를 담는 역할 = model (이름, 실제데이터(메서드호출문(.찍고 가로열어서 매개변수들어있음) = return으로 데이터쓰겠음이라는 뜻 리턴이 있어야함 반드시!))
		model.addAttribute("list", rService.list(bno)); // 서비스단갔을때 list를 보내줘야함 제네릭은 ReplyDTO써야함
		// rService.list가 서비스한테 받음. 
		//화면단으로 이동할 경로
		return "/board/commentlist"; // 담아서 여기로 보냄
	}

}
