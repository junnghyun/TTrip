package com.ttrip.tripboard;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ttrip.dstmt.DstntDomain;
import com.ttrip.accom.AccomDomain;

@Mapper
public interface TripBoardMapper {
    List<DstntDomain> getDestinationsByRegion(int regionId);
    List<AccomDomain> getAccommodationsByRegion(int regionId);
}
