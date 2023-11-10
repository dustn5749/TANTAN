package com.team1.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	// 고객센터로 이동
	@RequestMapping("/inquiry")
	public String inquiry(Model model) {
		return "inquiry";
	}
}
