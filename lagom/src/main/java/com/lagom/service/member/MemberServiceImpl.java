package com.lagom.service.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lagom.domain.MemberDTO;
import com.lagom.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	@Override
	public int idOverlap(String id) {
		return mDao.idOverLap(id);
	}
	@Override
	public int memInsert(MemberDTO mDto) {
		return mDao.memInsert(mDto);
	}


}