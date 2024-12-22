package com.ttrip.user.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ttrip.user.comment.CommentService;
import com.ttrip.user.report.ReportVO;

import ch.qos.logback.core.model.Model;

@Controller
@SessionAttributes
public class BoardController {

	@Autowired(required=false)
	private BoardService bs; 
	
	@Autowired(required=false)
	private CommentService cs; 

	@GetMapping("/board/board_list")
	//게시판 리스트 구현
	public String boardList(String content ,Model model) {
		
		return "board/board_list";
	}

	@GetMapping("/board/board_detail_frm")
	public String boardDetailFrm(int boardId,Model model) {
		return "board/board_detail_frm";
	}

	@GetMapping("/board/boardInsert_frm")
	public String boardInsertFrm() {
		
		return "board/boardInsert_frm";
	}

	@GetMapping("/board/board_insert")
	public String boardInsert(BoardVO bVO,Model model) {
		return "board/board_insert";
	}

	@GetMapping("/board/board_update_frm")
	public String boardUpdateFrm(int boardId, Model model ) {
		return "board/board_update_frm";
	}

	@GetMapping("/board/board_update")
	public String boardUpdate(BoardVO bVO) {
		return "board/board_update";
	}

	@GetMapping("/board/board_delete")
	public String boardDelete(int boardId,String nick) {
		return "board/board_delete";
	}

//	@ResponseBody
//	@GetMapping("/board/board_recommend_insert")
//	public String boardRecommendInsert(int recommendId,String nick) {
		
//		String jsonObj="";
		
//		jsonObj=bs.addRecommend(recommendId, nick);
		
//		return jsonObj;
		
//	}
	
	@GetMapping("/board/board_recommend_delete")
	@ResponseBody
	public String boardRecommendDelete(int recommendId,String nick) {
		return "board/board_recommend_delete";
	}

//	@GetMapping("/board/board_report")
//	public String boardReport(ReportVO rVO) {
		
//		String jsonObj="";
//		jsonObj=bs.reportBoard(rVO);
//		return "board/board_report";
//	}

	
}//BoardController
