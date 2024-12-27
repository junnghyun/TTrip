package com.ttrip.user.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RecommendVO {

	//sql의 board_recom 받음
	private int recomID,boardID;
	private String nick;
	//nick 값은 반드시 member 테이블에 존재하는 nick
	//->이를 통해 추천(recommendation) 레코드가 유효한 사용자(회원)와 연결
	// boardID 열이 board 테이블의 boardID 열을 참조
	//->이를 통해 추천 레코드가 유효한 게시물(board)과 연결
}//RecommendVO
