package com.team1.project.controller;

import java.security.Security;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.project.config.auth.PrincipalDetails;
import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.ScheduleDTO;
import com.team1.project.service.ScheduleService;

import lombok.extern.log4j.Log4j2;
@Log4j2
@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	//일정목록보기
	@RequestMapping (value = "/list")
    public String schedule(Model model, ScheduleDTO schedule) throws Exception {
		System.out.println("schedule" + schedule);
		MemberDTO member = getCurrentMember();
		String memberId = member == null ? null : member.getMember_id();
		
		Map<String, Object> result = scheduleService.schedulePageList(schedule, memberId);
		model.addAttribute("result", result);
	   
    return "scheduleList";
   } 
	
    //일정 페이지 이동
    @RequestMapping(value = "/write")
    public String write(ScheduleDTO schedule) throws Exception {
    return "scheduleWrite";
   }


//글작성
    @ResponseBody
    @RequestMapping(value = "/writeInsert")
    public Map<String, Object> writeInsert(@RequestBody List<ScheduleDTO> schedules) throws Exception {
        Map<String, Object> result = new HashMap<>();
        System.out.println("일정 등록 출력: " + schedules);
        // 일정이 하나라도 실패하면 이 값을 false로 변경
        boolean allSucceeded = true;
        
        ScheduleDTO insertDto = new ScheduleDTO();
        // 여러 일정에 대한 처리
        for (int i = 0; i < schedules.size(); i++) {
        	ScheduleDTO dto = schedules.get(i);
        	insertDto.setMember_id(dto.getMember_id());
        	insertDto.setStart_Num(dto.getStart_Num());
        	insertDto.setEnd_Date(dto.getEnd_Date());
        	insertDto.setDoe_Name(dto.getDoe_Name());
        	insertDto.setTitle(dto.getTitle());
        	
        	if (i == 0) {
        		insertDto.setPlace1(dto.getPlace1());
        		insertDto.setMemo1(dto.getMemo1());
        		insertDto.setDate1(dto.getDate1());
        	} else if (i == 1) {
        		insertDto.setPlace2(dto.getPlace1());
        		insertDto.setMemo2(dto.getMemo1());
        		insertDto.setDate2(dto.getDate1());
        	} else if (i == 2) {
        		insertDto.setPlace3(dto.getPlace1());
        		insertDto.setMemo3(dto.getMemo1());
        		insertDto.setDate3(dto.getDate1());
        	}
        }
        
        // 일정 등록에 실패하면 allSucceeded를 false로 변경
        if (!scheduleService.writeInsert(insertDto)) {
            allSucceeded = false;
        }
        
        
        if (allSucceeded) {
            result.put("message", "모든 일정이 성공적으로 등록되었습니다.");
            result.put("result", true);
        } else {
            result.put("message", "일부 또는 전체 일정 등록에 실패했습니다.");
            result.put("result", false);
        }

        return result;
    }
    
    //도시 가져오기 
    @ResponseBody
    @RequestMapping (value = "/writeInsert2")
    public Map<String, Object> writeInsert2(@RequestBody ScheduleDTO schedule)throws Exception {
    	System.out.println("일정 도시 가져오기" + schedule);
    	
    	Map<String, Object> result = scheduleService.Doenum(schedule);
    	   return result;
    }
   
    // 도시 위도, 경도 가져오기
    @ResponseBody
    @RequestMapping (value = "/selectCity")
    public Map<String, Object> selectCity(@RequestBody ScheduleDTO schedule)throws Exception {
    	System.out.println("위도 경도 가져오기" + schedule);
    	
    	Map<String, Object> result = scheduleService.selectCity(schedule);
    	   return result;
    } 

 // 일정상세보기
    @RequestMapping(value = "/detail")
    public String getScheduleDetail(@RequestParam("schedule_Num") int schedule_Num, Model model) {
        try {
            List<ScheduleDTO> result = scheduleService.getScheduleDetail(schedule_Num);
            List<ScheduleDTO> transList = new ArrayList<>();
            for (int i =0; i< result.size(); i ++) { 
            	ScheduleDTO current = result.get(i);
            	ScheduleDTO dto = new ScheduleDTO();
            	
            	dto.setTitle(current.getTitle());
            	dto.setStart_Num(current.getStart_Num());
            	dto.setEnd_Date(current.getEnd_Date());
            	dto.setMember_id(current.getMember_id());
            	dto.setSchedule_Num(current.getSchedule_Num());
            	dto.setDoe_Name(current.getDoe_Name());
            	dto.setCity_latitude(current.getCity_latitude());
            	dto.setCity_longitude(current.getCity_longitude());
            	
            	if (i == 0) {
            		dto.setPlace1(current.getPlace1());
            		dto.setDate1(current.getDate1());
            		dto.setMemo1(current.getMemo1());
            	} else if (i == 1) {
            		dto.setPlace1(current.getPlace2());
            		dto.setDate1(current.getDate2());
            		dto.setMemo1(current.getMemo2());
            	} else if (i == 2) {
            		dto.setPlace1(current.getPlace3());
            		dto.setDate1(current.getDate3());
            		dto.setMemo1(current.getMemo3());
            	}
            	transList.add(dto);
            }
            // 여기서 결과를 적절히 처리
            model.addAttribute("scheduleList", transList);
            model.addAttribute("writer", scheduleService.getWriter(schedule_Num));
            System.out.println(result);

            return "scheduleDetail";
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            return "errorPage"; 
        }
    }
    
   //수정하기
	@ResponseBody
	@PostMapping("/update/{scheduleNum}")
	public Map<String, Object> update(@RequestBody List<ScheduleDTO> schedules, @PathVariable("scheduleNum") int scheduleNum) throws Exception {
        ScheduleDTO insertDto = new ScheduleDTO();
        System.out.println("들어온 데이터 = " + schedules);
        // 여러 일정에 대한 처리
        for (int i = 0; i < schedules.size(); i++) {
        	ScheduleDTO dto = schedules.get(i);
        	insertDto.setMember_id(dto.getMember_id());
        	insertDto.setStart_Num(dto.getStart_Num());
        	insertDto.setEnd_Date(dto.getEnd_Date());
        	insertDto.setDoe_Name(dto.getDoe_Name());
        	insertDto.setTitle(dto.getTitle());
        	
        	if (i == 0) {
        		insertDto.setPlace1(dto.getPlace1());
        		insertDto.setMemo1(dto.getMemo1());
        		insertDto.setDate1(dto.getDate1());
        	} else if (i == 1) {
        		insertDto.setPlace2(dto.getPlace1());
        		insertDto.setMemo2(dto.getMemo1());
        		insertDto.setDate2(dto.getDate1());
        	} else if (i == 2) {
        		insertDto.setPlace3(dto.getPlace1());
        		insertDto.setMemo3(dto.getMemo1());
        		insertDto.setDate3(dto.getDate1());
        	}
        }
		
	    boolean update = scheduleService.scheduleUpdate(scheduleNum, insertDto);
	    Map<String, Object> result = new HashMap<>();
	    if (update) {
	        result.put("message", "수정 성공했습니다!");
	    } else {
	        result.put("message", "수정 실패했습니다.");
	    }
	    result.put("schedule", update);

    return result;
	}
    
	// 일정 삭제하기
	@ResponseBody
	@RequestMapping(value = "/delete")
	public Map<String, Object> delete(@RequestBody ScheduleDTO schedule) throws Exception {
	    Map<String, Object> result = new HashMap<>();
	    System.out.println("schedule = " + schedule);
	    if (scheduleService.scheduleDelete(schedule.getSchedule_Num())) {
	        result.put("message", "삭제가 완료했습니다!");
	    } else {
	        result.put("message", "삭제에 실패했습니다.");
	    }
    return result;
	}

	
	//하트색
//	@PostMapping("/updateHeartColor")
//	@ResponseBody
//	public Map<String, Object> updateHeartColor(@RequestParam("scheduleNum") int schedule_Num, @RequestParam("isLike") boolean isLike) {
//		// isLike가 true면 좋아요 개수 올려주기
//		// false면 좋아요 취소
//		
//		MemberDTO member = getCurrentMember();
//		scheduleService.updateLike(member.getMember_id(), schedule_Num, isLike);
//		
//	    Map<String, Object> response = new HashMap<>();
//	    try {
//
//	        response.put("success", true);
//	    } catch (Exception e) {
//	        response.put("success", false);
//	        response.put("error", e.getMessage());
//	    }
//	    return response;
//	}
//	
//	
	
	
	@PostMapping("/updateHeartColor")
    @ResponseBody
    public Map<String, Object> updateHeartColor(@RequestParam("scheduleNum") int scheduleNum, @RequestParam("isLike") boolean isLike) {
        MemberDTO member = getCurrentMember();
        scheduleService.updateLike(member.getMember_id(), scheduleNum, isLike);

        Map<String, Object> response = new HashMap<>();
        try {
            System.out.println("likecont ??????= ");

        	
            // 좋아요 수를 응답에 추가
            int likeCount = scheduleService.getLikeCount(scheduleNum);
            System.out.println("likecont = " + likeCount);
            response.put("success", true);
            response.put("likeCount", likeCount);
        } catch (Exception e) {
            response.put("success", false);
            response.put("error", e.getMessage());
        }
        return response;
    }

    // 로그인 상태가 아니라면. null 리턴
    private MemberDTO getCurrentMember() {
        try {
            return (MemberDTO) ((PrincipalDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUser();
        } catch (ClassCastException e) {
            return null;
        }
    }

	
	// 일정 위시리스트 목록 가져오기
	@RequestMapping("/likeScheduleList")
	public String getLikeScheduleList(@RequestParam("member_id") String member_id, Model model,ScheduleDTO schedule) {
		System.out.println("getLikeScheduleList.member_id = " + member_id);
		Map<String, Object> result = scheduleService.getLikeScheduleList(member_id, schedule);
		System.out.println("result = " + result);
		model.addAttribute("result", result);
		return "wishList";
	}
}
