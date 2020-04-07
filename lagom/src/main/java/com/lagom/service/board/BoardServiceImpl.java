package com.lagom.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lagom.domain.BoardDTO;
import com.lagom.persistence.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;
	
	BoardDAO bDao;
	
	@Autowired
	public void titleBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
		
	}
	@Override
	public List<BoardDTO> titleList(String search_option, String keyword, String sort_option, int start, int end){//1,10들어감
		Map<String, Object>map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
	
		
		return bDao.titleList(map);
	}
	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String>map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		
		return bDao.countArticle(map);
	}
	@Override
	public BoardDTO detailView(int bno) {
		
		return bDao.detailView(bno);
	}
	@Override
	public void increaseViewCnt(HttpSession session, int bno) {
		// now_time : 현재시간
		// plus_time : 조회수 +1 시간 >> 저장소에 넣어야함 현재시간은 그때그때 가져와서 노필요
		// now_time - plus_time = 조회수+1증가후 지난시간
		
		long update_time = 0; //조회수 +1 증가한 시간
		
		if(session.getAttribute("update_time_"+bno) !=null) {
			//최근에 조회수를 올린 시간
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		
		//현재시간
		long current_time = System.currentTimeMillis();
		
		//일정시간이 경과한 후 조회수 증가 처리(1day)
		if(current_time - update_time > 24*60*60*1000) {
			//DB에서 조회수 +1증가
			bDao.increaseViewCnt(bno);
			//조회수 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
		}
	}
	@Override
	public void delBoard(int bno) {
		bDao.delBoard(bno);
	}
	@Override
	public void write(BoardDTO bDto) {
		//글 DB에 등록
		bDao.write(bDto);
		
	}
	@Override
	public void updateBoard(BoardDTO bDto) {
		
		bDao.updateBoard(bDto);
		
	}
	@Override
	public void increaseGoodCnt(int bno) {
		bDao.increaseGoodCnt(bno);
		
	}
	@Override
	public void answer(BoardDTO bDto) {
		//답글 알고리즘
		//Current Status bDto : 
		//answer : title, writer, type, content
		//main : bno, ref, re_level, re_step
		//ref는 기존거 그대로 두면 됨
		//반드시 step을 올리고 글을 update해야함. 안그러면 지금 있는 글도 비교해서 해버림
		
		
		//1)re_step 수정
		// : ref가 같은 row중에 메인 게시글의 re_step 보다 크기가 큰 값을 찾아 전부 +1 => updateStep()
		
		bDao.updateStep(bDto);
		
		//2) 답글 DB에 insert 
		bDto.setRe_level(bDto.getRe_level()+1);
		bDto.setRe_step(bDto.getRe_step()+1);
		bDao.answer(bDto);
	}
	
	
		
	
}
