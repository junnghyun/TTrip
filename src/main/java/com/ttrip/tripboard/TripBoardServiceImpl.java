package com.ttrip.tripboard;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ttrip.accom.AccomDomain;
import com.ttrip.course.CourseDomain;
import com.ttrip.dstmt.DstntDomain;
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
    public void createTripBoard(TripBoardDomain tripBoard, List<TripPlanDomain> tripPlans) {
        tripBoardDAO.insertTripBoard(tripBoard);
        for (TripPlanDomain tripPlan : tripPlans) {
            tripBoardDAO.insertTripPlan(tripPlan);
            for (CourseDomain course : tripPlan.getCourses()) {
                tripBoardDAO.insertCourse(course);
            }
            if (tripPlan.getAccom() != null) {
                tripBoardDAO.insertAccomPlan(tripPlan.getAccom());
            }
        }
    }

    
}
