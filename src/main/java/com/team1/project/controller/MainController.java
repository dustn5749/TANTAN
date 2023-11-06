package com.team1.project.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.MemberDTO;

@Controller
public class MainController {

	@RequestMapping({"/", "/main.do"})
	public String Main() {
		return "main";
	}
	
}
