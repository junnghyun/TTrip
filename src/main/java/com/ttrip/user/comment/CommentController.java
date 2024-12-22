package com.ttrip.user.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ttrip.user.report.ReportVO;

@Controller
@SessionAttributes
public class CommentController {

	@Autowired(required=false)
	private CommentService cs; 
	
//	@GetMapping("/comment/comment_list")
//	public String commentList(int , int, Model model) {
//		
//		return "comment/comment_list";
//	}

	@GetMapping("/comment/comment_insert")
	public String commentInsert(CommentVO cVO) {
		
		return "comment/comment_insert";	
	}

	@GetMapping("/comment/comment_update")
	public String commentUpdate(CommentVO cVO) {
		
		return "comment/comment_update";	
			
	}

//	@GetMapping("/comment/comment_delete")
//	public String commentDelete(int,String) {
//		
//		return "comment/comment_delete";	
//		
//	}

	@GetMapping("/comment/report_comment")
	public String reportComment(ReportVO rVO) {
		
		return "comment/report_comment";
	}
	
}//CommentController