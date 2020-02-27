package com.lagom.persistence;

import com.lagom.domain.MemberDTO;

public interface LoginDAO {
	
	//로그인
	public MemberDTO loginUser(MemberDTO mDto);
	
	

}
