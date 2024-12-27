package com.ttrip.user.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ttrip.user.report.ReportVO;

@Controller
@SessionAttributes
public class CommentController {

	@Autowired(required=false)
	private CommentService cs; 
	
	//코멘트 리스트
	@GetMapping("/ttrip/comment/comment_list")
	public String commentList(int commentId, int boardId, Model model) {
		
		return "ttrip/comment/comment_list";
	}
	
	//코멘트 삽입
	@GetMapping("/ttrip/comment/comment_insert")
	public String commentInsert(CommentVO cVO) {
		
		return "ttrip/comment/comment_insert";	
	}

	//코멘트 업데이트
	@GetMapping("/ttrip/comment/comment_update")
	public String commentUpdate(CommentVO cVO) {
		
		return "ttrip/comment/comment_update";	
			
	}
	
	//코멘트 삭제
	@GetMapping("/ttrip/comment/comment_delete")
	public String commentDelete(int commentId,String nick) {
		
		return "ttrip/comment/comment_delete";	
		
	}

	@GetMapping("/ttrip/comment/report_comment")
	public String reportComment(ReportVO rVO) {
		
		return "ttrip/comment/report_comment";
	}
	
}//CommentController