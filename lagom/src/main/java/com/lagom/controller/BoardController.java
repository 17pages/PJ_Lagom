package com.lagom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			//이 네가지 값은 항상 가지고 다녀야 함
			@RequestParam(defaultValue="1") int curPage, //어떤페이지 띄울건지
			@RequestParam(defaultValue="new") String sort_option, // 정렬
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword, //검색창
			Model model) {
		log.info(">>>>> board page 출력");
		//requestParam defaultvalue는 사용자가 아무것도 클릭하지 않았을때 디폴트 값으로 1페이지 띄운다고
		
		//게시글 갯수계산(게시글을 board 또는 article로 많이 씀)
		int count = bService.countArticle(search_option, keyword);
		
		//페이지 관련 설정 curPage=1페이지 누름 2페이지누름 그런거
		//pager 객체생성 
		//객체생성문법 : 객체타입 객체생성연산자 =  ()붙으면 메서드=소문자 (객체타입, (상수-전체가 대문자)만 대글자)
		//매서드가 첫글자가 대문자인건 생성자밖에 없음. 
		Pager pager = new Pager(count, curPage);//생성자매서드-매개변수를 붙이는 경우 따라서 가야함.계산하고 돌아옴 pager에서 계산한것이 모두 담겨서 돌아옴
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardDTO> list = bService.titleList(search_option, keyword, sort_option, start, end);//게시물 목록 1하고 10 담아서 가져감
				
		HashMap<String, Object> map  = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
				
		//보낼게 많아서 map으로 만들어버림
		model.addAttribute("map", map);
		
		log.info(pager.toString());
		return "board/list";
	}
	
	@GetMapping("/view/{bno}")
	public String detailView(@PathVariable(value="bno") int bno, Model model,
							HttpSession session){
		log.info(">>>>> GET Board Detail Page 출력");
		
		//1. 해당 bno의 조회수 +1 증가
		bService.increaseViewCnt(session, bno);
				
		//2. DB에서 해당 bno정보를 get해서 View단으로 전송
		model.addAttribute("one", bService.detailView(bno));
		model.addAttribute("key", "dropBoard");
		

		
		return "board/view";
	}
	
	@GetMapping("/delete")
	public String delete(int bno) {
		log.info(">>>>> GET : Board Delete Action");
		bService.delBoard(bno);
		return "redirect:/board/list";
	}
	@GetMapping("/write")
	public String write() {
		log.info(">>>>>>>>>GET : Board Write page");
		
		return "board/register";
	}
	@PostMapping("/write")
	public String write(BoardDTO bDto) {
		log.info(">>>>>>>>>>>> Post : Board write Action");
		log.info(bDto.toString());
		
		if(bDto.getFiles() == null) {
			bDto.setFilecnt(0);
		}else {
			//log.info("currval :" + bDto.getBno());
			log.info("첨부파일 수 : " + bDto.getFiles().length);
			bDto.setFilecnt(bDto.getFiles().length);
		}
			
		//게시글 DB등록
		bService.write(bDto);
		return "redirect:/board/view/"+bDto.getBno();
		
		//rediret를 써야 새로운 페이지를 만들어줌
	}
	@GetMapping("/update")
	//어디로 가는지 명시하니까 string쓰는거
	public String updateBoard(int bno, Model model) {
		log.info(">>>> GET : Board update View page");
		log.info("bno :" + bno);
		
		//수정을 원하는 게시글의 정보를 (1줄) 원함
		model.addAttribute("one", bService.detailView(bno));
		model.addAttribute("flag", "update");
		
		return "/board/register";
	}
	@PostMapping("/update")
	public String updateBoard(BoardDTO bDto) {
		log.info(">>>> POST : Board update Action");
		
		bService.updateBoard(bDto);
		
		return "redirect:/board/view/"+bDto.getBno();
		
	}
	@GetMapping("/answer")
	// int bno 를 해도 되지만 이 경우에는 bDto 써도 효율 괜찮음 
	//bDTO, model쓰려면 객체생성해야함=>@controller 붙은 클래스에서는 매서드에서 자동으로 객체생성해줌
	public String answerBoard(BoardDTO bDto, Model model) {
		log.info(">>>> GET : Board answer view Action");
		bDto = bService.detailView(bDto.getBno());
		
		String newContent = "<p>[이전게시글 내용]</p>" + 
							bDto.getView_content() + 
							"<br>========================================";
		bDto.setView_content(newContent);
		
		model.addAttribute("one", bDto);
		model.addAttribute("flag", "answer");
		
		
		
		
		return "board/register";
		
	}
	@PostMapping("/answer")
	public String answerBoard(BoardDTO bDto) {
		log.info(">>>> POST : Board answer view Action");
		
		//현재상태 : 답글(bno(메인게시글 bno)타입, 제목, 내용, 작성자)
		log.info("답글DTO : " + bDto.toString());
		
		//현재상태 : 메인(ALL, ref, re_level, re_step)
		BoardDTO prevDto = bService.detailView(bDto.getBno());
		log.info("메인DTO : " + prevDto.toString());
		
		//첨부파일 나오게 하는거
		if(bDto.getFiles() == null) {
			bDto.setFilecnt(0);
		}else {
			//log.info("currval :" + bDto.getBno());
			log.info("첨부파일 수 : " + bDto.getFiles().length);
			bDto.setFilecnt(bDto.getFiles().length);
		}
		
		//현재상태 : 답글 (bno(메인게시글), 타입, 제목, 내용, 작성자
		//				   ref(메인), re_level(메인), re_step(메인)
		bDto.setRef(prevDto.getRef());
		bDto.setRe_level(prevDto.getRe_level());
		bDto.setRe_step(prevDto.getRe_step());
		
		bService.answer(bDto);
		
		//ref, re_step, re_level
		//ref = 그래도 메인 게시글 ref copy&paste
		//re_level - 메인게시글 re_level +1
		//re_step = 메인게시글 re_step +1
		
		return "redirect:/board/view/"+bDto.getBno();
	}
	@PostMapping("/getAttach")
	@ResponseBody
	public List<String> getAttach(int bno){
		log.info(">>>>>>>>>> POST : Board getAttach Action");
		log.info(">>>>>>>>> bno : " + bno);
		
		return bService.getAttach(bno);
	}
	@ResponseBody//그냥 데이터만 보내겠음
	@GetMapping("/good")
	public void good(int bno) {
		
	bService.increaseGoodCnt(bno);
		
		
	}

}
