package com.ttrip.admin.dstnt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/dstnt")
public class AdminDstntController {

    // 공통된 메서드로 페이지 반환
    private String renderPage() {
        return "admin/admin_travel/";
    }

}
