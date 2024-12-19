package com.ttrip.tripboard;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TripBoardVO {
	
	private int tripBoardId, regionId;
	private String nick, title, status;
	private Date startDate, endDate;
}