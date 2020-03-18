package com.lagom.service.board;

import java.util.List;

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
	public List<BoardDTO> titleList(){
		
		return bDao.titleList();
	}

}
