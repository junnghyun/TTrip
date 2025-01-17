package com.ttrip.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttrip.auth.jwt.JwtUtil;
import com.ttrip.main.MainDomain;
import com.ttrip.main.MainService;

@Controller
public class MainController {

	 @Autowired(required = false)
	    private MainService ms;
	 @Autowired
	    private JwtUtil jwtUtil;
	    
	    @RequestMapping(value = "/main_tripboard", method = {RequestMethod.GET,RequestMethod.POST})
	    public String tripBoardList(Model model) {
	        List<MainDomain> boards = null;  
	        try {
	            boards = ms.searchInitialTripBoards();
	            model.addAttribute("boards", boards);  
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return "ttrip/main/main_tripboard";
	    }
	    
	    @PostMapping("/main_tripboard/more")
	    @ResponseBody
	    public String getMoreBoards(@RequestBody Map<String, Integer> param) {
	        String jsonObj = "";
	        
	        try {
	            int offset = param.get("offset");
	            // 추가 게시글 12개를 가져와서 JSON으로 반환
	            jsonObj = ms.searchMoreTripBoards(offset);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        return jsonObj;
	    }
	    
	    @RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	    public String monthBestList(Model model) {
	        List<MainDomain> boards = null;  
	        try {
	            boards = ms.searchBestTripBoards();
	            model.addAttribute("boards", boards);  
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return "ttrip/main/main_monthbest";
	    }

	    @PostMapping("/main_monthbest/more")
	    @ResponseBody
	    public String getMoreBestBoards(@RequestBody Map<String, Integer> param) {
	        String jsonObj = "";
	        try {
	            int offset = param.get("offset");
	            jsonObj = ms.searchMoreBestTripBoards(offset);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return jsonObj;
	    }
	    
	    @RequestMapping(value = "/main_mytripcourse", method = {RequestMethod.GET,RequestMethod.POST})
	    public String myTripCourseList() {
	        return "ttrip/main/main_mytripcourse";
	    }

	    @PostMapping("/main_mytripcourse/more")
	    @ResponseBody
	    public String getMoreMyBoards(@RequestHeader("Authorization") String authorization, 
	                                @RequestBody Map<String, Integer> param) {
	        String jsonObj = "";
	        
	        if (authorization != null && authorization.startsWith("Bearer ")) {
	            try {
	                String token = authorization.split(" ")[1];
	                String nick = jwtUtil.getNick(token);
	                int offset = param.get("offset");
	                jsonObj = ms.searchMoreMyTripBoards(nick, offset);
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        return jsonObj;
	    }
	    
	    @PostMapping("/deleteCourse")
	    @ResponseBody
	    public Map<String, Object> deleteCourse(@RequestBody Map<String, Integer> param) {
	        Map<String, Object> response = new HashMap<>();
	        try {
	            int boardId = param.get("boardId");
	            boolean result = ms.deleteTripBoard(boardId);
	            response.put("success", result);
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.put("success", false);
	        }
	        return response;
	    }
	    
	    
	}
