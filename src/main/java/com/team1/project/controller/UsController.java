package com.team1.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.project.dto.UsDTO;
import com.team1.project.service.UsService;

@Controller
@RequestMapping("/us")
public class UsController {
	
	@Autowired
	private UsService usService;
	
	// 1. 동행 전체 목록 페이지
	@RequestMapping(value = "/list")
	public String list(UsDTO us, Model model) throws Exception {
		try {
//			model.addAttribute("result", usService.boardPageList(us));
        } catch (Exception e) {
            e.printStackTrace();
        }
		return "us/list";	
	} 
	
//	// 동행 등록
//    @ResponseBody
//    @RequestMapping(value = "/insert", method = RequestMethod.POST)
//    public Map<String, Object> insertUs(@RequestBody UsDTO us) throws Exception {
//        Map<String, Object> resultMap = new HashMap<>();
//        if (usService.insertUs(us)) {
//            resultMap.put("message", "등록에 성공했습니다!");
//        } else {
//            resultMap.put("message", "등록에 실패했습니다.");
//        }
//        return resultMap;
//    }
    
//    // 동행 상세보기
//    @ResponseBody
//    @RequestMapping(value = "/detail", method = RequestMethod.POST)
//    public Map<String, Object> detail(@RequestBody UsDTO us) throws Exception {
//        System.out.println("동행 상세보기 컨트롤러");
//        Map<String, Object> Listcomment = new HashMap<>();
//        UsDTO detail = usService.getUs(us.getUsNum());
//        usService.viewCount(us.getUsNum());
//        Listcomment.put("us", detail);
//        return Listcomment;
//    }
//    
//    // 동행 수정하기
//    @ResponseBody
//    @RequestMapping(value = "/revice", method = RequestMethod.POST)
//    public Map<String, Object> revice(@RequestBody UsDTO us) throws Exception {
//    	boolean revice = usService.usUpdate(us);
//    	Map<String, Object> result = new HashMap<>();
//    	if (revice) {
//    		result.put("message", "수정 성공했습니다!");
//        } else {
//        	result.put("message", "수정 실패했습니다.");
//        }
//    	result.put("us", revice);
//    	return result;
//    }
//    
//    // 동행 삭제하기
//    @ResponseBody
//    @RequestMapping(value = "/delete", method = RequestMethod.POST)
//    public Map<String, Object> delete(@RequestBody UsDTO us) throws Exception {
//    	Map<String, Object> result = new HashMap<>();
//    	if (usService.usDelete(us.getUsNum())) {
//    		result.put("message", "삭제가 완료했습니다!");
//        } else {
//        	result.put("message", "삭제에 실패했습니다.");
//        }
//    	return result;
//    }
//    
//	// 동행 답글
//    @ResponseBody
//    @RequestMapping(value = "/reply", method = RequestMethod.POST)
//    public Map<String, Object> reply(@RequestBody UsDTO us) throws Exception {
//        System.out.println("게시글 등록: " + us);
//        Map<String, Object> resultMap = new HashMap<>();
//        int result = usService.reply(us);
//        System.out.println("답변 확인형" + result);
//        if (result > 0) {
//            resultMap.put("message", "답변 등록에 성공했습니다!");
//            String autoEmail = "audtjd1201@naver.com";
//            try {
//                // mailService.sendMail(autoEmail);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        } else {
//            resultMap.put("message", "답변 등록에 실패했습니다.");
//        }
//        return resultMap;
    }

