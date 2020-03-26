package com.lagom.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lagom.domain.ReplyDTO;

public interface ReplyDAO {
	
	public List<ReplyDTO> list(@Param("bno")int bno); //@param 매개변수에 이름 붙여주는거 int bno쓸일있으면 그냥 bno라고 쓰면됨
	//@Param안쓰면 가져다 쓸때 @param1 이렇게 적어줘야함.
	//초록색 list는 mapper의 id랑 같아야함.
	public int insert(ReplyDTO rDto);
	
	//댓글 수 +1
	public void replyCntPlus(@Param("bno") int bno);
}
