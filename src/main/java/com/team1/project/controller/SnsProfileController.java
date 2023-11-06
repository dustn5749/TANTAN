package com.team1.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SnsProfileController {

	//sns main페이지로 이동
	@RequestMapping("/snsProfile")
	public String Main() {
		return "snsProfile";
	}
	
	//sns 프로필 편집 페이지로 이동
	@RequestMapping("/snsProfile/modify")
	public String modify() {
		return "snsProfileModify";
	}
}
