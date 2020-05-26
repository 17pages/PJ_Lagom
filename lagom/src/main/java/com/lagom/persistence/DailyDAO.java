package com.lagom.persistence;

import java.util.List;

import com.lagom.domain.DailyDTO;

public interface DailyDAO {
	// 동록, 조회, 수정, 삭제
	//interface는 객체가 아님. 일반메서드가 올 수 없음. 추상메서드만 가능. 
	//=> 메서드의 {}가 없음. 이름만 있고 실체가 없음. 
	//추상메서드는 반환타입이 있어야함! , 접근제어자도 있음~
	//생성자는 반환타입 없음. 
	
	//public abstract void dailyCreate(); 인터페이스에서만 abstract생략 가능
	public void dailyCreate();
	public List<DailyDTO> dailyRead();
	public void dailyUpdate();
	public void dailyDelete();

}
