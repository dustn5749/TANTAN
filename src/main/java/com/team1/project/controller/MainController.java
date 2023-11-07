package com.team1.project.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.UsDTO;
import com.team1.project.service.UsService;


@Controller
public class MainController {
	
	@Autowired
	public UsService usService;

    @RequestMapping({"/", "/main.do"})
    public String Main(Model model) {
    	List<UsDTO> usList = usService.getUsRecentList();
    	System.out.println("최신 동행글 3 = " + usList);
    	model.addAttribute("usList",usList);
        return "main";
    }
}

