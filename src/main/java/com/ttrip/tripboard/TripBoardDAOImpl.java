package com.ttrip.tripboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TripBoardDAOImpl implements TripBoardDAO {
	@Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.ttrip.mapper.TripBoardMapper";

    @Override
    public List<TripBoardDomain> getDestinationsByRegion(String region) {
        return sqlSession.selectList(NAMESPACE + ".getDestinationsByRegion", region);
    }
}
