package com.ttrip.accom;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccomDomain {

	private int accomId, regionId;
	private String name, addr, phone, status;
	private double lat, lng;
}