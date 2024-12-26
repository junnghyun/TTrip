package com.ttrip.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    
    // 회원 상세정보 조회
    @GetMapping("/admin_member/detail/{nick}")
    public String getMemberDetail(@PathVariable(name = "nick") String nick, Model model) {
        try {
            MemberVO member = memberService.getMemberByNick(nick);
            if (member != null) {
                model.addAttribute("member", member);
                return "/admin/admin_member/member_modal"; // :: content 부분 제거
            } else {
                return "error";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
    
    @PostMapping("/admin_member/update")
    @ResponseBody
    public ResponseEntity<String> updateMember(@RequestBody MemberVO member) {
        try {
            System.out.println("Updating member - Original Nick: " + member.getMemberNick() + ", New Nick: " + member.getNick());
            memberService.updateMember(member);
            return ResponseEntity.ok("{\"status\":\"success\", \"message\":\"회원 정보가 수정되었습니다.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{\"status\":\"error\", \"message\":\"회원 정보 수정에 실패했습니다.\"}");
        }
    }
    
    @PostMapping("/admin_member/delete/{nick}")
    @ResponseBody
    public ResponseEntity<String> deleteMember(@PathVariable(name = "nick") String nick) {
        try {
            memberService.deleteMember(nick);
            return ResponseEntity.ok("{\"status\":\"success\", \"message\":\"회원이 삭제되었습니다.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{\"status\":\"error\", \"message\":\"회원 삭제에 실패했습니다.\"}");
        }
    }
    
}