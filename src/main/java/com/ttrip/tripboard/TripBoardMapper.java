package com.ttrip.tripboard;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ttrip.dstnt.domain.DstntDomain;
import com.ttrip.tripplan.TripPlanDomain;
import com.ttrip.accom.AccomDomain;
import com.ttrip.accom.AccomPlanDomain;
import com.ttrip.course.CourseDomain;

@Mapper
public interface TripBoardMapper {
    List<DstntDomain> getDestinationsByRegion(String region);
    List<AccomDomain> getAccommodationsByRegion(String region);
    
}
