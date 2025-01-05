package com.ttrip.admin.dashboard;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DashboardDomain {
	//지역 추천
	private int regionId;      // 지역 ID
    private String region;     // 지역명 
    private int recomCount;    // 추천 수 (trip_board_recom 테이블의 count)
    private int postCount;     // 해당 지역 게시글 수 (trip_board 테이블의 count)
    
    //많이 방문한 여행지
    private String dstntName;    // 여행지 이름
    private int visitCount;      // 방문 횟수
    
    //접속자 차트
    private String loginDate;    // 접속일
    private int userCount;       // 접속자 수
    
    //신고차트
    private String boardType;     // 게시판 종류
    private int pendingCount;     // 미처리 신고 건수
}
