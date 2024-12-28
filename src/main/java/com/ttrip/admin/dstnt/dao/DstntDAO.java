package com.ttrip.admin.dstnt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ttrip.admin.dstnt.domain.DstntDomain;
import com.ttrip.admin.dstnt.vo.DstntVO;
import com.ttrip.mapper.MyBatisHandler;



@Repository
public class DstntDAO {

    // 모든 여행지 조회
    public List<DstntDomain> selectAllDestinations() throws PersistenceException {
        List<DstntDomain> list = null;
        MyBatisHandler mbh = MyBatisHandler.getInstance();
        SqlSession handler = mbh.getHandler();
        list = handler.selectList("com.ttrip.mapper.selectAllDestinations");
        mbh.closeHandler(handler);
        return list;
    }

    // 단일 여행지 조회
    public DstntDomain selectDestinationById(int id) throws PersistenceException {
        DstntDomain dstnt = null;
        MyBatisHandler mbh = MyBatisHandler.getInstance();
        SqlSession handler = mbh.getHandler();
        dstnt = handler.selectOne("com.ttrip.mapper.selectDestinationById", id);
        mbh.closeHandler(handler);
        return dstnt;
    }

    public List<DstntDomain> searchDestinations(String region, String name) throws PersistenceException {
        List<DstntDomain> list = null;
        MyBatisHandler mbh = MyBatisHandler.getInstance();
        SqlSession handler = mbh.getHandler();

        // 매개변수 설정
        Map<String, Object> params = new HashMap<>();
        params.put("region", region);
        params.put("name", name);

        list = handler.selectList("com.ttrip.mapper.searchDestinations", params);
        mbh.closeHandler(handler);
        return list;
    }
    
    // 여행지 추가
    public int insertDestination(DstntVO dstntVO) throws PersistenceException {
        MyBatisHandler mbh = MyBatisHandler.getInstance();
        SqlSession handler = mbh.getHandler();
        int rows = handler.insert("com.ttrip.mapper.insertDestination", dstntVO);
        handler.commit();
        mbh.closeHandler(handler);
        return rows;
    }

    // 여행지 수정
    public int updateDestination(DstntVO dstntVO) throws PersistenceException {
        MyBatisHandler mbh = MyBatisHandler.getInstance();
        SqlSession handler = mbh.getHandler();
        int rows = handler.update("com.ttrip.mapper.updateDestination", dstntVO);
        handler.commit();
        mbh.closeHandler(handler);
        return rows;
    }

    // 여행지 상태 변경 (삭제)
    public int deleteDestinationById(int id) throws PersistenceException {
        MyBatisHandler mbh = MyBatisHandler.getInstance();
        SqlSession handler = mbh.getHandler();
        int rows = handler.update("com.ttrip.mapper.deleteDestinationById", id);
        handler.commit();
        mbh.closeHandler(handler);
        return rows;
    }
}
