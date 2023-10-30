package com.team1.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


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
