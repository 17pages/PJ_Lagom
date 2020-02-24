package com.lagom.persistence;

import com.lagom.domain.MemberDTO;

public interface MemberDAO {
	//회원가입 ID중복체크(+AJAX)
	public int idOverLap(String id);
	
	//회원가입 DB에 회원 등록
	public int memInsert(MemberDTO mDto);

}
