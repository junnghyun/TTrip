package com.ttrip.traveldetail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.persistence.PersistenceException;

@Service
public class TravelDetailService {
    
    @Autowired
    private TravelDetailDAO travelDetailDAO;
    
    /**
     * 게시글 상세 정보 조회
     */
    public TravelDetailDomain getTripBoardDetail(int tripBoardId) {
        try {
            return travelDetailDAO.selectTripBoardDetail(tripBoardId);
        } catch(PersistenceException pe) {
            pe.printStackTrace();
            return null;
        }
    }
    
    /**
     * 일차별 여행지 정보 조회
     */
    public List<TripPlanDomain> getTripPlansByDay(int tripBoardId) {
        try {
            return travelDetailDAO.selectTripPlansByDay(tripBoardId);
        } catch(PersistenceException pe) {
            pe.printStackTrace();
            return null;
        }
    }
    
    /**
     * 일차별 숙소 정보 조회
     */
    public List<AccommodationDomain> getAccommodationsByDay(int tripBoardId) {
        try {
            return travelDetailDAO.selectAccommodationsByDay(tripBoardId);
        } catch(PersistenceException pe) {
            pe.printStackTrace();
            return null;
        }
    }
    
    /**
     * 게시글 추천 처리
     */
    public Map<String, Object> handleRecommendation(String nick, int tripBoardId) {
        Map<String, Object> result = new HashMap<>();
        Map<String, Object> params = new HashMap<>();
        params.put("nick", nick);
        params.put("tripBoardId", tripBoardId);
        
        try {
            int count = travelDetailDAO.checkRecommendation(params);
            if(count > 0) {
                // 이미 추천한 경우, 추천 취소
                travelDetailDAO.deleteRecommendation(params);
                result.put("action", "delete");
            } else {
                // 추천하지 않은 경우, 추천 추가
                travelDetailDAO.insertRecommendation(params);
                result.put("action", "add");
            }
            result.put("success", true);
        } catch(PersistenceException pe) {
            pe.printStackTrace();
            result.put("success", false);
            result.put("message", "데이터베이스 오류가 발생했습니다.");
        }
        
        return result;
    }
    
    /**
     * 추천 여부 확인
     */
    public boolean checkRecommendation(String nick, int tripBoardId) {
        Map<String, Object> params = new HashMap<>();
        params.put("nick", nick);
        params.put("tripBoardId", tripBoardId);
        
        try {
            return travelDetailDAO.checkRecommendation(params) > 0;
        } catch(PersistenceException pe) {
            pe.printStackTrace();
            return false;
        }
    }
    
    /**
     * 댓글 목록 조회
     */
    public List<CommentDomain> getComments(int tripBoardId, String currentUserNick) {
        try {
            List<CommentDomain> comments = travelDetailDAO.selectComments(tripBoardId);
            
            // 각 댓글에 대한 현재 사용자의 추천 여부 확인
            if (currentUserNick != null) {
                for (CommentDomain comment : comments) {
                    Map<String, Object> params = new HashMap<>();
                    params.put("commentId", comment.getTrip_commentID());
                    params.put("nick", currentUserNick);
                }
            }
            
            return comments;
        } catch(PersistenceException pe) {
            pe.printStackTrace();
            return null;
        }
    }

    /**
     * 댓글 작성
     */
    public boolean addComment(CommentDomain comment) {
        try {
            return travelDetailDAO.insertComment(comment) > 0;
        } catch(PersistenceException pe) {
            pe.printStackTrace();
            return false;
        }
    }

    /**
     * 댓글 삭제
     */
    public boolean deleteComment(int commentId, String nick) {
        try {
            Map<String, Object> params = new HashMap<>();
            params.put("commentId", commentId);
            params.put("nick", nick);
            return travelDetailDAO.deleteComment(params) > 0;
        } catch(PersistenceException pe) {
            pe.printStackTrace();
            return false;
        }
    }

    /**
     * 댓글 추천 처리
     */
    public Map<String, Object> handleCommentRecommendation(String nick, int commentId) {
        Map<String, Object> result = new HashMap<>();
        Map<String, Object> params = new HashMap<>();
        params.put("commentId", commentId);
        params.put("nick", nick);
        
        try {
            int count = travelDetailDAO.checkCommentRecom(params);
            if(count > 0) {
                // 이미 추천한 경우, 추천 취소
                travelDetailDAO.deleteCommentRecom(params);
                result.put("action", "delete");
            } else {
                // 추천하지 않은 경우, 추천 추가
                travelDetailDAO.insertCommentRecom(params);
                result.put("action", "add");
            }
            result.put("success", true);
        } catch(PersistenceException pe) {
            pe.printStackTrace();
            result.put("success", false);
            result.put("message", "데이터베이스 오류가 발생했습니다.");
        }
        
        return result;
    }
}
