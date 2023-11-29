package com.team1.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.project.dto.InquiryDTO;
import com.team1.project.service.CustomerService;
import com.team1.project.service.FileTokenService;
import com.team1.project.service.FileUploadService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	public CustomerService customerService;
	private final FileTokenService fileTokenService;
	
	@Autowired 
	public FileUploadService fileUploadService;
	
	// 고객센터로 이동
	@RequestMapping("/inquiryList")
	public String inquiry(Model model, InquiryDTO inquiry) {
		model.addAttribute("result", customerService.getInquiryList(inquiry));
		return "inquiry";
	}
	
	// 1대1 문의사항 글쓰기
	@RequestMapping("/write")
	public String write(Model model) {
		final String token = fileTokenService.getToken();
		log.debug("token = ", token);
		model.addAttribute("token", token);	
		return "inquiry_write";
	}
	
	//문의사항 상세보기
	@RequestMapping("/detail")
	public String detail(@RequestParam("inquiry_num") int inquiry_num ,Model model) {
		InquiryDTO inquiry = customerService.getInquiry(inquiry_num);
		System.out.println("inquiry_num = " + inquiry_num);
		model.addAttribute("inquiry", inquiry);
		
		List<Integer> fileList = fileUploadService.getFiles(inquiry_num);
		System.out.println(fileList);
		model.addAttribute("file", fileList);
		return "inquiry_detail";
	}
	
	
}
