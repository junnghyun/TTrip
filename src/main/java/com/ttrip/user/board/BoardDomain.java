package com.ttrip.user.board;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class BoardDomain {

	private int boardId,categoryId,likeCnt;
	private String nick,title,content,status,category;
	private Timestamp inputDate;
	
	
}
