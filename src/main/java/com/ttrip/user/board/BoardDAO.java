package com.ttrip.user.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.boot.autoconfigure.MybatisAutoConfiguration;

import com.ttrip.dao.MyBatisHandler;
import com.ttrip.user.report.ReportVO;

import jakarta.annotation.Resource;
import jakarta.persistence.PersistenceException;

@Resource
public class BoardDAO {

	private static BoardDAO bDAO; 
	
	private BoardDAO() {
		
	}//BoardDAO
	
	public static BoardDAO getInstance() {
		if(bDAO == null) {
			bDAO=new BoardDAO();
		}//end if
		return bDAO;
	}//getInstance

	public List<BoardDomain> selectBoardList(BoardDomain boardDomain){
		List<BoardDomain> list=null;
		
		
		
		return list;
	}//selectBoardList
	
	
	public int insertBoard(BoardVO bVO) throws PersistenceException {
		int cnt=0;
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder( true );
		try {
			cnt=handler.insert("",bVO);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt;
		
	}//insertBoard
	
	public int updateBoard(BoardVO bVO) {
		
		int rowCnt=0;
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder( true );
		try {
			rowCnt=handler.update("",bVO);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return rowCnt;
		
	}
	
	public int deleteBoard(int boardId,String nick) {
		int rowCnt=0;
		
		return rowCnt;
	}
	
	public int insertRecommend(int recommendId,String nick) {
		int cnt=0;
		
		
		return cnt; 
	}
	
	public int deleteRecommend(int recommendId,String nick) {
		int rowCnt=0;
		
		return rowCnt;
	}
	
	public int insertReport(ReportVO rVO) {
		int cnt=0;
		
		return cnt;
	}
}//BoardDAO