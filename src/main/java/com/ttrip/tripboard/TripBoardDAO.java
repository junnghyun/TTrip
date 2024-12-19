package com.ttrip.tripboard;

/**
 *  여행코스 만들기, 수정, 삭제
 */
public class TripBoardDAO {
	
	private static TripBoardDAO tbDAO;
	
	private TripBoardDAO() {
	}
	
	public static TripBoardDAO getInstance() {
		if(tbDAO == null) {
			tbDAO=new TripBoardDAO();
		}//end if
		return tbDAO;
	}//getInstance
	
	
	
	
	
	
	
	
	
}//class