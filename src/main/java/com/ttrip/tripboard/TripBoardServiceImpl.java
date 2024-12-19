package com.ttrip.tripboard;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TripBoardServiceImpl implements TripBoardService {

    @Autowired
    private TripBoardDAO tripBoardDAO;

    @Override
    public List<TripBoardDomain> getDestinationsByRegion(String region) {
        return tripBoardDAO.getDestinationsByRegion(region);
    }
}
