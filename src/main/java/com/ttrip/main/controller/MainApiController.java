package com.ttrip.main.controller;

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
import com.ttrip.main.MainService;

@RestController
@RequestMapping("/api/main")
public class MainApiController {
    
    @Autowired
    private MainService mainService;
    
    @Autowired
    private JwtUtil jwtUtil;

    @GetMapping("/mytripcourse")
    public Map<String, Object> getMyTripCourseData(
            @RequestHeader(value = "Authorization", required = false) String authorization,
            @RequestParam(value = "offset", defaultValue = "0") int offset) {
        
        Map<String, Object> response = new HashMap<>();
        
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            response.put("success", false);
            response.put("message", "unauthorized");
            return response;
        }

        try {
            String token = authorization.split(" ")[1];
            String nick = jwtUtil.getNick(token);
            System.out.println("토큰에서 추출한 닉네임: " + nick);
            
            List<MainDomain> boards = mainService.searchMyTripBoards(nick);
            
            if (boards != null && !boards.isEmpty()) {
                System.out.println("첫 번째 게시글 데이터:");
                System.out.println("제목: " + boards.get(0).getTitle());
                System.out.println("여행 기간: " + boards.get(0).getTrip_period());
                System.out.println("지역: " + boards.get(0).getRegion());
                System.out.println("이미지 URL: " + boards.get(0).getFirstImageUrl());
                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
                for (MainDomain board : boards) {
                    board.calculateTripPeriod();
                    if (board.getInput_date() != null) {
                        board.setFormatted_date(sdf.format(board.getInput_date()));
                    }
                }
            }
            
            response.put("success", true);
            response.put("boards", boards);
            response.put("nick", nick);
            
            return response;
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "error: " + e.getMessage());
            return response;
        }
    }
}
