package com.ttrip.admin.dstnt.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DstntDomain {
	
	private int dstntId, regionId;
	private String name, addr, phone, status, img, detail;
	private double lat, lng;
}
