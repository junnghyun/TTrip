package com.ttrip.user.board;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ttrip.user.comment.CommentService;
import com.ttrip.user.report.ReportVO;

import lombok.extern.slf4j.Slf4j;

import org.springframework.ui.Model;

@Controller
@SessionAttributes
public class BoardController {

	@Autowired(required=false)
	private BoardService bs; 
	
	@Autowired(required=false)
	private CommentService cs; 

	//메인 메인 boardlist 
	@GetMapping("/ttrip/boardlist/mainBoardlist")
	public String boardList(String content, Model model) {
		return "ttrip/boardlist/mainBoardlist"; // 경로 수정
	}

	  @GetMapping("/ttrip/boardlist/board_detail_frm")
	 
	  public String boardDetailFrm(int boardId,Model model) {
		  
		  return "ttrip/boardlist/board_detail_frm";
	  }
	  
	//게시판 삽입 폼(boardInsert_frm) -> writeBoardlist
	@GetMapping("/ttrip/boardlist/writeBoard")
	public String boardInsertFrm() {
		
		return "ttrip/boardlist/writeBoard";
	}

	//게시판 삽입(/board/board_insert)
	@GetMapping("/ttrip/boardlist/board_insert")
	public String boardInsert(BoardVO bVO,Model model) {
		
		boolean result=bs.writeBoard(bVO);
		model.addAttribute("result",result);
		return "ttrip/boardlist/board_insert";
	}

	//게시판 업데이트 폼(/board/board_update_frm)
	@GetMapping("/ttrip/boardlist/commentBoard")
	public String boardUpdateFrm(@RequestParam Integer boardId, Model model ) {
		
		return "ttrip/boardlist/commentBoard";
	}

	//게시판 업데이트(/board/board_update)
	@GetMapping("/ttrip/boardlist/board_update")
	public String boardUpdate(BoardVO bVO) {
		return "ttrip/boardlist/board_update";
	}

	//게시판 삭제(board/board_delete)
	@GetMapping("/ttrip/boardlist/board_delete")
	public String boardDelete(int boardId,String nick,Model model) {
		return "ttrip/boardlist/board_delete";
	}

	@ResponseBody
	@GetMapping("/ttrip/boardlist/board_recommend_insert")
	public String boardRecommendInsert(int recommendId,String nick) {
		
		JSONObject jsonObj=new JSONObject();
		boolean result=bs.addRecommend(recommendId,nick);
		return jsonObj.toJSONString();
	}
	
	//게시판 답글 삭제(/ttrip/board/board_recommend_delete)
	@GetMapping("/ttrip/boardlist/board_recommend_delete")
	@ResponseBody // 자바 객체를 HTTP 요청의 body 내용으로 매핑하는 역할
	public String boardRecommendDelete(int recommendId,String nick) {
		
		JSONObject jsonObj=new JSONObject();
		
		String result=cs.removeComment(recommendId, nick);
		jsonObj.put("success", result); //성공 여부 추가
		
		return jsonObj.toJSONString();//json문자열 반환
		
		
	}

	@GetMapping("/ttrip/boardlist/board_report")
	public String boardReport(ReportVO rVO) { //BoardService reportBoard
		
		return "ttrip/boardlist/board_report";
	}

	
}//BoardController
