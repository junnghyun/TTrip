package com.ttrip.user.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {

	private int boardId,categoryId; //게시글 순서, 카테고리 순서
	private String nick,title,detail,status,category;
	//닉네임, 제목, 내용, 'Y', 
	//status: 'Y' 게시판 활성화 'N'게시판 삭제 'B' 신고처리(블라인드)
	//board테이블의 nick값은 반드시 member테이블에 존재하는 nick값
	//이를 통해 board->각 레코드가 유효한 사용자(회원)과 연결
	//board 테이블의 CategoryID 값은 반드시 Category 테이블에 존재하는 CategoryID 값
	//이를 통해 board->각 레코드가 유효한 카테고리와 연결되도록 보장합니다.
	
}//BoardVO
