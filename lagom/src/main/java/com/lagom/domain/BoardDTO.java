package com.lagom.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
	private int bno; //게시글 번호
	private String title; // 제목
	private String content; //내용
	private String writer; //작성자
	private int viewcnt; //조회수
	private int replycnt; // 댓글수
	private int goodcnt; //좋아요
	private Date regdate; //작성일자 
	private Date updatedate; //수정일자
	private String show; //화면표시여부
	private int ref; // 답변그룹번호
	private int re_step; // 답변 출력 순번
	private int re_level; // 답변단계 (계층형)
	
	
	

}
