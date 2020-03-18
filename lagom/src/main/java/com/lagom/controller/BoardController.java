package com.lagom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lagom.domain.BoardDTO;
import com.lagom.service.board.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	//service = 비즈니스로직 (DB에 가서 가져와야 출력할 수 있음)
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String boardView(Model model) {
		log.info(">>>>> board page 출력");
		
		List<BoardDTO> list = bService.titleList();
		HashMap<String, Object> map  = new HashMap<>();
		map.put("list", list);
		
		
		//보낼게 많아서 map으로 만들어버림
		model.addAttribute("map", map);
		
		return "board/list";
	}
	


}
