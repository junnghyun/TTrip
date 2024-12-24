package com.ttrip.tripboard;

import java.sql.Date;
import java.util.List;

import com.ttrip.tripplan.TripPlanDomain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TripBoardDomain {
	
	private String title, status, nick;
	private int tripBoardId, regionId;
	private Date startDate, endDate, inputDate;
	
	private List<TripPlanDomain> tripPlans;
}
