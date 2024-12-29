package com.ttrip.accom;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccomPlanDomain {
	private int tripPlanId, accomId;
	private Date date;
}
