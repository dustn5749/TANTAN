package com.team1.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.project.dao.MemberDao;
import com.team1.project.dto.InquiryDTO;
import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.ScheduleDTO;
import com.team1.project.dto.UsDTO;
import com.team1.project.service.CustomerService;
import com.team1.project.service.MemberService;
import com.team1.project.service.ScheduleService;
import com.team1.project.service.UsService;


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
	
	@Autowired
	private UsService usService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private MemberDao memberDAO;
	
	@RequestMapping("/admin")
	public String Admin(MemberDTO member,UsDTO us, Model model, ScheduleDTO schedule) {
		int todayRegister = memberservice.todayRegister(member);
		int todayWrite = usService.todayWrite(us);
		int todaySchedule = scheduleService.todaySchedule(schedule);
		model.addAttribute("todayRegister",todayRegister);
		model.addAttribute("todayWrite", todayWrite);
		model.addAttribute("todaySchedule", todaySchedule);
		return "admin";
	}
	
// 1.1 관리자 메인 페이지 로드시 리스트 함수
	@RequestMapping("/monthData")
	@ResponseBody
	public Map<String, Object> monthMember() throws Exception{
		List<MemberDTO> monthMember = memberservice.monthMember();
		List<UsDTO> monthUs = usService.monthUs();
		System.out.println("controller.monthMember -> " + memberservice.monthMember());
		System.out.println("controller.monthUs -> " + usService.monthUs());
		Map<String, Object> map = new HashMap<>();
		map.put("monthMember", monthMember);
		map.put("monthUs", monthUs);
//		System.out.println("controller.monthMap -> " + map);
		return map;
	}
	
//	@RequestMapping("/monthUs")
//	@ResponseBody
//	public Map<String, Object> monthUs() throws Exception{
//		List<UsDTO> monthUs = usService.monthUs();
//		Map<String, Object> map = new HashMap<>();
//		map.put("monthUs", monthUs);
//		return map;
//	}
	
// 2. 관리자 회원관리 페이지
// 관리자 페이지에서 회원관리로 이동
	
	@RequestMapping("/adminMemberList")
	
	public String AdminMemberList() {
		
		return "adminMemberList";
	}
//	2.1 관리자 회원리스트 출력
//	public Map<String, Object> memberList(MemberDTO member) throws Exception {
//	    
//	    int totalCount = memberDAO.getTotalCount(member);
//
//	    List<MemberDTO> memberList = memberservice.memberList(member);
//	    
//	    Map<String, Object> resultMap = new HashMap<>();
//	    resultMap.put("memberList", memberList);
//	    resultMap.put("totalSize", totalCount);
//
//	    return resultMap;
//	}
	@RequestMapping("/memberList")
	@ResponseBody
	public Map<String,Object> memberList(MemberDTO member) {
		System.out.println("memberList -> " + memberservice.memberList(member));
		int todayRegister = memberservice.todayRegister(member);
		System.out.println("register -> " + todayRegister);
		Map<String,Object> map = new HashMap<>();
		map.put("memberList", memberservice.memberList(member));
		map.put("totalSize", memberservice.getTotalSize(member));
		System.out.println("totalSize -> " + memberservice.getTotalSize(member));
//		model.addAttribute("todayRegister", memberservice.todayRegister(member));
		map.put("todayRegister", todayRegister);
		return map;
	}
	
    //2.2 관리자 회원 정지
    @RequestMapping("memberStop")
    @ResponseBody
    public Map<String,Object> memberStop(@RequestParam String member_id) {
    	Map<String,Object> result = new HashMap<>();
        try {
            memberservice.memberStop(member_id);
            result.put("message", "정지되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("message", "에러가 발생하였습니다.");
        }
        return result;
    }
    
    //2.3 관리자 회원 정지 해제
    @RequestMapping("memberRelease")
    @ResponseBody
    public Map<String,Object> memberRelease(@RequestParam String member_id){
    	Map<String,Object> result = new HashMap<>();
    	try {
    		memberservice.memberRelease(member_id);
    		result.put("message","해제되었습니다.");
    	} catch(Exception e) {
    		e.printStackTrace();
    		result.put("message", "에러가 발생하였습니다.");
    	}
    	return result;
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
	
	//3.1 관리자 동행 리스트 불러오기
	@RequestMapping("/usList.do")
	@ResponseBody
	public Map<String, Object> adminUsList() throws Exception {
		
		List<UsDTO> usList = usService.usList();
//		System.out.println("controller.adminUsList -> " + usService.usList());
		Map<String, Object> map = new HashMap<>();
		map.put("usList",usList);
//		System.out.println("controller.map -> " + map);
		return map;
	}
	
	//3.2 관리자 신고받은 동행리스트 불러오기
	@RequestMapping("usReportList")
	@ResponseBody
	public Map<String,Object> usReportList() throws Exception{
		
		List<UsDTO> usReportList = usService.usReportList();
//		System.out.println("usReportList -> " + usReportList);
		Map<String,Object> map = new HashMap<>();
		map.put("usReportList",usReportList);
		return map;
	}
	
    //3.3 관리자 게시글 삭제
    @RequestMapping("ausDelete")
    @ResponseBody
    public Map<String,Object> ausDelete(@RequestParam int us_num) {
    	Map<String,Object> result = new HashMap<>();
        try {
            usService.ausDelete(us_num);
            result.put("message", "성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            result.put("message", "에러가 발생하였습니다.");
        }
        return result;
    }
    
    //3.4 관리자 게시글 복구
    @RequestMapping("ausChange")
    @ResponseBody
    public Map<String,Object> audChange(@RequestParam int us_num){
    	Map<String,Object> result = new HashMap<>();
    	try {
    		usService.ausChange(us_num);
    		result.put("message", "성공적으로 복구되었습니다.");
    	} catch (Exception e) {
    		e.printStackTrace();
    		result.put("message", "에러가 발생하였습니다.");
    	}
    	return result;
    }
	
// 4. 관리자 계정관리 페이지
	@RequestMapping("/adminManage")
	public String AdminManage() {
		return "adminManage";
	}
	
	@RequestMapping("/adminList")
	@ResponseBody
	public Map<String, Object> adminMember() throws Exception {
		
		List<MemberDTO> adminList = memberservice.adminList();
//		System.out.println("controller.memberList -> " + memberservice.adminList());
		Map<String, Object> map = new HashMap<>();
		map.put("adminList",adminList);
//		System.out.println("controller.map -> " + map);
		return map;
	}
	
// 5. 관리자 공지사항 페이지
// 관리자 페이지에서 공지사항으로 이동
	@RequestMapping("/noticeList")
	public String adminNoticeList() {
		return "adminNoticeList";
	}
	
// 6. 관리자 1:1 문의하기 페이지
// 관리자 페이지에서 1:1 문의하기 페이지로 이동
	@RequestMapping("/inquiryList")
	public String adminInquiryList() {
		return "adminInquiryList";
	}
	
// 6.1 관리자 1:1 문의사항 리스트 가져오기
	@RequestMapping("/inquiryList.do")
	@ResponseBody
	public Map<String, Object> getInquiryList(InquiryDTO inquiry) throws Exception {
		System.out.println("controller inquiryList -> " + inquiry);
		List<InquiryDTO> inquiryList = customerService.inquiryList();
		Map<String, Object> map = new HashMap<>();
		map.put("inquiryList", inquiryList);
		return map;
	}
}