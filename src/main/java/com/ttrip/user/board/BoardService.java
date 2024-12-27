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
	
	public List<BoardDomain> getBoardList(BoardDomain bd){
		List<BoardDomain> list=null;
		
		try {
			list=BoardDAO.getInstance().selectBoardList(bd);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;  
		
	}//getBoardList
	
//  게시판 제목 얻기
	public BoardDomain getBoardDetail(int boardId) {
			
		BoardDomain bd=null;
		try {
			BoardDAO.getInstance().selectBoardOne(boardId);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
		return bd; 
		
	}
	
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
		
	//추천 추가
	public boolean addRecommend(Integer recommendId , String nick) {
		
		//유효성 검증: ID나 닉네임이 유효한지에 대한 검증
		
		if(recommendId == null || nick == null || nick.isEmpty()) {
			System.out.println("닉네임 이나 ID를 확인해주시길 바랍니다.");
			return false;
		}//end if
		
		boolean flag=false;
		
		try {
			flag=BoardDAO.getInstance().insertRecommend(recommendId, nick)==1;
		}catch(PersistenceException pe) {
			  System.err.println("에러 :" + pe.getMessage());
			pe.printStackTrace();
		}//end catch
		
		return flag;	

	}
		
	//추천 삭제
	public boolean removeRecommend(int recomId,String nick) {
		
		boolean flag=false;
		
		try {
			flag=BoardDAO.getInstance().deleteRecommend(recomId, nick)==1;
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
