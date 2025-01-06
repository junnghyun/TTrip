package com.ttrip.tripboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ttrip.accom.AccomDomain;
import com.ttrip.course.CourseDomain;
import com.ttrip.dstnt.domain.DstntDomain;
import com.ttrip.tripplan.TripPlanDomain;

@Mapper
public interface TripBoardDAO {
    List<DstntDomain> getDestinationsByRegion(String region);
    List<AccomDomain> getAccommodationsByRegion(String region);
    DstntDomain getDstntByPlace(String place);
    
    TripBoardDomain getTripBoardById(int tripBoardID);
}