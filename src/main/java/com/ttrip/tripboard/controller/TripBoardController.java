package com.ttrip.tripboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttrip.tripboard.TripBoardVO;

@Controller
public class TripBoardController {

	@GetMapping("/tripBoard/get_trip_board_list")
	public String getTripBoardList(String str,Model model) {
		
	}
	
	@GetMapping("/tripBoard/get_trip_board_list_frm")
	public String getTripBoardDetailFrm(int tripBoardId, Model model) {
		
	}

	@GetMapping("/tripBoard/trip_board_insert_frm")
	public String tripBoardInsertFrm() {
		
	}

	@GetMapping("/tripBoard/trip_board_insert")
	public String tripBoardInsert(TripBoardVO tbVO, Model model) {
		
	}

	@GetMapping("/tripBoard/trip_board_delete")
	public String tripBoardDelete(int tripBoardId) {
	
	}

	@GetMapping("/tripBoard/trip_board_report")
	public String tripBoardReport(ReportVO rVO) {
		
	}

	@GetMapping("/tripBoard/trip_board_recommend_insert")
	public String tripBoardRecommendInsert(int tripBoardId, String recommendId) {
		
	}

	@GetMapping("/tripBoard/trip_board_recommend_delete")
	public String tripBoardRecommendDelete(int tripBoardId, String recommendId) {
		
	}

	@GetMapping("/tripBoard/trip_board_selectLoc")
	public String selectLoc(int regionId) {
		
	}

	@ResponseBody
	public String searchDstnt(int dstntId) {
		
	}

	@ResponseBody
	public String searchAccom(int AccomId) {
		
	}

	@GetMapping("/tripBoard/insertDstnt")
	public String insertDstnt(dstntId[] dstntArr) {
		
	}

	@GetMapping("/tripBoard/trip_board_insertAccom")
	public String insertAccom(accomId[] accomArr) {
		
	}
	
}//class