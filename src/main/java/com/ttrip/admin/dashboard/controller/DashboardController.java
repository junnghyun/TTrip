package com.ttrip.admin.dashboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttrip.admin.dashboard.DashboardDomain;
import com.ttrip.admin.dashboard.DashboardService;

@Controller
@RequestMapping("/admin/dashboard")
public class DashboardController {
    
    @Autowired
    private DashboardService dashboardService;
    
    @GetMapping("")
    public String dashboard() {
        return "admin/admin_dashboard/admin_dashboard";
    }
    
    @GetMapping(value = "/getRegionData", produces = "application/json")
    @ResponseBody
    public List<DashboardDomain> getRegionData() {
        return dashboardService.getTopRecommendedRegions();
    }
    
    @GetMapping(value = "/getTopVisitedPlaces", produces = "application/json")
    @ResponseBody
    public List<DashboardDomain> getTopVisitedPlaces() {
        List<DashboardDomain> result = dashboardService.getTopVisitedPlaces();
        return result;
    }
    
    @GetMapping(value = "/getWeeklyLoginUsers", produces = "application/json")
    @ResponseBody
    public List<DashboardDomain> getWeeklyLoginUsers() {
        List<DashboardDomain> result = dashboardService.getWeeklyLoginUsers();
        return result;
    }
    
    @GetMapping(value = "/getPendingReports", produces = "application/json")
    @ResponseBody
    public List<DashboardDomain> getPendingReports() {
        List<DashboardDomain> result = dashboardService.getPendingReports();
        return result;
    }
}