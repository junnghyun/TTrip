package com.ttrip.dstnt.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DstntDomain {
	
	private int dstntId, regionId;
	private String name, addr, phone, status, img, detail;
	private double lat, lng;
}
