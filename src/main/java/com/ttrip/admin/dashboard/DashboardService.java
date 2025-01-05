package com.ttrip.admin.dashboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DashboardService {
    
    @Autowired
    private DashboardDAO dashboardDAO;
    
    public List<DashboardDomain> getTopRecommendedRegions() {
        return dashboardDAO.getTopRecommendedRegions();
    }
    
    public List<DashboardDomain> getTopVisitedPlaces() {
        return dashboardDAO.getTopVisitedPlaces();
    }
    
    public List<DashboardDomain> getWeeklyLoginUsers() {
        return dashboardDAO.getWeeklyLoginUsers();
    }
    
    public List<DashboardDomain> getPendingReports() {
        return dashboardDAO.getPendingReports();
    }
}
