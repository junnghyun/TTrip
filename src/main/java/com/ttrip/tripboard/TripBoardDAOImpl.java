package com.ttrip.tripboard;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import com.ttrip.dstmt.DstntDomain;
import com.ttrip.accom.AccomDomain;

@Repository
@Primary
public class TripBoardDAOImpl implements TripBoardDAO {

    @Autowired
    private TripBoardMapper tripBoardMapper;

    @Override
    public List<DstntDomain> getDestinationsByRegion(int regionId) {
        return tripBoardMapper.getDestinationsByRegion(regionId);
    }

    @Override
    public List<AccomDomain> getAccommodationsByRegion(int regionId) {
        return tripBoardMapper.getAccommodationsByRegion(regionId);
    }
}
