package com.ttrip.tripboard;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ttrip.accom.AccomDomain;
import com.ttrip.dstmt.DstntDomain;

@Service
public class TripBoardServiceImpl implements TripBoardService {

	private final TripBoardDAO tripBoardDAO;

    @Autowired
    public TripBoardServiceImpl(TripBoardDAO tripBoardDAO) {
        this.tripBoardDAO = tripBoardDAO;
    }
    @Override
    public List<DstntDomain> getDestinationsByRegion(int regionId) {
        return tripBoardDAO.getDestinationsByRegion(regionId);
    }

    @Override
    public List<AccomDomain> getAccommodationsByRegion(int regionId) {
        return tripBoardDAO.getAccommodationsByRegion(regionId);
    }
}
