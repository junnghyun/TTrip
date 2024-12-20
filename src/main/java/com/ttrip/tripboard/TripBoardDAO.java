package com.ttrip.tripboard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ttrip.accom.AccomDomain;
import com.ttrip.dstmt.DstntDomain;

@Mapper
public interface TripBoardDAO {
    List<DstntDomain> getDestinationsByRegion(int regionId);
    List<AccomDomain> getAccommodationsByRegion(int regionId);
}