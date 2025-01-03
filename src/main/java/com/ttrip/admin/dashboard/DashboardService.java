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
}
