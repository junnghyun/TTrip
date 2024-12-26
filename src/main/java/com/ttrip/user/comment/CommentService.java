package com.ttrip.user.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;

import com.ttrip.user.board.BoardVO;
import com.ttrip.user.report.ReportVO;


@Service
public class CommentService {

	@Autowired(required=false)
	private CommentDAO cDAO; 
	
	public boolean writeComment(CommentVO cVO) {
		boolean flag=false; 
		
		try {
			flag=CommentDAO.getInstance().insertComment(cVO)==1;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;
	}
	public List<CommentDomain> getCommentList(int commentId){
		List<CommentDomain> list=null;
		
		try {
			list=CommentDAO.getInstance().selectCommentList(commentId);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch 
		
		return list; 
		
	}
	//int -> String
	public String modifyComment(CommentVO cVO) {
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("modifyFlag", false);
		
		try {
			int rowCnt=CommentDAO.getInstance().updateComment();
			jsonObj.put("modifyFlag", rowCnt==1);
			jsonObj.put("modifyCount", rowCnt);
			
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return jsonObj.toJSONString();
		
	}//modifyBoard
	
	
	
	//코멘트 삭제 int -> 
	public String removeComment(int commentId,String content) {
		
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("removeFlag",false); 
		try {
			int cnt=CommentDAO.getInstance().deleteComment(commentId, content);
			jsonObj.put("removeFlag", cnt==1);
			jsonObj.put("removeCount", cnt);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catchs
		
		return jsonObj.toJSONString(); 
		
	}
	public String reportComment(ReportVO rVO) {
		JSONObject jsonObj=new JSONObject();
		jsonObj.put("reportFlag", false);
		
		try {
			int rowCnt=CommentDAO.getInstance().insertReport(rVO);
			jsonObj.put("reportyFlag", rowCnt==1);
			jsonObj.put("reportCount", rowCnt);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return jsonObj.toJSONString();
	}
	
	
}//CommentService
