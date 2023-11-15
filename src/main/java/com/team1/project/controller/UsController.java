package com.team1.project.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.UsDTO;
import com.team1.project.service.MemberService;
import com.team1.project.service.UsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/us")
public class UsController {
	
	@Autowired
	private UsService usService;
	
	@Autowired
	 private MemberService memberservice;
	
	// 1. 동행 전체 목록 페이지
	@RequestMapping(value = "/list")
	public String list( UsDTO us, Model model) throws Exception {
		System.out.println("uscontroller.list()");

		System.out.println("us = " + us);
		model.addAttribute("result", usService.usPageList(us));
	return "usList"; 
	} 
	
	//글쓰기 페이징 이동
	@RequestMapping(value = "/write" ) 
	public String  writeUs(Model model)throws Exception {
    return "usWrite";
    }

	//글쓰기 작성
	@ResponseBody
	@RequestMapping(value = "/writeInsert" ) 
	public Map<String, Object>  writeInsert(@RequestBody UsDTO us)throws Exception {
		System.out.println("us = " + us);
		Map<String, Object> result = new HashMap();
		
		if (usService.writeInsert(us)) {
    		result.put("message", "등록 성공했습니다!");
    		result.put("result", usService.usPageList(us));
        } else {
        	result.put("message", "등록 실패했습니다.");
        }
    return result;
    }

	 //글쓰기 상세보기 페이지 이동
	   @RequestMapping(value = "/Detail" ) 
	   public String detailUs(@RequestParam("us_num") int us_num, Model model) throws Exception {
	      System.out.println("us = " + us_num);
	      log.info("");
	      UsDTO usDetail = usService.usDetail(us_num);
	      System.out.println("usDetail = " + usDetail);
	      MemberDTO writer = memberservice.findById(usDetail.getWriter());
	      System.out.println("동행 상세보기 컨트롤러");
	      model.addAttribute("writer", writer);
	      model.addAttribute("us", usDetail);
	    return "usDetail";
	    }
	
	
	@ResponseBody
	@RequestMapping(value = "/RealDetail", method = RequestMethod.POST)
	public UsDTO detail(@RequestParam("us_num") int us_num) throws Exception {                       
	    UsDTO us = usService.usDetail(us_num);
	    System.out.println("동행 상세보기 컨트롤러");
	    return us;
	}

//	 수정하기
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public Map<String, Object> update(@RequestBody UsDTO us) throws Exception {
		System.out.println("us = " + us);
		System.out.println("작성자 = " + us.getWriter());
	    boolean update = usService.usUpdate(us);
	    Map<String, Object> result = new HashMap<>();
	    if (update) {
	        result.put("message", "수정 성공했습니다!");
	    } else {
	        result.put("message", "수정 실패했습니다.");
	    }
	    result.put("us", update);

	    System.out.println("수정하기 확인 " + us);

	    return result;
	}
    // 동행 삭제하기
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Map<String, Object> delete(@RequestBody UsDTO us) throws Exception {
	    Map<String, Object> result = new HashMap<>();
	    if (usService.usDelete(us.getUs_num())) {
	        result.put("message", "삭제가 완료했습니다!");
	    } else {
	        result.put("message", "삭제에 실패했습니다.");
	    }
	    return result;
	}

	
	
//	 @PostMapping("/comments/add")
//	    public ResponseEntity<String> addComment(@RequestBody CommentData commentData) {
//	        String userId = commentData.getUserId();
//	        String content = commentData.getContent();
//
//	        if (userId != null && content != null) {
//	            Comment comment = new Comment(userId, content);
//
//	            try {
//	            	usService.saveComment(comment); 
//	                return ResponseEntity.ok("댓글이 성공적으로 추가되었습니다.");
//	            } catch (Exception e) {
//	                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("댓글 추가에 실패했습니다.");
//	            }
//	        } else {
//	            return ResponseEntity.badRequest().body("잘못된 요청입니다.");
//	        }
	
}

