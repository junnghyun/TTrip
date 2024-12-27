package com.ttrip.user.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	
	public List<BoardDomain> selectBoardList(BoardDomain bd) throws PersistenceException{
		List<BoardDomain> list=null;
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder();
		try {
			list=handler.selectList("com.ttrip.user.board.selectBoardList",bd);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return list;
	}//selectBoardList
	
	public BoardDomain selectBoardOne(int boardId) throws PersistenceException {
		
		 BoardDomain bd = null; // 결과를 저장할 변수

		    MyBatisHandler mbh = MyBatisHandler.getInstance();
		    SqlSession handler = mbh.getHanlder();
		    try {
		        // selectOne 메소드를 사용하여 단일 게시물 조회
		        bd = handler.selectOne("com.ttrip.user.board.seletBoardOne", boardId);
		    } finally {
		        mbh.closeHandler(handler);
		    }

		    return bd; 
		}
	
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
			rowCnt=handler.update("com.ttrip.user.board.updateBoard",bVO);
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
			rowCnt=handler.delete("com.ttrip.user.board.deleteBoard",boardId);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return rowCnt;
	}
	
	public int insertRecommend(int boardId,String nick) {
		int cnt=0;

		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder( true );
		try {
			// 파라미터를 Map으로 묶기
	        Map<String, Object> params = new HashMap<>();
	        params.put("boardId", boardId);
	        params.put("nick", nick);
			//Map을 사용하여 insert 메서드 호출
			cnt=handler.insert("com.ttrip.user.board.insertRecommend",params);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt; 
	}
	
	public int deleteRecommend(int recomID,String nick) {
		int rowCnt=0;
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder( true );
		try {
			Map<String, Object> params=new HashMap<>();
			params.put("recomID", recomID);
			params.put("nick", nick);
			rowCnt=handler.delete("com.ttrip.user.board.deleteRecommend",params);
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
			cnt=handler.insert("com.ttrip.com.user.board.insertReport",rVO);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return cnt; 
	}
}//BoardDAO