package com.ttrip.traveldetail;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TravelDetailDAO {
    
	@Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.ttrip.traveldetail.travelDetailMapper";
    
    /**
     * 게시글 기본 정보 조회
     */
    public TravelDetailDomain selectTripBoardDetail(int tripBoardId) {
        return sqlSession.selectOne(NAMESPACE + ".selectTripBoardDetail", tripBoardId);
    }
    
    /**
     * 일차별 여행지 정보 조회
     */
    public List<TripPlanDomain> selectTripPlansByDay(int tripBoardId) {
        return sqlSession.selectList(NAMESPACE + ".selectTripPlansByDay", tripBoardId);
    }
    
    /**
     * 일차별 숙소 정보 조회
     */
    public List<AccommodationDomain> selectAccommodationsByDay(int tripBoardId) {
        return sqlSession.selectList(NAMESPACE + ".selectAccommodationsByDay", tripBoardId);
    }
    
    /**
     * 게시글 추천 여부 확인
     */
    public int checkRecommendation(Map<String, Object> params) {
        return sqlSession.selectOne(NAMESPACE + ".checkRecommendation", params);
    }
    
    /**
     * 게시글 추천 추가
     */
    public int insertRecommendation(Map<String, Object> params) {
        return sqlSession.insert(NAMESPACE + ".insertRecommendation", params);
    }
    
    /**
     * 게시글 추천 삭제
     */
    public int deleteRecommendation(Map<String, Object> params) {
        return sqlSession.delete(NAMESPACE + ".deleteRecommendation", params);
    }
    
    /**
     * 댓글 목록 조회
     */
    public List<CommentDomain> selectComments(int tripBoardId) {
        return sqlSession.selectList(NAMESPACE + ".selectComments", tripBoardId);
    }

    /**
     * 댓글 작성
     */
    public int insertComment(CommentDomain comment) {
        return sqlSession.insert(NAMESPACE + ".insertComment", comment);
    }

    /**
     * 댓글 삭제
     */
    public int deleteComment(Map<String, Object> params) {
        return sqlSession.update(NAMESPACE + ".deleteComment", params);
    }

    /**
     * 댓글 추천 여부 확인
     */
    public int checkCommentRecom(Map<String, Object> params) {
        return sqlSession.selectOne(NAMESPACE + ".checkCommentRecom", params);
    }

    /**
     * 댓글 추천 추가
     */
    public int insertCommentRecom(Map<String, Object> params) {
        return sqlSession.insert(NAMESPACE + ".insertCommentRecom", params);
    }

    /**
     * 댓글 추천 삭제
     */
    public int deleteCommentRecom(Map<String, Object> params) {
        return sqlSession.delete(NAMESPACE + ".deleteCommentRecom", params);
    }
}
