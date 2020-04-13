package com.lagom.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lagom.domain.BoardDTO;



public interface BoardDAO {

	//게시글 갯수 계산
	public int countArticle(@Param("map")Map<String,String>map);
	
	//목록(페이지 나누기, 검색 기능 포함) map 안에 1,10담아져있음
	public List<BoardDTO> titleList(@Param("map")Map<String,Object>map);
	
	//상세게시글 출력
	public BoardDTO detailView(int bno);

	//조회수 1증가
	public void increaseViewCnt(@Param("bno") int bno);
	
	//게시글 삭제
	public void delBoard(int bno);
	
	//DB에 등록
	public void write(BoardDTO bDto);
	
	//게시글 수정
	public void updateBoard(BoardDTO bDto);
	
	//추천수 1 증가
	public void increaseGoodCnt(@Param("bno") int bno);
	
	//게시글 답글 등록
	public void answer(BoardDTO bDto);
	
	//re_step 수정
	public void updateStep(BoardDTO bDto);
	
	//첨부파일 등록
	public void addAttach(@Param("fullName") String fullName);
	
	//첨부파일 목록 
	public List<String> getAttach(@Param("bno")int bno);
	

}
