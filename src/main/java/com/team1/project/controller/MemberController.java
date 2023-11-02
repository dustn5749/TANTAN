package com.team1.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.project.dto.MemberDTO;
import com.team1.project.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	
	@Autowired
	private MemberService memberservice; 
	
	
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
	
	// 일반 로그인하기
	@ResponseBody
	@RequestMapping("/login.do")
	public Map<String, Object> login(@RequestBody MemberDTO member) {
		System.out.println("memberController.login(memberDTO)");
		System.out.println("member = " + member);
		Map<String, Object> result = new HashMap<>();
		result.put("result", memberservice.login(member));
		return result;
	}
	
}
