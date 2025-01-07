package com.ttrip.traveldetail;

import java.sql.Date;

import lombok.Data;

@Data
public class TravelDetailDomain {
	private int trip_boardID;
    private String nick;
    private String title;
    private Date start_date;
    private Date end_date;
    private Date input_date;
    private String region;
    private int recom_count;
}

