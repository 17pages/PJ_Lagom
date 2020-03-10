package com.lagom.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.lagom.domain.MemberDTO;
import com.lagom.persistence.MemberDAO;

//객체의 권한을 스프링에게 주는 작업. 

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
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
	@Override
	public MemberDTO userView(String id) {
		return mDao.userView(id);
	}
	@Override
	public void memUpdate(MemberDTO mDto, HttpSession session) {
		int result = mDao.memUpdate(mDto);
		
		if(result>0) {
			//세션에 로그인 유저 정보를 수정된 정보로 변경
			//session.name = '최체리'; ----> login 정보 '최체리'
			//회원정보수정 name = '최체리'-------> DB name '최체리'
		session.removeAttribute("name");
		session.setAttribute("name", mDto.getName());
		}
		
	}
	@Override
	public int pwCheck(String id, String pw) {
		
		String encPw = mDao.pwCheck(id);
		int result = 0;
		if(passwordEncoder.matches(pw, encPw)) {
			result = 1;
		}
		
		return result;
	}
	@Override
	public void pwUpdate(MemberDTO mDto) {
		mDao.pwUpdate(mDto);
		
	}


}

//return하는거 : 호출문이 있음 =>호출을 먼저함,(memberDAO가서 호출) 결과값 그대로 toss