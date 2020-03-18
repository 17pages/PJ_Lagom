package com.lagom.persistence;

import java.util.List;

import com.lagom.domain.BoardDTO;



public interface BoardDAO {
	public List<BoardDTO> titleList();

}
