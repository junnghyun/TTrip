package com.ttrip.admin.dstnt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ttrip.admin.dstnt.domain.DstntDomain;
import com.ttrip.admin.dstnt.service.DstntService;
import com.ttrip.admin.dstnt.vo.DstntVO;

@Controller
@RequestMapping("/admin/dstnt")
public class AdminDstntController {

    @Autowired
    private DstntService dstntService;

    // 공통된 메서드로 페이지 반환
    private String renderPage(String viewName) {
        return "admin/admin_travel/" + viewName;
    }

    //처음 여행지 관리 화면 보여주기(여행지 목록)
    @GetMapping("/dstnt_manage")
    public String dstntManage(Model model) {
    	List<DstntDomain> dstntList = dstntService.getAllDestinations();
        model.addAttribute("dstntList", dstntList);
        
        return renderPage("manage_travel");
    }
    
    @GetMapping("/dstnt_crawl")
    public String dstntCrawler() {
    	return renderPage("travel_crawler");
    }

    @GetMapping("/search")
    public String searchDestinations(
        @RequestParam(required = false) String region,
        @RequestParam(required = false) String name,
        Model model
    ) {
        List<DstntDomain> dstntList = dstntService.searchDestinations(region, name);
        model.addAttribute("dstntList", dstntList);
        return renderPage("admin_travel");
    }
    

    @GetMapping("/detail_dstnt_frm")
    public String detailDstntFrm(int i, Model model) {
        model.addAttribute("dstntDetail", dstntService.getDestinationById(i));
        return renderPage("travel_edit_modal");
    }

    @GetMapping("/insert_dstnt_frm")
    public String dstntInsertFrm() {
        return renderPage("travel_add_modal");
    }

    @GetMapping("/dstnt_delete")
    public String dstntDelete(int i) {
        dstntService.deleteDestinationById(i);
        return "redirect:/admin/dstnt/dstnt_list"; // 삭제 후 목록 페이지로 리다이렉트
    }
}
