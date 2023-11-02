package com.team1.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	// 로그인폼으로 연동
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "loginForm";
	}
	
	// 회원가입 form으로 가기
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "joinForm";
	}
	
	// sns 회원가입하기 form으로 가기
	@RequestMapping("/snsJoinForm.do")
	public String snsJoinForm() {
		return "snsJoinForm";
	}
	
	// 회원가입 완료창
	@RequestMapping("/joinComplete.do")
	public String joinComplete() {
		return "joinComplete";
	}
	
	
	
}
