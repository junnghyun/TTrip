package com.ttrip.tripboard;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ttrip.accom.AccomDomain;
import com.ttrip.accom.AccomPlanDomain;
import com.ttrip.course.CourseDomain;
import com.ttrip.dstnt.domain.DstntDomain;
import com.ttrip.tripplan.TripPlanDomain;

@Service
public class TripBoardServiceImpl implements TripBoardService {

	private final TripBoardDAO tripBoardDAO;

    @Autowired
    public TripBoardServiceImpl(TripBoardDAO tripBoardDAO) {
        this.tripBoardDAO = tripBoardDAO;
    }
    @Override
    public List<DstntDomain> getDestinationsByRegion(String region) {
        return tripBoardDAO.getDestinationsByRegion(region);
    }

    @Override
    public List<AccomDomain> getAccommodationsByRegion(String region) {
        return tripBoardDAO.getAccommodationsByRegion(region);
    }
    
    @Override
    public TripBoardDomain getTripBoardById(int tripBoardID) {
        return tripBoardDAO.getTripBoardById(tripBoardID);
    }
    
}
