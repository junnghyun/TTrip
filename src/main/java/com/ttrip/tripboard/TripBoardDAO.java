package com.ttrip.tripboard;

import java.util.List;

public interface TripBoardDAO {
    List<TripBoardDomain> getDestinationsByRegion(String region);
}
