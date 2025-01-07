package com.ttrip.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttrip.admin.member.MemberService;
import com.ttrip.admin.member.MemberVO;

import net.minidev.json.JSONObject;

@Controller
@RequestMapping("/admin")
public class MemberController {
    
    @Autowired
    private MemberService memberService;
    
    private static final int PAGE_SIZE = 10; // 페이지당 보여줄 회원 수
    
    @GetMapping("/member")
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
        
        return "admin/admin_member/admin_member";
    }
    
    @GetMapping("/member/detail/{nick}")
    public String getMemberDetail(@PathVariable(name = "nick") String nick, Model model) {
        try {
            MemberVO member = memberService.getMemberByNick(nick);
            if (member != null) {
                model.addAttribute("member", member);
                return "admin/admin_member/member_modal";
            } else {
                return "error";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
    
    @PostMapping("/member/update")
    @ResponseBody
    public String updateMember(@RequestBody MemberVO member) {
        JSONObject json = new JSONObject();
        try {
            memberService.updateMember(member);
            json.put("status", "success");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("status", "error");
        }
        return json.toString();
    }
    
    @PostMapping("/member/delete/{nick}")
    @ResponseBody
    public String deleteMember(@PathVariable(name = "nick") String nick) {
        JSONObject json = new JSONObject();
        try {
            memberService.deleteMember(nick);
            json.put("status", "success");
        } catch (Exception e) {
            e.printStackTrace();
            json.put("status", "error");
        }
        return json.toString();
    }
}