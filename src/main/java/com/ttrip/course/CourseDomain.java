package com.ttrip.course;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CourseDomain {
    private int courseId;
    private int dstntId;
    private int tripPlanId;
}
