package com.team1.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.service.UsService;

@Controller
public class MainController {

    @Autowired
    private UsService usService;
    
    @RequestMapping({"/", "/main.do"})
    public String Main(Model model) {
        System.out.println("main() invoked.");
// model.addAttribute("us", usService.usTop5());
        return "main";
    }
}
