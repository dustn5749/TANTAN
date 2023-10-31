package com.team1.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	// 로그인 창으로 이동
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "loginForm";
	}
	
	// 회원가입창으로 이동
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "joinForm";	
	}
	
	// sns회원가입으로 이동
	@RequestMapping("/joinProcess2.do")
	public String snsJoinForm() {
		return "snsJoinForm";	
	}
	
	// 회원가입완료
	@RequestMapping("/joinComplete.do")
	public String joinComplete() {
		return "joinComplete";	
	}
	
	// 리뷰
	@RequestMapping("/review.do")
	public String review() {
		return "review";	
	}
	
	// 동행test
	@RequestMapping("/us.do")
	public String us() {
		return "us";	
	}
	
	// 리뷰
	@RequestMapping("/map.do")
	public String map() {
		return "map";	
	}
}	
