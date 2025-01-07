package com.ttrip.traveldetail;

import lombok.Data;

@Data
public class TripPlanDomain {
	private int trip_planID;
    private int trip_day;
    private String plan_title;
    private String visit_order;
    private int DSTNTID;
    private String destination_name;
    private String destination_addr;
    private String destination_img; // 이미지 파일명만 저장
    private String destination_detail;
    private double lat;
    private double lng;
    
    // getter는 원래 이름 그대로 유지, setter에서도 파일명만 저장
    public void setDestination_img(String destination_img) {
        this.destination_img = destination_img;
    }
}

