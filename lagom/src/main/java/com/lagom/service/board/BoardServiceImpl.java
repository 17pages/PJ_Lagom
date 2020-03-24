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
	
		
	
}
