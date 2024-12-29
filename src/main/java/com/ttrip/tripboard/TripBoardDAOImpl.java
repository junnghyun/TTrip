package com.ttrip.tripboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import com.ttrip.dstmt.DstntDomain;
import com.ttrip.tripplan.TripPlanDomain;
import com.ttrip.accom.AccomDomain;
import com.ttrip.accom.AccomPlanDomain;
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
    
}
