package com.team1.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("/admin")
	public String Admin() {
		return "admin";
	}
	
	@RequestMapping("/userList")
	public String AdminUserList() {
		return "adminUserList";
	}
	
	@RequestMapping("/usList")
	public String AdminUsList() {
		return "adminUsList";
	}
	
	@RequestMapping("/noticeList")
	public String AdminNoticeList() {
		return "adminNoticeList";
	}
	
	@RequestMapping("/11")
	public String Admin11() {
		return "admin11";
	}
}
