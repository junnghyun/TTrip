package com.ttrip.user.board;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ttrip.user.report.ReportVO;


@Service
public class BoardService {
	
	@Autowired(required=false)
	private BoardDAO bDAO; 
	
	public List<BoardDomain> getBoardList(BoardDomain boardDomain){
		List<BoardDomain> list=null;
		
		try {
			list=BoardDAO.getInstance().selectBoardList(boardDomain);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;  
		
	}//getBoardList
	
//  게시판
//	public List<BoardDomain> getBoardDetail(int boardId) {
//		List<BoardDomain>list=null;
//		try {
//			BoardDAO.getInstance().getBoardDetail(boardId);
//		}catch(PersistenceException pe) {
//			pe.printStackTrace();
//		}
//		return list; 
		
//	}
	
	//게시판 작성 
	public boolean writeBoard(BoardVO bVO) {
		boolean flag=false;
		
		try {
			flag=BoardDAO.getInstance().insertBoard(bVO)==1;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;	

	}
		
	//게시판 변경
	public boolean modifyBoard(BoardVO bVO) {
		boolean flag=false;
		
		try {
			flag=BoardDAO.getInstance().updateBoard(bVO)==1;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;	

	}
	
	//게시판 삭제(int boardId, String nick)
	public boolean removeBoard(int boardId, String nick) {
	
		boolean flag=false;
		
		try {
			flag=BoardDAO.getInstance().deleteBoard(boardId, nick)==1;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;	

	}
		
	//댓글 추가
	public boolean addRecommend(int boardId ,String nick) {
		
		boolean flag=false;
		
		try {
			flag=BoardDAO.getInstance().insertRecommend(boardId, nick)==1;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;	

	}
	
		
	//댓글 삭제
	public boolean removeRecommend(int boardId,String nick) {
		
	boolean flag=false;
		
		try {
			flag=BoardDAO.getInstance().deleteRecommend(boardId, nick)==1;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;	

	}
	
	//신고 게시판
	public boolean reportBoard(ReportVO rVO) {
		
		boolean flag=false;
		
		try {
			flag=BoardDAO.getInstance().insertReport(rVO)==1;
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return flag;	

	
	}
	
}//BoardService
