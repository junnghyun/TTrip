package com.ttrip.main;

import java.sql.Date;

import lombok.Data;

@Data
public class MainDomain {
    private int trip_boardID;       // 게시글 ID
    private String nick;            // 작성자 닉네임
    private String title;           // 제목
    private Date start_date;        // 여행 시작일
    private Date end_date;          // 여행 끝일
    private String trip_period;     // 여행 기간(당일,1박2일,2박3일) - 계산된 값
    private Date input_date;        // 작성일
    private String region;          // 지역명
    private String firstImageUrl;   // 첫번째 날 첫번째 코스의 이미지 URL
    private int recom_count;        // 추천수
    private int comment_count;      // 댓글수
    private String formatted_date;  // 추가된 필드

    // start_date와 end_date를 이용해 여행기간을 계산하는 메서드
    public void calculateTripPeriod() {
        if(start_date != null && end_date != null) {
            long diffInMillies = Math.abs(end_date.getTime() - start_date.getTime());
            long diffInDays = diffInMillies / (24 * 60 * 60 * 1000);
            
            if(diffInDays == 0) {
                this.trip_period = "당일여행";
            } else if(diffInDays == 1) {
                this.trip_period = "1박2일";
            } else if(diffInDays == 2) {
                this.trip_period = "2박3일";
            } else {
                this.trip_period = diffInDays + "박" + (diffInDays+1) + "일";
            }
        }
    }
}