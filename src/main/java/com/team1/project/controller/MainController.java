package com.team1.project.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.UsDTO;
import com.team1.project.dto.UsFileDTO;
import com.team1.project.service.UsFileService;
import com.team1.project.service.UsService;


@Controller
public class MainController {
	
	@Autowired
	public UsService usService;
	
	@Autowired
	public UsFileService usFileService;

	@RequestMapping({"/", "/main.do"})
	public String Main(Model model) {
	    List<UsDTO> usList = usService.getUsRecentList();
	    System.out.println("최신 동행글 3 = " + usList);
	    List<Integer> us_numList = new ArrayList<>(); // us_num 값을 저장할 리스트 생성

	    for (UsDTO us : usList) {
	        us_numList.add(us.getUs_num()); 
	    }
	    System.out.println("us_numList = " + us_numList);
	    model.addAttribute("usList", usList);
	    return "main";
	}
}

