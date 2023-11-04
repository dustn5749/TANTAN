package com.team1.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.BoardDTO;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	//일정목록보기
    @RequestMapping(value = "/list")
    public String schedule(BoardDTO board) throws Exception {
    return "scheduleList";
   }
    //일정작성하기
    @RequestMapping(value = "/write")
    public String cap(BoardDTO board) throws Exception {
    return "scheduleWrite";
    }
    //일정상세보기
    @RequestMapping(value = "/detail")
    public String capDetail(BoardDTO board) throws Exception {
    return "scheduleDetail";
    }
}
