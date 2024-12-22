package com.ttrip.user.board;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.stereotype.Service;

import net.minidev.json.JSONObject;


public class MBoardService {

	@Service
	public class BoardService {
		
		/**
		 * 1.총 레코드 수 구하기
		 * @param sVO
		 * @return
		 */
		public int totalCount(SearchVO sVO) {
			int cnt=0;
			try {
				cnt=BoardDAO.getInstance().selectTotalCount(sVO);
			}catch(PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
			
			return cnt;
		}//totalCount
		
		/**
		 * 2.한 화면에 보여줄 레코드의 수
		 * @return
		 */
		public int pageScale() {
			int pageScale=10;
			return pageScale;
		}//pageScacle
		
		/**
		 * 3.총 페이지 수
		 * @param totalCount
		 * @param pageScale
		 * @return
		 */
		public int totalPage(int totalCount, int pageScale) {
			int totalPage=(int)Math.ceil((double)totalCount/pageScale);
			return totalPage;
		}
		
		/**
		 * 현재 페이지 번호
		 * @param paramPage
		 * @return
		 */
		public int currentPage(String paramPage) {
			int currentPage=1;	
			if(paramPage != null){
				try{
					currentPage=Integer.parseInt(paramPage);
				}catch(NumberFormatException nfe){
				}//end catch
			}//end if
			return currentPage;
		}
		
		/**
		 * 4.검색의 시작번호를 구하기
		 * @param paramPage
		 * @param pageScale
		 * @return
		 */
		public int startNum(int currentPage ,int pageScale) {
			int startNum=currentPage*pageScale-pageScale+1;//시작번호
			return startNum;
		}//startNum
		
		/**
		 *5. 끝번호 
		 * @param startNum
		 * @param pageScale
		 * @return
		 */
		public int endNum(int startNum, int pageScale) {
			int endNum=startNum+pageScale-1; //끝 번호
			return endNum;
		}//endNum
		
		public List<BoardDomain> searchBoard(SearchVO sVO){
			List<BoardDomain> list=null;
			
			try {
				list=BoardDAO.getInstance().selectBoard(sVO);
				
				//업무로직의 처리
				String tempTitle="";
				for(BoardDomain tempVO : list){
					tempTitle=tempVO.getTitle();
					if(tempTitle.length() > 30){
						tempVO.setTitle(tempTitle.substring(0, 29)+"...");
					}
				}//end for
				
			}catch(PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
			
			return list;
		}//searchBoard
		
		
		public boolean writeBoard(BoardVO mbVO) {
			boolean flag=false;
			
			try {
				flag=BoardDAO.getInstance().insertBoard(mbVO)==1;
			}catch(PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
			
			return flag;		
		}//writeBoard
		
//		public BoardDomain searchDetailBoard(int num) {
//			BoardDomain bDomain=null;
			
//			try {
//				bDomain=BoardDAO.getInstance().selectDetailBoard(num);
				
//			}catch(PersistenceException pe) {
//				pe.printStackTrace();
//			}//end catch
			
//			return bDomain;
//		}//searchDetailBoard
		
		public String modifyBoard( BoardVO bVO) {
			JSONObject jsonObj=new JSONObject();
			jsonObj.put("modifyFlag", false);
			
			try {
				int rowCnt=BoardDAO.getInstance().updateBoard(bVO);
				jsonObj.put("modifyFlag",rowCnt==1);
				jsonObj.put("modifyCount",rowCnt);
				
			}catch(PersistenceException pe) {
				pe.printStackTrace();
			}//end catch
			
			return jsonObj.toJSONString();	
		}//modifyBoard
		
	//	public String removeBoard( BoardVO mbVO) {
	//		JSONObject jsonObj=new JSONObject();
	//		jsonObj.put("removeFlag", false);
	//		try { 
	//			int cnt=BoardDAO.getInstance().deleteBoard(mbVO);
	//			jsonObj.put("removeFlag", cnt == 1);
	//			jsonObj.put("removeCount", cnt);
	//		}catch(PersistenceException pe) {
	//			pe.printStackTrace();
	//		}//end catch
	//		
	//		return jsonObj.toJSONString();	
	//	}//removeBoard
		
		
		
		
	}//class







	
	
}
