package com.team1.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.ScheduleDTO;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	//일정목록보기
	@GetMapping(value = "/list")
    public String schedule(ScheduleDTO schedule) throws Exception {
	    System.out.println("일정 목록 출력: " + schedule);
    return "scheduleList";
   }
    //일정작성하기
    @RequestMapping(value = "/write")
    public String write(ScheduleDTO schedule) throws Exception {
    return "scheduleWrite";
   }
    
  
    
    //일정상세보기
    @RequestMapping(value = "/detail")
    public String detail(ScheduleDTO schedule) throws Exception {
    return "scheduleDetail";
    }
}
