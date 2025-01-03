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
    
    // 대시보드 페이지 로드
    @GetMapping("")
    public String dashboard() {
        return "admin/admin_dashboard/admin_dashboard";
    }
    
    // AJAX 요청을 처리하는 메서드
    @GetMapping("/getRegionData")
    @ResponseBody
    public List<DashboardDomain> getRegionData() {
        return dashboardService.getTopRecommendedRegions();
    }
}