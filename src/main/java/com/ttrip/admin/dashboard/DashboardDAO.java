package com.ttrip.admin.dashboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "mapper.dashboardMapper";
    
    public List<DashboardDomain> getTopRecommendedRegions() {
        return sqlSession.selectList(NAMESPACE + ".getTopRecommendedRegions");
    }
    
    
    public List<DashboardDomain> getTopVisitedPlaces() {
        return sqlSession.selectList(NAMESPACE + ".getTopVisitedPlaces");
    }
    
    public List<DashboardDomain> getWeeklyLoginUsers() {
        return sqlSession.selectList(NAMESPACE + ".getWeeklyLoginUsers");
    }
    
    public List<DashboardDomain> getPendingReports() {
        return sqlSession.selectList(NAMESPACE + ".getPendingReports");
    }
}
