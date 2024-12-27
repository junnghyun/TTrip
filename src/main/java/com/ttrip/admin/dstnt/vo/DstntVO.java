package com.ttrip.admin.dstnt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DstntVO {
	private int dstntId, regionId;
	private String name, addr, phone, status, img, detail;
	private double lat, lng;
}
