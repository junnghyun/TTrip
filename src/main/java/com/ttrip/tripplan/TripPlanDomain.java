package com.ttrip.tripplan;

import java.sql.Date;
import java.util.List;

import com.ttrip.accom.AccomDomain;
import com.ttrip.accom.AccomPlanDomain;
import com.ttrip.course.CourseDomain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TripPlanDomain {
    private int tripPlanId;
    private int tripBoardId;
    private String planTitle;
    private String visitOrder;
    private Date tripDate;
}
