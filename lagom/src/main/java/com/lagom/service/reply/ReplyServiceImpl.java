package com.lagom.service.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lagom.domain.ReplyDTO;
import com.lagom.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private SqlSession sqlSession;
	
	private ReplyDAO rDao;
	
	@Autowired
	public void newReplyDAO() {
		rDao=sqlSession.getMapper(ReplyDAO.class); // dao랑 mapper를 합쳐서쓴다는거
	}
	
	@Override
	public List<ReplyDTO> list(int bno) { //list<replyDTO> 보내야함. 해당게시글의 댓글목록을 보내주는역할 // 댓글목록은 DB에 있음. 
		return rDao.list(bno); // 호출// DAO에서 값 보내줌. 댓글목록 담김
	}

}
