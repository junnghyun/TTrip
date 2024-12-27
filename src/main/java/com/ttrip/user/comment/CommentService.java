package com.ttrip.user.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import com.ttrip.user.board.BoardVO;
import com.ttrip.user.report.ReportVO;


@Service

//비즈니스 로직, db연동 이외 작업처리
public class CommentService {

	@Autowired(required=false)
	private CommentDAO cDAO; 
	
	
	//코멘트 작성
	public boolean writeComment(CommentVO cVO) {
		boolean flag=false; 
		
		try {
			flag=CommentDAO.getInstance().insertComment(cVO)==1;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;
	}
	//코멘트 리스트 얻기 
	public List<CommentDomain> getCommentList(int commentId){
		List<CommentDomain> list=null;
		
		try {
			list=CommentDAO.getInstance().selectCommentList(commentId);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch 
		
		return list; 
		
	}
	//코멘트 변경 int 
	public int modifyComment(CommentVO cVO) {
		int cnt=0;
		
		try {
			cnt=CommentDAO.getInstance().updateComment(cVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return cnt;
	}//modifyBoard
	
	
	
	//코멘트 삭제 int -> String
	public int removeComment(int commentId,String content) {
	
		int cnt=0;
		
		try {
			cnt=CommentDAO.getInstance().deleteComment(commentId, content);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
		
	}
	public int reportComment(ReportVO rVO) {
		
		int cnt=0;
		
		try {
			cnt=CommentDAO.getInstance().insertReport(rVO);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		
		return cnt;
	}
	
}//CommentService
