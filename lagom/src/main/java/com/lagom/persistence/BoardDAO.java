package com.lagom.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lagom.domain.BoardDTO;



public interface BoardDAO {

	//게시글 갯수 계산
	public int countArticle(@Param("map")Map<String,String>map);
	
	//목록(페이지 나누기, 검색 기능 포함) map 안에 1,10담아져있음
	public List<BoardDTO> titleList(@Param("map")Map<String,Object>map);
	
	

}