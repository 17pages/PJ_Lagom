package com.lagom.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<BoardDTO> titleList(int start, int end){//1,10들어감
		Map<String, Object>map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return bDao.titleList(map);
	}
	@Override
	public int countArticle() {
		return bDao.countArticle();
	}

}
