package com.ttrip.user.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ttrip.user.report.ReportVO;

import jakarta.persistence.PersistenceException;

@Service
public class BoardService {
	
	@Autowired(required=false)
	private BoardDAO bDAO; 
	
	public List<BoardDomain> getBoardList(BoardDomain boardDomain){
		List<BoardDomain> list=null;
		
		try {
		BoardDAO.getInstance().selectBoardList(boardDomain);
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}//end catch
		
		return list;  
		
	}//getBoardList
	
//	게시판
//	public BoardDomain getBoardDetail(int) {
		
//	}
	
	//게시판 작성 
	public boolean writeBoard(BoardVO bVO) {
		return false;
		
	}
	//게시판 변경
	public boolean modifyBoard(BoardVO bVO) {
		return false;
		
	}
	//게시판 삭제
	public boolean removeBoard(int boardId ,String nick) {
		return false;
		
	}
	//댓글 추가
	public boolean addRecommend(int recommendId ,String nick) {
		return false;
		
	}
	//댓글 삭제
	public boolean removeRecommend(int recommendId,String nick) {
		return false;
		
	}
	//신고 게시판
	public boolean reportBoard(ReportVO rVO) {
		return false;
		
	}

	
	
	
}//BoardService
