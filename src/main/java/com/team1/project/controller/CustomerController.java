package com.team1.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.InquiryDTO;
import com.team1.project.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	public CustomerService customerService;
	// 고객센터로 이동
	@RequestMapping("/inquiryList")
	public String inquiry(Model model, InquiryDTO inquiry) {
		model.addAttribute("result", customerService.getInquiryList(inquiry));
		return "inquiry";
	}
	
	// 1대1 문의사항 글쓰기
	@RequestMapping("/write")
	public String write() {
		return "inquiry_write";
	}
	
	
}
