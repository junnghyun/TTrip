package com.ttrip.tripboard;

import java.util.List;

import com.ttrip.accom.AccomDomain;
import com.ttrip.course.CourseDomain;
import com.ttrip.dstmt.DstntDomain;
import com.ttrip.tripplan.TripPlanDomain;

public interface TripBoardService {
    List<DstntDomain> getDestinationsByRegion(String region);
    List<AccomDomain> getAccommodationsByRegion(String region);
    
    void createTripBoard(TripBoardDomain tripBoard, List<TripPlanDomain> tripPlans);
}
