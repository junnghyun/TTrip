package com.ttrip.tripboard;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import com.ttrip.dstmt.DstntDomain;
import com.ttrip.tripplan.TripPlanDomain;
import com.ttrip.accom.AccomDomain;
import com.ttrip.course.CourseDomain;

@Repository
@Primary
public class TripBoardDAOImpl implements TripBoardDAO {

    @Autowired
    private TripBoardMapper tripBoardMapper;

    @Override
    public List<DstntDomain> getDestinationsByRegion(String region) {
        return tripBoardMapper.getDestinationsByRegion(region);
    }

    @Override
    public List<AccomDomain> getAccommodationsByRegion(String region) {
        return tripBoardMapper.getAccommodationsByRegion(region);
    }
    
    @Override
    public void insertTripBoard(TripBoardDomain tripBoard) {
        tripBoardMapper.insertTripBoard(tripBoard);
    }

    @Override
    public void insertTripPlan(TripPlanDomain tripPlan) {
        tripBoardMapper.insertTripPlan(tripPlan);
    }

    @Override
    public void insertCourse(CourseDomain course) {
        tripBoardMapper.insertCourse(course);
    }

    @Override
    public void insertAccomPlan(AccomDomain accom) {
        tripBoardMapper.insertAccomPlan(accom);
    }
    
}
