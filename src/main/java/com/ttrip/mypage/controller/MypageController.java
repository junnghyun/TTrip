package com.ttrip.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ttrip.main.MainDomain;
import com.ttrip.mypage.MypageDomain;
import com.ttrip.mypage.MypageService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class MypageController {
	
    @Autowired
    private MypageService mypageService;
    
//    @Autowired
//    private JwtUtil jwtUtil;
    
    @GetMapping("/mypage_myboard")
    public String mypage_myboard(HttpServletRequest request, Model model, 
            @RequestParam(name = "page", defaultValue = "1") int page) {
        
        // Authorization 헤더에서 토큰 추출
        String authorization = request.getHeader("jwt_token");
        
        System.out.println(authorization);
        
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            return "redirect:/login";
        }
        
        try {
            String token = authorization.split(" ")[1];
            
            // 토큰 만료 체크
            if (jwtUtil.isExpired(token)) {
                return "redirect:/login";
            }
            
            // 토큰에서 닉네임 추출
            String nick = jwtUtil.getNick(token);
            if (nick == null) {
                return "redirect:/login";
            }
            
            List<MypageDomain> boards = mypageService.getMyBoardList(nick, page);
            int totalPages = mypageService.getTotalMyBoardPages(nick);
            int startPage = mypageService.getStartPage(page);
            int endPage = mypageService.getEndPage(startPage, totalPages);
            
            model.addAttribute("boards", boards);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("startPage", startPage);
            model.addAttribute("endPage", endPage);
            model.addAttribute("nick", nick);
            
            return "ttrip/user/mypage/mypage_myboard";
            
        } catch (Exception e) {
            return "redirect:/login";
        }
    }
	
	@GetMapping("/mypage_course")
    public String mypage_course(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
    
	    // 테스트용 세팅
		String nick = "user1";  // 실제로는 세션에서 가져와야 함
        
        List<MainDomain> courses = mypageService.getMyCourses(nick, page);
        int totalPages = mypageService.getTotalPages(nick);
        
        model.addAttribute("courses", courses);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("nick", nick);
        
        return "ttrip/mypage/mypage_course";
    }
	
	@GetMapping("/mypage_recommend")
	public String mypage_recommend(Model model, @RequestParam(name = "page", defaultValue = "1") int page) {
	    String nick = "user1";  // 실제로는 세션에서 가져와야 함
	    
	    List<MypageDomain> recommends = mypageService.getRecommendList(nick, page);
	    int totalPages = mypageService.getTotalRecommendPages(nick);
	    int startPage = mypageService.getStartPage(page);
	    int endPage = mypageService.getEndPage(startPage, totalPages);
	    
	    model.addAttribute("recommends", recommends);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("nick", nick);
	    
	    return "ttrip/mypage/mypage_recommend";
	}
	
	
	@GetMapping("/mypage_comment")
	public String mypage_comment(Model model, @RequestParam(name = "page", defaultValue = "1") int page) {
	    String nick = "user1";  // 실제로는 세션에서 가져와야 함
	    
	    List<MypageDomain> comments = mypageService.getMyCommentList(nick, page);
	    int totalPages = mypageService.getTotalCommentPages(nick);
	    int startPage = mypageService.getStartPage(page);
	    int endPage = mypageService.getEndPage(startPage, totalPages);
	    
	    model.addAttribute("comments", comments);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("nick", nick);
	    
	    return "ttrip/mypage/mypage_comment";
	}
	
	
	
	@GetMapping("/mypage_report")
	public String mypage_report(Model model, @RequestParam(name = "page", defaultValue = "1") int page) {
	    String nick = "user1";  // 실제로는 세션에서 가져와야 함
	    
	    List<MypageDomain> reports = mypageService.getMyReportList(nick, page);
	    int totalPages = mypageService.getTotalReportPages(nick);
	    int startPage = mypageService.getStartPage(page);
	    int endPage = mypageService.getEndPage(startPage, totalPages);
	    
	    model.addAttribute("reports", reports);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("nick", nick);
	    
	    return "ttrip/mypage/mypage_report";
	}
	
	@GetMapping("/edit_member")
	public String edit_member() {
		return "ttrip/mypage/edit_member";
	}

	@GetMapping("/delete_member")
	public String delete_member() {
		return "ttrip/mypage/delete_member";
	}
}