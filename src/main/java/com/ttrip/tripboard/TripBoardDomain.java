package com.ttrip.tripboard;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TripBoardDomain {
	
	private String title, status, detail, dayDetail;
	private int tripBoardId, regionId, lat, lng, day;
	private Date startDate, endDate;
}
