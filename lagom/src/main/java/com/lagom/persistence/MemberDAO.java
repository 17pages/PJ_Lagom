package com.lagom.persistence;

import com.lagom.domain.MemberDTO;

public interface MemberDAO {
	//회원가입 ID중복체크(+AJAX)
	public int idOverLap(String id);
	
	//회원가입 DB에 회원 등록
	public int memInsert(MemberDTO mDto);
	
	//회원가입 진행시 난수 생성 및 useyn컬럼에 난수 입력
	public int getKey(String id, String key);
	
	//회원가입 이메일 인증 후 useyn 컬럼 y로 값 변경
	public int alterKey(String id, String key);

}
//mapper랑 dao합쳐서 씀, @을 붙여서 실행하거나(sql문이 복잡하거나 길면 가독성이 떨어짐), 그럴때 mapper씀(거기에 dao경로랑 같은거 있음)
//sql문이 없으니까 mapper로 감(namespace로 지정해놔서) 거기가서 memInsert실행 
