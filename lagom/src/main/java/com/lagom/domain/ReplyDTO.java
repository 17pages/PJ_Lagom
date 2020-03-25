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
public class ReplyDTO {
	private int rno;
	private String content;
	private String writer;
	private Date regdate; //작성일자 
	private Date updatedate; //수정일자

}
