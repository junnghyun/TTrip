package com.ttrip.user.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ttrip.dao.MyBatisHandler;
import com.ttrip.user.report.ReportVO;

import jakarta.annotation.Resource;
import jakarta.persistence.PersistenceException;

@Resource
public class CommentDAO {

	
	private static CommentDAO cDAO;
	
	private CommentDAO() {
		
	}
	
	public static CommentDAO getInstance() {
		if(cDAO == null) {
			cDAO=new CommentDAO();
		}//end if
		return cDAO; 
	}//get
	
	public int insertComment(CommentVO cVO) throws PersistenceException {
		int cnt=0; 
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		SqlSession handler=mbh.getHanlder(true);
		try {
			cnt=handler.insert("com.ttrip.user.board.insertComment",cVO);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		return cnt;
	}//insertComment
	
	/** 댓글 업데이트 
	 * @return
	 * @throws PersistenceException
	 */
	public int updateComment() throws PersistenceException {
		int cnt=0; 
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		SqlSession handler=mbh.getHanlder(true);
		try {
			cnt=handler.insert("com.ttrip.user.board.insertComment");
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		return cnt;
	}//insertComment
	
	/** 댓글 목록을 선택
	 * @param commentId
	 * @return
	 */
	public List<CommentDomain> selectCommentList (int commentId) {
		List<CommentDomain> cdDomain=null;
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		
		SqlSession handler=mbh.getHanlder();
		try {
			cdDomain=handler.selectList("",commentId);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		return cdDomain;
	}
	
	/** 댓글 삭제
	 * @param commentId
	 * @param content
	 * @return
	 */
	public int deleteComment(int commentId,String content) {
		int rowCnt=0;
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder( true );
		try {
			rowCnt=handler.delete("",commentId);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return rowCnt; 
		
	}
	
	/** 댓글 중 신고 댓글을 선택
	 * @param rVO
	 * @return
	 */
	public int insertReport(ReportVO rVO) {
		int rowCnt=0;
		
		MyBatisHandler mbh=MyBatisHandler.getInstance();
		
		SqlSession handler=mbh.getHanlder(true);
		try {
			rowCnt=handler.insert("",rVO);
		}finally {
			mbh.closeHandler(handler);
		}//end finally
		
		return rowCnt;
	}
	
	
	
}//CommentDAO
