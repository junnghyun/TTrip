package com.ttrip.tripboard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ttrip.accom.AccomDomain;
import com.ttrip.course.CourseDomain;
import com.ttrip.dstmt.DstntDomain;
import com.ttrip.tripplan.TripPlanDomain;

@Mapper
public interface TripBoardDAO {
    List<DstntDomain> getDestinationsByRegion(String region);
    List<AccomDomain> getAccommodationsByRegion(String region);
    
    void insertTripBoard(TripBoardDomain tripBoard);
    void insertTripPlan(TripPlanDomain tripPlan);
    void insertCourse(CourseDomain course);
    void insertAccomPlan(AccomDomain accom);
}