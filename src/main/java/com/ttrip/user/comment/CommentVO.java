package com.ttrip.user.comment;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {

	private int commentId;
	private String nick, detail;
	private Date inputDate;
	
}//CommentVO
