package com.ttrip.tripboard;

import java.util.List;

import com.ttrip.accom.AccomDomain;
import com.ttrip.dstmt.DstntDomain;

public interface TripBoardService {
    List<DstntDomain> getDestinationsByRegion(int regionId);
    List<AccomDomain> getAccommodationsByRegion(int regionId);
}
