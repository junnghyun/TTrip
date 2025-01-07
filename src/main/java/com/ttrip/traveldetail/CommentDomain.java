package com.ttrip.traveldetail;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentDomain {
    private int trip_commentID;
    private int trip_boardID;
    private String nick;
    private String detail;
    private Timestamp input_date;
    private String status;
}
