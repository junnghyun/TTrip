package com.ttrip.user.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchVO {
	private int startNum,endNum,currentPage,totalPage,totalCount;
	//검색 시작번호,끝번호, 현재페이지번호, 총 페이지수, 총게시물의 수
	private String field="0",keyword,url;//검색할 field에 대응되는 숫자, 검색 값,이동할 URL
}
