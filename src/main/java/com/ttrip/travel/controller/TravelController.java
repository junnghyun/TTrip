package com.ttrip.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelController {

    @RequestMapping("/tr2")
    public String tr2() {

        return "ttrip/travel/travel-plan2";
    }

    @RequestMapping("/tr3")
    public String tr3() {

        return "ttrip/travel/travel-plan3";
    }

    @RequestMapping("/tc")
    public String tc() {

        return "ttrip/travel/travel_course_result";
    }

    @RequestMapping("/tm")
    public String tm() {

        return "ttrip/travel/travel_main";
    }

}
