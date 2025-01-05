package com.ttrip.mypage.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ttrip.auth.jwt.JwtUtil;
import com.ttrip.main.MainDomain;
import com.ttrip.mypage.MypageDomain;
import com.ttrip.mypage.MypageService;

@RestController
@RequestMapping("/user/api")
public class MypageApiController {
    
    private final MypageService mypageService;
    private final JwtUtil jwtUtil;

    @Autowired
    public MypageApiController(MypageService mypageService, JwtUtil jwtUtil) {
        this.mypageService = mypageService;
        this.jwtUtil = jwtUtil;
    }
    
    @GetMapping("/mypage_myboard")
    public Map<String, Object> getMyBoardData(
            @RequestHeader("Authorization") String authorization,
            @RequestParam(name = "page", defaultValue = "1") int page) {
        
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            throw new IllegalArgumentException("Authorization header is missing or invalid");
        }

        try {
            String token = authorization.split(" ")[1];
            String nick = jwtUtil.getNick(token);
            
            List<MypageDomain> boards = mypageService.getMyBoardList(nick, page);
            
            // 날짜 포맷 변환
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
            for (MypageDomain board : boards) {
                if (board.getInput_date() != null) {
                    String formattedDate = sdf.format(board.getInput_date());
                    board.setFormatted_date(formattedDate);
                }
            }
            
            int totalPages = mypageService.getTotalMyBoardPages(nick);
            int startPage = mypageService.getStartPage(page);
            int endPage = mypageService.getEndPage(startPage, totalPages);
            
            Map<String, Object> response = new HashMap<>();
            response.put("boards", boards);
            response.put("currentPage", page);
            response.put("totalPages", totalPages);
            response.put("startPage", startPage);
            response.put("endPage", endPage);
            response.put("nick", nick);
            
            return response;
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch board data", e);
        }
    }
    

    @GetMapping("/mypage_comment")
    public Map<String, Object> getCommentData(
            @RequestHeader("Authorization") String authorization,
            @RequestParam(name = "page", defaultValue = "1") int page) {
        
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            throw new IllegalArgumentException("Authorization header is missing or invalid");
        }

        try {
            String token = authorization.split(" ")[1];
            String nick = jwtUtil.getNick(token);
            
            List<MypageDomain> comments = mypageService.getMyCommentList(nick, page);
            
            // 날짜 포맷 변환
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
            for (MypageDomain comment : comments) {
                if (comment.getComment_date() != null) {
                    comment.setComment_text(comment.getComment_text());
                    // Timestamp를 String으로 변환
                    String formattedDate = sdf.format(comment.getComment_date());
                    comment.setFormatted_date(formattedDate); // MypageDomain에 formatted_date 필드 추가 필요
                }
            }
            
            int totalPages = mypageService.getTotalCommentPages(nick);
            int startPage = mypageService.getStartPage(page);
            int endPage = mypageService.getEndPage(startPage, totalPages);
            
            Map<String, Object> response = new HashMap<>();
            response.put("comments", comments);
            response.put("currentPage", page);
            response.put("totalPages", totalPages);
            response.put("startPage", startPage);
            response.put("endPage", endPage);
            response.put("nick", nick);
            
            return response;
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch comment data", e);
        }
    }
    
    @GetMapping("/mypage_course")
    public Map<String, Object> getCourseData(
            @RequestHeader("Authorization") String authorization,
            @RequestParam(name = "page", defaultValue = "1") int page) {
        
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            throw new IllegalArgumentException("Authorization header is missing or invalid");
        }

        try {
            String token = authorization.split(" ")[1];
            String nick = jwtUtil.getNick(token);
            
            List<MainDomain> courses = mypageService.getMyCourses(nick, page);
            
            // 날짜 포맷 변환
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
            for (MainDomain course : courses) {
                if (course.getInput_date() != null) {
                    String formattedDate = sdf.format(course.getInput_date());
                    course.setFormatted_date(formattedDate); 
                }
            }
            
            int totalPages = mypageService.getTotalPages(nick);
            
            Map<String, Object> response = new HashMap<>();
            response.put("courses", courses);
            response.put("currentPage", page);
            response.put("totalPages", totalPages);
            response.put("nick", nick);
            
            return response;
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch course data", e);
        }
    }

    @GetMapping("/mypage_recommend")
    public Map<String, Object> getRecommendData(
            @RequestHeader("Authorization") String authorization,
            @RequestParam(name = "page", defaultValue = "1") int page) {
        
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            throw new IllegalArgumentException("Authorization header is missing or invalid");
        }

        try {
            String token = authorization.split(" ")[1];
            String nick = jwtUtil.getNick(token);
            
            List<MypageDomain> recommends = mypageService.getRecommendList(nick, page);
            
            // 날짜 포맷 변환
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
            for (MypageDomain recommend : recommends) {
                if (recommend.getInput_date() != null) {
                    String formattedDate = sdf.format(recommend.getInput_date());
                    recommend.setFormatted_date(formattedDate);
                }
            }
            
            int totalPages = mypageService.getTotalRecommendPages(nick);
            int startPage = mypageService.getStartPage(page);
            int endPage = mypageService.getEndPage(startPage, totalPages);
            
            Map<String, Object> response = new HashMap<>();
            response.put("recommends", recommends);
            response.put("currentPage", page);
            response.put("totalPages", totalPages);
            response.put("startPage", startPage);
            response.put("endPage", endPage);
            response.put("nick", nick);
            
            return response;
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch recommend data", e);
        }
    }

    @GetMapping("/mypage_report")
    public Map<String, Object> getReportData(
            @RequestHeader("Authorization") String authorization,
            @RequestParam(name = "page", defaultValue = "1") int page) {
        
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            throw new IllegalArgumentException("Authorization header is missing or invalid");
        }

        try {
            String token = authorization.split(" ")[1];
            String nick = jwtUtil.getNick(token);
            
            List<MypageDomain> reports = mypageService.getMyReportList(nick, page);
            
            // 날짜 포맷 변환
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
            for (MypageDomain report : reports) {
                if (report.getInput_date() != null) {
                    String formattedDate = sdf.format(report.getInput_date());
                    report.setFormatted_date(formattedDate);
                }
                // 신고 상태 텍스트 설정
                report.setReport_status_text(report.getReport_status().equals("C") ? "처리완료" : "처리중");
            }
            
            int totalPages = mypageService.getTotalReportPages(nick);
            int startPage = mypageService.getStartPage(page);
            int endPage = mypageService.getEndPage(startPage, totalPages);
            
            Map<String, Object> response = new HashMap<>();
            response.put("reports", reports);
            response.put("currentPage", page);
            response.put("totalPages", totalPages);
            response.put("startPage", startPage);
            response.put("endPage", endPage);
            response.put("nick", nick);
            
            return response;
        } catch (Exception e) {
            throw new RuntimeException("Failed to fetch report data", e);
        }
    }
}