package com.ttrip.admin.dstnt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ttrip.admin.dstnt.dao.DstntDAO;
import com.ttrip.admin.dstnt.domain.DstntDomain;
import com.ttrip.admin.dstnt.vo.DstntVO;

@Service
public class DstntService {

    @Autowired
    private DstntDAO dstntDAO;

    public List<DstntDomain> getAllDestinations() {
        return dstntDAO.selectAllDestinations();
    }

    public DstntDomain getDestinationById(int id) {
        return dstntDAO.selectDestinationById(id);
    }

    public List<DstntDomain> searchDestinations(String region, String name) {
        return dstntDAO.searchDestinations(region, name);
    }
    
    public boolean addDestination(DstntVO dstntVO) {
        return dstntDAO.insertDestination(dstntVO) > 0;
    }

    public boolean updateDestination(DstntVO dstntVO) {
        return dstntDAO.updateDestination(dstntVO) > 0;
    }

    public boolean deleteDestinationById(int id) {
        return dstntDAO.deleteDestinationById(id) > 0;
    }
}

