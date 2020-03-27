package com.lagom.service.reply;

import java.util.HashMap;
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

	@Override
	public void insert(ReplyDTO rDto) {
		//비즈니스로직
		//해당 게시글에 댓글을 등록하고, 
		//해당 게시글의 reply_cnt를 +1한다.
		//1.댓글등록
		rDao.insert(rDto);
		
		//2. 게시글 수 증가
		HashMap<String, Object> map = new HashMap<>();
		map.put("bno", rDto.getBno());
		map.put("type", "plus");
		// rDao.replyCntPlus(rDto.getBno());
		rDao.replycntUpdate(map);
		
	}
	//댓글 삭제
	@Override
	public void delete(int rno, int bno) {
		//댓글삭제
		rDao.delete(rno);
		
		//댓글 수 감소-1
		HashMap<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("type", "minus");
		
		rDao.replycntUpdate(map);
		
	}
	


}
