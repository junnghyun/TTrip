package com.ttrip.tripboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import com.ttrip.dstnt.domain.DstntDomain;
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
    
    @Override
    public DstntDomain getDstntByPlace(String place) {
        return sqlSession.selectOne("tripBoardMapper.getDstntByPlace", place);
    }
    
    private final SqlSession sqlSession;

    public TripBoardDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public TripBoardDomain getTripBoardById(int tripBoardID) {
        // MyBatis 쿼리 실행
        TripBoardDomain tripBoard = sqlSession.selectOne("com.ttrip.tripboard.TripBoardMapper.getTripBoardById", tripBoardID);

        // 디버깅: 데이터 확인
        if (tripBoard == null) {
            System.out.println("No data found for tripBoardID: " + tripBoardID);
        } else {
            System.out.println("Title: " + tripBoard.getTitle());
        }

        return tripBoard;
    }
    
    
}
