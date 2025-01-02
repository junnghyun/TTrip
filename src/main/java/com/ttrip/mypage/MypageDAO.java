package com.ttrip.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ttrip.main.MainDomain;

@Repository
public class MypageDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "mapper.mypageMapper";
    
    public List<MainDomain> selectMyCourses(Map<String, Object> params) {
        return sqlSession.selectList(NAMESPACE + ".selectMyCourses", params);
    }
    
    public int selectTotalMyCourses(String nick) {
        return sqlSession.selectOne(NAMESPACE + ".selectTotalMyCourses", nick);
    }
    
    // 추천 게시글 목록 조회
    public List<MypageDomain> selectRecommendList(Map<String, Object> params) {
        return sqlSession.selectList(NAMESPACE + ".selectRecommendList", params);
    }

    // 추천 게시글 총 개수 조회
    public int selectTotalRecommends(String nick) {
        return sqlSession.selectOne(NAMESPACE + ".selectTotalRecommends", nick);
    }
    
    public List<MypageDomain> selectMyBoardList(Map<String, Object> params) {
        return sqlSession.selectList(NAMESPACE + ".selectMyBoardList", params);
    }

    public int selectTotalMyBoards(String nick) {
        return sqlSession.selectOne(NAMESPACE + ".selectTotalMyBoards", nick);
    }
    
    public List<MypageDomain> selectMyCommentList(Map<String, Object> params) {
        return sqlSession.selectList(NAMESPACE + ".selectMyCommentList", params);
    }

    public int selectTotalMyComments(String nick) {
        return sqlSession.selectOne(NAMESPACE + ".selectTotalMyComments", nick);
    }
    
    public List<MypageDomain> selectMyReportList(Map<String, Object> params) {
        return sqlSession.selectList(NAMESPACE + ".selectMyReportList", params);
    }

    public int selectTotalMyReports(String nick) {
        return sqlSession.selectOne(NAMESPACE + ".selectTotalMyReports", nick);
    }
}