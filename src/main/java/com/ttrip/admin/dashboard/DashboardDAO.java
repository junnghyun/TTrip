package com.ttrip.admin.dashboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "mapper.dashboardMapper";
    
    public List<Map<String, Object>> getTopRecommendedRegions() {
        return sqlSession.selectList(NAMESPACE + ".getTopRecommendedRegions");
    }
}
