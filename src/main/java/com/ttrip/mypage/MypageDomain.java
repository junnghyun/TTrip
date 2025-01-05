package com.ttrip.mypage;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class MypageDomain {
	private int trip_boardID;
    private String nick;
    private String title;
    private Date start_date;
    private Date end_date;
    private String trip_period;
    private Date input_date;
    private String region;
    private String firstImageUrl;
    private int recom_count;
    private int comment_count;
    private int boardID;
    private int categoryID;
    private String category;  // 카테고리 이름 (자유, 질문, 추천)
    
    // 댓글 관련 필드 추가
    private String comment_text;  // 댓글 내용
    private Timestamp comment_date;  // 댓글 작성일
    private Timestamp board_date;  // 게시글 작성일
    private String formatted_date;

    //신고 관련 필드 추가
    private String report_status;        // 'P': 대기중, 'C': 처리완료
    private String report_status_text;   // '대기중' 또는 '처리완료'로 변환된 텍스트
}
