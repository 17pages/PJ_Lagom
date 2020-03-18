package com.lagom.service.board;

import java.util.List;

import com.lagom.domain.BoardDTO;

public interface BoardService  {
	public List<BoardDTO> titleList();

}
