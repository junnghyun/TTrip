package com.ttrip.admin.dashboard;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DashboardDomain {
	private int regionId;      // 지역 ID
    private String region;     // 지역명 
    private int recomCount;    // 추천 수 (trip_board_recom 테이블의 count)
    private int postCount;     // 해당 지역 게시글 수 (trip_board 테이블의 count)
}
