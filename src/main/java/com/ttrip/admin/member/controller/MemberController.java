package com.ttrip.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttrip.admin.member.MemberService;
import com.ttrip.admin.member.MemberVO;

@Controller
public class MemberController {
    
    @Autowired
    private MemberService memberService;
    
    private static final int PAGE_SIZE = 10; // 페이지당 보여줄 회원 수
    
    @GetMapping("/admin_member")
    public String userList(Model model, 
            @RequestParam(value="search", required=false) String searchTerm,
            @RequestParam(value="page", defaultValue="1") int currentPage) {
        
        List<MemberVO> members;
        int totalMembers;
        
        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            members = memberService.searchMembers(searchTerm);
            totalMembers = members.size();
        } else {
            members = memberService.getAllMembers();
            totalMembers = members.size();
        }
        
        // 전체 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalMembers / PAGE_SIZE);
        
        // 현재 페이지에 해당하는 회원 목록 추출
        int start = (currentPage - 1) * PAGE_SIZE;
        int end = Math.min(start + PAGE_SIZE, totalMembers);
        List<MemberVO> pageMembers = members.subList(start, end);
        
        model.addAttribute("members", pageMembers);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("search", searchTerm);
        
        return "/admin/admin_member/admin_member";
    }
    
    @GetMapping("/admin_member/detail/{nick}")
    @ResponseBody
    public MemberVO getMemberDetail(@PathVariable String nick) {
        return memberService.getMemberByNick(nick);
    }

}