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
	private String type; // 게시판 종류
	private String title; // 제목
	private String view_content; //내용 (에디터 태그 추가)
	private String search_content; // 내용(순수 Text)
	private String writer; //작성자
	private int viewcnt; //조회수
	private int replycnt; // 댓글수
	private int goodcnt; //좋아요
	private Date regdate; //작성일자 
	private Date updatedate; //수정일자
	private String show; //화면표시여부
	private String[] files; //첨부파일 이름 배열 (몇개 올릴지 모르니까)
	private int ref; // 답변그룹번호
	private int re_step; // 답변 출력 순번
	private int re_level; // 답변단계 (계층형)
	
	
	

}
