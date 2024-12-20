package com.ttrip.user.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {

	private int boardId,categoryId;
	private String nick,title,detail,status,category;

}//BoardVO
