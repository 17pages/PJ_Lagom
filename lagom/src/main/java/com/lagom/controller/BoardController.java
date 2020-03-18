package com.lagom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lagom.domain.BoardDTO;
import com.lagom.service.board.BoardService;
import com.lagom.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	//service = 비즈니스로직 (DB에 가서 가져와야 출력할 수 있음)
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String boardView(
			@RequestParam(defaultValue="1") int curPage, 
			Model model) {
		log.info(">>>>> board page 출력");
		//requestParam defaultvalue는 사용자가 아무것도 클릭하지 않았을때 디폴트 값으로 1페이지 띄운다고
		
		//게시글 갯수계산(게시글을 board 또는 article로 많이 씀)
		int count = bService.countArticle();
		
		//페이지 관련 설정 curPage=1페이지 누름 2페이지누름 그런거
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardDTO> list = bService.titleList(start, end);//게시물 목록
				
		HashMap<String, Object> map  = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
				
		//보낼게 많아서 map으로 만들어버림
		model.addAttribute("map", map);
		
		return "board/list";
	}
	


}
