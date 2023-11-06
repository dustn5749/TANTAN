package com.team1.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.project.dto.MemberDTO;
import com.team1.project.service.MemberService;


/*
 * 1. 관리자 메인 페이지
 * 1.1 페이지 로드시 리스트(게시글, 여행지, 추천 등) 가져올 함수 필요함.
 * 
 * 2. 관리자 회원관리 페이지
 * 2.1 페이지 로드시 회원 리스트 가져와야 하고, 회원 재제 및 해제 함수 필요함.
 * 
 * 3. 관리자 동행관리 페이지
 * 3.1 페이지 로드시 동행 게시글 리스트 가져와야 하고, 삭제 함수 필요함.
 * 
 * 4. 관리자 공지사항 페이지
 * 
 * 5. 관리자 1:1 문의하기 페이지
 * 
 * 6. Autowired 사용해서 service 연결.
 * */


// 1. 관리자 메인 페이지
// 관리자 메인 페이지로 이동
@Controller

public class AdminController {
	
	@Autowired
	private MemberService memberservice; 
	
	@RequestMapping("/admin")
	public String Admin() {
		return "admin";
	}
	
// 1.1 관리자 메인 페이지 로드시 리스트 함수
	
// 2. 관리자 회원관리 페이지
// 관리자 페이지에서 회원관리로 이동
	
	@RequestMapping("/adminMemberList")
	
	public String AdminMemberList() {
		
		return "adminMemberList";
	}
	
	@RequestMapping("/memberList")
	@ResponseBody
	public Map<String, Object> memberList() throws Exception {
		
		List<MemberDTO> memberList = memberservice.memberList();
		System.out.println("controller.memberList -> " + memberservice.memberList());
		Map<String, Object> map = new HashMap<>();
		map.put("memberList",memberList);
		System.out.println("controller.map -> " + map);
		return map;
	}
//	
//	@GetMapping("/memberListData")
//	public String allMemberList(Model model) throws Exception {
//		
//		model.addAttribute("memberListData", memberservice.memberList());
//		
//		return "adminMemberList";
//	}
	
// 3. 관리자 동행관리 페이지
// 관리자 페이지에서 동행관리로 이동
	@RequestMapping("/usList")
	public String AdminUsList() {
		return "adminUsList";
	}
	
// 4. 관리자 계정관리 페이지
	@RequestMapping("/adminManage")
	public String AdminManage() {
		return "adminManage";
	}
	
// 5. 관리자 공지사항 페이지
// 관리자 페이지에서 공지사항으로 이동
	@RequestMapping("/noticeList")
	public String AdminNoticeList() {
		return "adminNoticeList";
	}
	
// 6. 관리자 1:1 문의하기 페이지
// 관리자 페이지에서 1:1 문의하기 페이지로 이동
	@RequestMapping("/11")
	public String Admin11() {
		return "admin11";
	}
}