package com.ttrip.main;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.ttrip.main.mainMapper";
    
    /**
     * 초기 게시글 목록 조회 (12개)
     */
    public List<MainDomain> selectInitialTripBoards() {
        List<MainDomain> list = sqlSession.selectList(NAMESPACE + ".selectInitialTripBoards");
        
        if(list != null && !list.isEmpty()) {
            for(MainDomain md : list) {
                md.calculateTripPeriod();
            }
        }
        
        return list;
    }
    
    /**
     * 더보기 클릭시 추가 게시글 조회 (12개)
     */
    public List<MainDomain> selectMoreTripBoards(int offset) {
        List<MainDomain> list = sqlSession.selectList(NAMESPACE + ".selectMoreTripBoards", offset);
        
        if(list != null && !list.isEmpty()) {
            for(MainDomain md : list) {
                md.calculateTripPeriod();
            }
        }
        
        return list;
    }
    
    public List<MainDomain> selectBestTripBoards() {
        List<MainDomain> list = sqlSession.selectList(NAMESPACE + ".selectBestTripBoards");
        
        if(list != null && !list.isEmpty()) {
            for(MainDomain md : list) {
                md.calculateTripPeriod();
            }
        }
        
        return list;
    }

    public List<MainDomain> selectMoreBestTripBoards(int offset) {
        List<MainDomain> list = sqlSession.selectList(NAMESPACE + ".selectMoreBestTripBoards", offset);
        
        if(list != null && !list.isEmpty()) {
            for(MainDomain md : list) {
                md.calculateTripPeriod();
            }
        }
        
        return list;
    }
    
    public List<MainDomain> selectMyTripBoards(String nick) {
        List<MainDomain> list = sqlSession.selectList(NAMESPACE + ".selectMyTripBoards", nick);
        
        if(list != null && !list.isEmpty()) {
            for(MainDomain md : list) {
                md.calculateTripPeriod();
            }
        }
        
        return list;
    }

    public List<MainDomain> selectMoreMyTripBoards(Map<String, Object> params) {
        List<MainDomain> list = sqlSession.selectList(NAMESPACE + ".selectMoreMyTripBoards", params);
        
        if(list != null && !list.isEmpty()) {
            for(MainDomain md : list) {
                md.calculateTripPeriod();
            }
        }
        
        return list;
    }
    
    public int deleteTripBoard(int boardId) {
        return sqlSession.update(NAMESPACE + ".deleteTripBoard", boardId);
    }
    
}