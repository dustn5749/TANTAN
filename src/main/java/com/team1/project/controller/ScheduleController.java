package com.team1.project.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.project.dto.ScheduleDTO;
import com.team1.project.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	//일정목록보기
	@GetMapping(value = "/list")
    public String schedule(Model model, ScheduleDTO schedule) throws Exception {
		model.addAttribute("result", scheduleService.usPageList(schedule));
	    System.out.println("일정 목록 출력: " + schedule);
    return "scheduleList";
   } 
	
    //일정 페이지 이동
    @RequestMapping(value = "/write")
    public String write(ScheduleDTO schedule) throws Exception {
    return "scheduleWrite";
   }
    
  
    
    //일정상세보기
    @RequestMapping(value = "/detail")
    public String detail(ScheduleDTO schedule) throws Exception {
    return "scheduleDetail";

    }
    
    
    @ResponseBody
    @RequestMapping(value = "/writeInsert")
    public Map<String, Object> writeInsert(@RequestBody List<ScheduleDTO> schedules) throws Exception {
        Map<String, Object> result = new HashMap<>();
        System.out.println("일정 등록 출력: " + schedules);
        // 일정이 하나라도 실패하면 이 값을 false로 변경
        boolean allSucceeded = true;
        
        // 여러 일정에 대한 처리
        for (ScheduleDTO schedule : schedules) {
            schedule.setMember_Id("user123");
            
            // 일정 등록에 실패하면 allSucceeded를 false로 변경
            if (!scheduleService.writeInsert(schedule)) {
                allSucceeded = false;
            }
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

    // 일정1일 일정2일 가져오기
//    @ResponseBody
//    @RequestMapping (value = "/day")
//    public Map<String, Object> day(@RequestBody ScheduleDTO schedule)throws Exception {
//    	System.out.println(" 일정1일 일정2일 가져오기" + schedule);
//    	Map<String, Object> result = scheduleService.day(schedule);
//    	return result;
//    } 
//    
    
    
//   //일정상세보기
   @GetMapping(value = "/detail/{schedule_Num}")
   public String detailService(@PathVariable int schedule_Num, Model model)throws Exception {
   	ScheduleDTO schduleDetail = scheduleService.schduleDetail(schedule_Num);
   	System.out.println("일정 상세보기 컨트롤러");
    	  model.addAttribute("schedule", schduleDetail);
   	  return "scheduleDetail";
    }

   
   //수정하기
	@ResponseBody
	@PostMapping("/update")
	public Map<String, Object> update(@RequestBody ScheduleDTO schedule) throws Exception {
	    boolean update = scheduleService.scheduleUpdate(schedule);
	    Map<String, Object> result = new HashMap<>();
	    if (update) {
	        result.put("message", "수정 성공했습니다!");
	    } else {
	        result.put("message", "수정 실패했습니다.");
	    }
	    result.put("schedule", update);

	    System.out.println("수정하기 확인 " + schedule);

    return result;
	}

	// // 동행 삭제하기
//	@ResponseBody
//	@RequestMapping(value = "/delete", method = RequestMethod.POST)
//	public Map<String, Object> delete(@RequestBody UsDTO us) throws Exception {
//	    Map<String, Object> result = new HashMap<>();
//	    if (ScheduleService.scheduleDelete(schedule.getsShedule_Num())) {
//	        result.put("message", "삭제가 완료했습니다!");
//	    } else {
//	        result.put("message", "삭제에 실패했습니다.");
//	    }
//	    return result;
//	}
    
}
