package com.ttrip.user.board;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import com.ttrip.dao.MyBatisHandler;
import com.ttrip.user.report.ReportVO;

import jakarta.annotation.Resource;

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

	
	/**
	 * 총 게시물의 수 검색
	 * @param sVO
	 * @return 게시물의 수
	 * @throws SQLException
	 */
	public int selectTotalCount( SearchVO sVO )throws PersistenceException{
		int totalCount=0;
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder();
		try {
			totalCount=handler.selectOne("",sVO);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return totalCount;
	}//selectTotalCount
	
	
	public List<BoardDomain> selectBoard( SearchVO sVO )throws PersistenceException{
		List<BoardDomain> list=null;
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder();
		try {
			list=handler.selectList("",sVO);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		return list;
	}//selectBoard
	
	
	
	public List<BoardDomain> selectBoardList(BoardDomain bd) throws PersistenceException{
		List<BoardDomain> list=null;
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder();
		try {
			list=handler.selectList("",bd);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return list;
	}//selectBoardList
	
	
	public int insertBoard(BoardVO bVO) throws PersistenceException {
		int cnt=0;
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder( true );
		try {
			cnt=handler.insert("com.ttrip.user.board.insertBoard",bVO);
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
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder( true );
		try {
			rowCnt=handler.update("",boardId);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return rowCnt;
	}
	
	public int insertRecommend(int recommendId,String nick) {
		int cnt=0;

		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder( true );
		try {
			cnt=handler.update("",recommendId);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt; 
	}
	
	public int deleteRecommend(int recommendId,String nick) {
		int rowCnt=0;
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder( true );
		try {
			rowCnt=handler.update("",recommendId);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return rowCnt;
	}
	
	public int insertReport(ReportVO rVO) {
		int cnt=0;

		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder( true );
		try {
			cnt=handler.insert("",rVO);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt; 
	}
}//BoardDAO