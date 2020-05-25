package com.lagom.service.daily;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lagom.persistence.DailyDAO;

@Service
public class DailyService {
	//인터페이스 만들고 구현받아서 
	//오버라이딩한 메서드를 사용할 것이냐
	
	// or
	
	// 내가 그냥 직접 메서드 만들어서 사용할 것이냐
	
	//DAO를 타게 만들어야함~
	
	@Autowired
	private SqlSession sqlSession;
	
	DailyDAO dDao; // 전역변수
	@Autowired
	public void newDailyDAO() {
		dDao = sqlSession.getMapper(DailyDAO.class);
	}
	
	public void dailyCreate() {
		
	}
	public void dailyRead() {
		
	}
	public void dailyUpdate() {
		
	}
	public void dailyDelete() {
		
	}
}
