package com.ttrip.user.report;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString

public class ReportVO {

	private int reportId,boardId,commentId;
	private String nick, reasonFlag,reason, status;
	private Date completeDate;
	
}
