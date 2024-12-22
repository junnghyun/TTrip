package com.ttrip.user.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ttrip.user.report.ReportVO;

@Service
public class CommentService {

	@Autowired(required=false)
	private CommentDAO cDAO; 
	
	public boolean writeComment(CommentVO cVO) {
		boolean flag=false; 
		
		
		return flag;
	}
	public List<CommentDomain> getCommentList(int commentId){
		List<CommentDomain> list=null;
		
		return list; 
		
	}
	public int modifyComment(CommentVO cVO) {
		int cnt=0;
		
		
		return cnt;
		
	}
	public int removeComment(int commentId,String nick) {
		int cnt=0;
		
		
		return cnt;
		
		
	}
	public int reportComment(ReportVO rVO) {
		int cnt=0;
		
		
		return cnt;
	}
	
	
}//CommentService
