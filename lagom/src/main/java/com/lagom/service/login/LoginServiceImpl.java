package com.lagom.service.login;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.lagom.domain.MemberDTO;
import com.lagom.persistence.LoginDAO;
import com.lagom.persistence.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	
	private LoginDAO lDao;
	@Autowired
	public void newMemberDAO() {
		lDao = sqlSession.getMapper(LoginDAO.class);
	}
	
	

	@Override
	public int login(MemberDTO mDto, HttpSession session) {
		//비즈니스로직 처리
		//1.DB에 가서 회원인지 아닌지 유무체크
		MemberDTO loginDto = lDao.loginUser(mDto);
		log.info("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ 로그인 결과");
		
		//로그인 결과값
		int result = 0;
		
		//result결과
		//0 : 등록된 회원이 아닙니다. 회원가입을 진행해주세요.
		//2: 이메일 인증을 하셔야만 로그인 할 수 있습니다. 
		//1: 로그인 성공
		//3 : 아이디 또는 비밀번호가 잘못되었습니다. 다시 확인해 주세요.
		
		//회원 정보가 없는 경우
		if(loginDto == null) {
			result = 0;
			return result;
			
		}
		
		//탈퇴한 회원인 경우
		if(loginDto.getUseyn().equals("d")) {
			result = 3;
			return result;
		}
		//인증 안했을 경우
		if(!(loginDto.getUseyn().equals("y"))) {
			result = 2;
			return result;
			
		}
		
		//회원정보가 있고 인증을 한 경우
		if(loginDto !=null) {
			
			//아이디와 패스워드가 같은지 체크
			if(passwordEncoder.matches(mDto.getPw(), loginDto.getPw())) {
				//로그인 진행
				result = 1;
				//session에 로그인 유저 정보를 저장, 값을 담을때는  set씀 (이름표, 값), 공유영역에 값 저장함, null값들어오면 로그인 안된것
				//remove => 초기화
				//검색하려면 getAttribute쓰면됨.
				session.removeAttribute("userid");
				session.removeAttribute("name");
				session.setAttribute("userid", loginDto.getId());
				session.setAttribute("name", loginDto.getName());
				
				
			}else {
				result = 3;
			}
			
		}
		
		//2. DB결과에 따라 동작
		//	-회원인데 인증을 안한 경우
		
		// -회원인데 인증을 한 경우
		
		//	-회원이 아닌 경우
				
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		//비즈니스 로직 : 로그아웃
		
		//세션을 초기화, 제거
		session.invalidate();
		
		
		
	}

}
