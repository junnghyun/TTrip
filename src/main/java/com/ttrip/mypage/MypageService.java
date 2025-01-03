package com.ttrip.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ttrip.main.MainDomain;

@Service
public class MypageService {

    @Autowired
    private MypageDAO mDAO;
    
    public List<MainDomain> getMyCourses(String nick, int page) {
        int limit = 6;
        int offset = (page - 1) * limit;
        
        Map<String, Object> params = new HashMap<>();
        params.put("nick", nick);
        params.put("offset", offset);
        params.put("limit", limit);
        
        return mDAO.selectMyCourses(params);
    }
    
    public int getTotalPages(String nick) {
        int total = mDAO.selectTotalMyCourses(nick);
        return (int) Math.ceil((double) total / 6);
    }
    
    // 추천 게시글 목록 조회
    public List<MypageDomain> getRecommendList(String nick, int page) {
        int limit = 6;  // 7개에서 6개로 수정
        int offset = (page - 1) * limit;
        
        Map<String, Object> params = new HashMap<>();
        params.put("nick", nick);
        params.put("offset", offset);
        params.put("limit", limit);
        
        return mDAO.selectRecommendList(params);
    }

    public int getTotalRecommendPages(String nick) {
        int total = mDAO.selectTotalRecommends(nick);
        return (int) Math.ceil((double) total / 6);  // 7에서 6으로 수정
    }

    // getMyBoardList 메서드 수정
    public List<MypageDomain> getMyBoardList(String nick, int page) {
        int limit = 6;  // 7개에서 6개로 수정
        int offset = (page - 1) * limit;
        
        Map<String, Object> params = new HashMap<>();
        params.put("nick", nick);
        params.put("offset", offset);
        params.put("limit", limit);
        
        return mDAO.selectMyBoardList(params);
    }

    public int getTotalMyBoardPages(String nick) {
        int total = mDAO.selectTotalMyBoards(nick);
        return (int) Math.ceil((double) total / 6);  // 7에서 6으로 수정
    }

    // 현재 페이지 그룹의 시작 페이지를 계산
    public int getStartPage(int currentPage) {
        return ((currentPage - 1) / 5) * 5 + 1;
    }

    // 현재 페이지 그룹의 마지막 페이지를 계산
    public int getEndPage(int startPage, int totalPages) {
        int endPage = startPage + 4;
        return Math.min(endPage, totalPages);
    }
    
    public List<MypageDomain> getMyCommentList(String nick, int page) {
        int limit = 6;
        int offset = (page - 1) * limit;
        
        Map<String, Object> params = new HashMap<>();
        params.put("nick", nick);
        params.put("offset", offset);
        params.put("limit", limit);
        
        return mDAO.selectMyCommentList(params);
    }

    public int getTotalCommentPages(String nick) {
        int total = mDAO.selectTotalMyComments(nick);
        return (int) Math.ceil((double) total / 6);
    }
    
    public List<MypageDomain> getMyReportList(String nick, int page) {
        int limit = 6;
        int offset = (page - 1) * limit;
        
        Map<String, Object> params = new HashMap<>();
        params.put("nick", nick);
        params.put("offset", offset);
        params.put("limit", limit);
        
        return mDAO.selectMyReportList(params);
    }

    public int getTotalReportPages(String nick) {
        int total = mDAO.selectTotalMyReports(nick);
        return (int) Math.ceil((double) total / 6);
    }
}