package com.ttrip.main;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

@Service
public class MainService {
	    
	@Autowired(required = false)
	private MainDAO mDAO;
	
	/**
	 * 초기 게시글 리스트 조회 (12개)
	 */
	public List<MainDomain> searchInitialTripBoards() {
	    List<MainDomain> list = null;
	    
	    try {
	        list = mDAO.selectInitialTripBoards();
	    } catch(PersistenceException pe) {
	        pe.printStackTrace();
	    }
	    
	    return list;
	}
	
	/**
	 * 더보기시 추가 게시글 조회 후 JSON 반환
	 */
	@SuppressWarnings("unchecked")
	public String searchMoreTripBoards(int offset) {
	    JSONObject jsonObj = new JSONObject();
	    List<MainDomain> list = null;
	    
	    try {
	        list = mDAO.selectMoreTripBoards(offset);
	        // MainDomain의 input_date를 JSON으로 변환할 때 형식 지정
	        JSONArray jsonArray = new JSONArray();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        
	        for(MainDomain md : list) {
	            JSONObject boardObj = new JSONObject();
	            boardObj.put("trip_boardID", md.getTrip_boardID());
	            boardObj.put("nick", md.getNick());
	            boardObj.put("title", md.getTitle());
	            boardObj.put("start_date", md.getStart_date() != null ? sdf.format(md.getStart_date()) : "");
	            boardObj.put("end_date", md.getEnd_date() != null ? sdf.format(md.getEnd_date()) : "");
	            boardObj.put("trip_period", md.getTrip_period());
	            boardObj.put("input_date", md.getInput_date() != null ? sdf.format(md.getInput_date()) : "");
	            boardObj.put("region", md.getRegion());
	            boardObj.put("firstImageUrl", md.getFirstImageUrl());
	            boardObj.put("recom_count", md.getRecom_count());
	            boardObj.put("comment_count", md.getComment_count());
	            
	            jsonArray.add(boardObj);
	        }
	        
	        jsonObj.put("boardList", jsonArray);
	        jsonObj.put("status", "success");
	    } catch(PersistenceException pe) {
	        jsonObj.put("status", "error");
	        pe.printStackTrace();
	    }
	    
	    return jsonObj.toJSONString();
	}
	
	/**
	 * 여행 기간 계산
	 */
	public void calculatePeriod(MainDomain mDomain) {
	    if(mDomain.getStart_date() != null && mDomain.getEnd_date() != null) {
	        mDomain.calculateTripPeriod();
	    }
	}
	
	public List<MainDomain> searchBestTripBoards() {
	    List<MainDomain> list = null;
	    
	    try {
	        list = mDAO.selectBestTripBoards();
	    } catch(PersistenceException pe) {
	        pe.printStackTrace();
	    }
	    
	    return list;
	}

	@SuppressWarnings("unchecked")
	public String searchMoreBestTripBoards(int offset) {
	    JSONObject jsonObj = new JSONObject();
	    List<MainDomain> list = null;
	    
	    try {
	        list = mDAO.selectMoreBestTripBoards(offset);
	        
	        // MainDomain의 input_date를 JSON으로 변환할 때 형식 지정
	        JSONArray jsonArray = new JSONArray();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        
	        for(MainDomain md : list) {
	            JSONObject boardObj = new JSONObject();
	            boardObj.put("trip_boardID", md.getTrip_boardID());
	            boardObj.put("nick", md.getNick());
	            boardObj.put("title", md.getTitle());
	            boardObj.put("start_date", md.getStart_date() != null ? sdf.format(md.getStart_date()) : "");
	            boardObj.put("end_date", md.getEnd_date() != null ? sdf.format(md.getEnd_date()) : "");
	            boardObj.put("trip_period", md.getTrip_period());
	            boardObj.put("input_date", md.getInput_date() != null ? sdf.format(md.getInput_date()) : "");
	            boardObj.put("region", md.getRegion());
	            boardObj.put("firstImageUrl", md.getFirstImageUrl());
	            boardObj.put("recom_count", md.getRecom_count());
	            boardObj.put("comment_count", md.getComment_count());
	            
	            jsonArray.add(boardObj);
	        }
	        
	        jsonObj.put("boardList", jsonArray);
	        jsonObj.put("status", "success");
	    } catch(PersistenceException pe) {
	        jsonObj.put("status", "error");
	        pe.printStackTrace();
	    }
	    
	    return jsonObj.toJSONString();
	}
	
	public List<MainDomain> searchMyTripBoards(String nick) {
	    List<MainDomain> list = null;
	    
	    try {
	        list = mDAO.selectMyTripBoards(nick);
	    } catch(PersistenceException pe) {
	        pe.printStackTrace();
	    }
	    
	    return list;
	}

	@SuppressWarnings("unchecked")
	public String searchMoreMyTripBoards(String nick, int offset) {
	    JSONObject jsonObj = new JSONObject();
	    List<MainDomain> list = null;
	    
	    try {
	        Map<String, Object> params = new HashMap<>();
	        params.put("nick", nick);
	        params.put("offset", offset);
	        list = mDAO.selectMoreMyTripBoards(params);
	        
	        // MainDomain의 input_date를 JSON으로 변환할 때 형식 지정
	        JSONArray jsonArray = new JSONArray();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        
	        for(MainDomain md : list) {
	            JSONObject boardObj = new JSONObject();
	            boardObj.put("trip_boardID", md.getTrip_boardID());
	            boardObj.put("nick", md.getNick());
	            boardObj.put("title", md.getTitle());
	            boardObj.put("start_date", md.getStart_date() != null ? sdf.format(md.getStart_date()) : "");
	            boardObj.put("end_date", md.getEnd_date() != null ? sdf.format(md.getEnd_date()) : "");
	            boardObj.put("trip_period", md.getTrip_period());
	            boardObj.put("input_date", md.getInput_date() != null ? sdf.format(md.getInput_date()) : "");
	            boardObj.put("region", md.getRegion());
	            boardObj.put("firstImageUrl", md.getFirstImageUrl());
	            boardObj.put("recom_count", md.getRecom_count());
	            boardObj.put("comment_count", md.getComment_count());
	            
	            jsonArray.add(boardObj);
	        }
	        
	        jsonObj.put("boardList", jsonArray);
	        jsonObj.put("status", "success");
	    } catch(PersistenceException pe) {
	        jsonObj.put("status", "error");
	        pe.printStackTrace();
	    }
	    
	    return jsonObj.toJSONString();
	}
	
	public boolean deleteTripBoard(int boardId) {
	    try {
	        return mDAO.deleteTripBoard(boardId) > 0;
	    } catch(PersistenceException pe) {
	        pe.printStackTrace();
	        return false;
	    }
	}
	
	
}
