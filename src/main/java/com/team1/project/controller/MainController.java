package com.team1.project.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.DoeDTO;
import com.team1.project.dto.ReviewDTO;
import com.team1.project.dto.ScheduleDTO;
import com.team1.project.dto.UsDTO;
import com.team1.project.dto.UsFileDTO;
import com.team1.project.service.DoeService;
import com.team1.project.service.ReviewService;
import com.team1.project.service.ScheduleService;
import com.team1.project.service.UsFileService;
import com.team1.project.service.UsService;


@Controller
public class MainController {
	
	@Autowired
	public UsService usService;
	
	@Autowired
	public ScheduleService scheduleService;
	
	@Autowired
	public UsFileService usFileService;
	
	@Autowired
	public DoeService doeService;
	


	@RequestMapping({"/", "/main.do"})
	public String Main(Model model) {
	    
		// 평점 순 리뷰 데이터 
		List<DoeDTO> doeList = doeService.getTopReviewList();
		System.out.println("TOP5 doeList = " + doeList);
		
		// 최신 동행글 데이터
		List<UsDTO> usList = usService.getUsRecentList();
	    System.out.println("최신 동행글 3 = " + usList);

	    
	    // 일정 공유 데이터
	    List<ScheduleDTO> scheduleList= scheduleService.getTop3ScheduleList();
	    
	    for(ScheduleDTO item : scheduleList) {
	    	String doe_img = doeService.getDoeImg(item.getDoe_Name());
	    	System.out.println("doe_img = " + doe_img);
	    	item.setDoe_img(doe_img);
	    }
	    System.out.println("schedule top 3 = " + scheduleList);
	    
	    model.addAttribute("doeList", doeList);
	    model.addAttribute("usList", usList);
	    model.addAttribute("scheduleList",scheduleList );
	    return "main";
	}
}

