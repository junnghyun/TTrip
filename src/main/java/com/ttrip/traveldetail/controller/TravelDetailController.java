package com.ttrip.traveldetail.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ttrip.auth.jwt.JwtUtil;
import com.ttrip.traveldetail.AccommodationDomain;
import com.ttrip.traveldetail.CommentDomain;
import com.ttrip.traveldetail.TravelDetailDomain;
import com.ttrip.traveldetail.TravelDetailService;
import com.ttrip.traveldetail.TripPlanDomain;

@Controller
@RequestMapping("/travel") 
public class TravelDetailController {
    
    @Autowired
    private TravelDetailService travelDetailService;
    
    @Autowired
    private JwtUtil jwtUtil;
    
    /**
     * 여행 상세 페이지 조회
     */
    @GetMapping("/detail/{tripBoardId}")
    public String getTripBoardDetail(@PathVariable("tripBoardId") int tripBoardId, 
                                   @RequestHeader(value = "Authorization", required = false) String authorization,
                                   Model model) {
        // 기본 게시글 정보 조회
        TravelDetailDomain tripBoard = travelDetailService.getTripBoardDetail(tripBoardId);
        if(tripBoard == null) {
            return "redirect:/main_tripboard";
        }
        
        // 로그인 사용자 정보
        String currentUserNick = null;
        if(authorization != null && authorization.startsWith("Bearer ")) {
            String token = authorization.split(" ")[1];
            currentUserNick = jwtUtil.getNick(token);
            model.addAttribute("currentUserNick", currentUserNick);
        }
         	
        // 일차별 여행지 정보 조회
        List<TripPlanDomain> tripPlans = travelDetailService.getTripPlansByDay(tripBoardId);
        List<AccommodationDomain> accommodations = travelDetailService.getAccommodationsByDay(tripBoardId);
        List<CommentDomain> comments = travelDetailService.getComments(tripBoardId, currentUserNick);
        
        // JSON 변환
        ObjectMapper mapper = new ObjectMapper();
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        
        try {
            model.addAttribute("tripPlansJson", mapper.writeValueAsString(tripPlans));
            model.addAttribute("accommodationsJson", mapper.writeValueAsString(accommodations));
            model.addAttribute("commentsJson", mapper.writeValueAsString(comments));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        
        // View에 데이터 전달
        model.addAttribute("tripBoard", tripBoard);
        model.addAttribute("tripPlans", tripPlans);
        model.addAttribute("accommodations", accommodations);
        model.addAttribute("comments", comments);
        
        // 추천 여부 확인
        boolean hasRecommended = false;
        if(currentUserNick != null) {
            hasRecommended = travelDetailService.checkRecommendation(currentUserNick, tripBoardId);
        }
        model.addAttribute("hasRecommended", hasRecommended);
        
        return "ttrip/main/travel_detail2";
    }
    
    /**
     * 게시글 추천 처리
     */
    @PostMapping("/recommend")
    @ResponseBody
    public Map<String, Object> handleRecommendation(
            @RequestHeader("Authorization") String authorization,
            @RequestParam("tripBoardId") int tripBoardId) {
        if(authorization != null && authorization.startsWith("Bearer ")) {
            String token = authorization.split(" ")[1];
            String nick = jwtUtil.getNick(token);
            return travelDetailService.handleRecommendation(nick, tripBoardId);
        }
        return Map.of("success", false, "message", "로그인이 필요한 서비스입니다.");
    }
    
    @PostMapping("/travel/comment/add")
    @ResponseBody
    public Map<String, Object> addComment(
            @RequestHeader("Authorization") String authorization,
            @RequestParam("tripBoardId") int tripBoardId,
            @RequestParam("detail") String detail) {
        
        Map<String, Object> response = new HashMap<>();
        
        if(authorization == null || !authorization.startsWith("Bearer ")) {
            response.put("success", false);
            response.put("message", "로그인이 필요한 서비스입니다.");
            return response;
        }

        try {
            String token = authorization.split(" ")[1];
            String nick = jwtUtil.getNick(token);
            
            CommentDomain comment = new CommentDomain();
            comment.setTrip_boardID(tripBoardId);
            comment.setNick(nick);
            comment.setDetail(detail);
            
            boolean success = travelDetailService.addComment(comment);
            response.put("success", success);
            
            if(success) {
                // 새로운 댓글 목록 조회 후 반환
                List<CommentDomain> comments = travelDetailService.getComments(tripBoardId, nick);
                response.put("comments", comments);
            }
            
        } catch(Exception e) {
            response.put("success", false);
            response.put("message", "댓글 작성 중 오류가 발생했습니다.");
        }
        
        return response;
    }

    /**
     * 댓글 삭제
     */
    @PostMapping("/travel/comment/delete")
    @ResponseBody
    public Map<String, Object> deleteComment(
            @RequestHeader("Authorization") String authorization,
            @RequestParam("commentId") int commentId,
            @RequestParam("tripBoardId") int tripBoardId) {
        
        Map<String, Object> response = new HashMap<>();
        
        if(authorization == null || !authorization.startsWith("Bearer ")) {
            response.put("success", false);
            response.put("message", "로그인이 필요한 서비스입니다.");
            return response;
        }

        try {
            String token = authorization.split(" ")[1];
            String nick = jwtUtil.getNick(token);
            
            boolean success = travelDetailService.deleteComment(commentId, nick);
            response.put("success", success);
            
            if(success) {
                // 새로운 댓글 목록 조회 후 반환
                List<CommentDomain> comments = travelDetailService.getComments(tripBoardId, nick);
                response.put("comments", comments);
            }
            
        } catch(Exception e) {
            response.put("success", false);
            response.put("message", "댓글 삭제 중 오류가 발생했습니다.");
        }
        
        return response;
    }

    /**
     * 댓글 추천
     */
    @PostMapping("/travel/comment/recommend")
    @ResponseBody
    public Map<String, Object> handleCommentRecommendation(
            @RequestHeader("Authorization") String authorization,
            @RequestParam("commentId") int commentId) {
        
        if(authorization != null && authorization.startsWith("Bearer ")) {
            String token = authorization.split(" ")[1];
            String nick = jwtUtil.getNick(token);
            return travelDetailService.handleCommentRecommendation(nick, commentId);
        }
        return Map.of("success", false, "message", "로그인이 필요한 서비스입니다.");
    }
    
    
}
