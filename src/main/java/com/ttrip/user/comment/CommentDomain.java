package com.ttrip.user.comment;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class CommentDomain {

	private int commentId, boardId;
	private String nick, detail, status;
	private Date inputDate;
	
}//CommentDomain
