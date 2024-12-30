package com.ttrip.tripboard;

import java.util.List;
import java.util.Map;

import com.ttrip.accom.AccomDomain;
import com.ttrip.dstnt.domain.DstntDomain;
import com.ttrip.tripplan.TripPlanDomain;

public interface TripBoardService {
    List<DstntDomain> getDestinationsByRegion(String region);
    List<AccomDomain> getAccommodationsByRegion(String region);
    
}
