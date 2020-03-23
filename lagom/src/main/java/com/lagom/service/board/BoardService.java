package com.lagom.service.board;

import java.util.List;

import com.lagom.domain.BoardDTO;

public interface BoardService  {
	
	//게시글 갯수 계산
	public int countArticle(String search_option, String keyword);
		
	//목록(페이지 나누기, 검색 기능 포함)
	public List<BoardDTO> titleList(String search_option, String keyword,String sort_option, int start, int end);

	//가져오기..?
	public BoardDTO detailView(int bno);
}
