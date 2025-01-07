package com.ttrip.traveldetail;

import lombok.Data;

@Data
public class AccommodationDomain {
	 private int trip_planID;
    private int trip_day;
    private int accomID;
    private String accom_name;
    private String accom_addr;
    private String phone;
    private double lat;
    private double lng;
}
