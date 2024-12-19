package com.ttrip.tripboard;

import java.util.List;

public interface TripBoardService {
    List<TripBoardDomain> getDestinationsByRegion(String region);
}
