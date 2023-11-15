package com.team1.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@GetMapping(value = "/list")
    public String schedule(Model model, ScheduleDTO schedule)
    		throws Exception {
		model.addAttribute("result", scheduleService.usPageList(schedule));
	    System.out.println("일정 목록 출력: " + schedule);
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

 // 일정상세보기
    @RequestMapping(value = "/detail")
    public String getScheduleDetail(@RequestParam("schedule_Num") int schedule_Num, Model model) {
        try {
            List<ScheduleDTO> result = scheduleService.getScheduleDetail(schedule_Num);

            // 여기서 결과를 적절히 처리
            model.addAttribute("scheduleList", result);
            System.out.println(result);

            return "scheduleDetail"; // 적절한 뷰 이름으로 변경
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            return "errorPage"; // 적절한 에러 페이지로 변경
        }
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

	// 일정 삭제하기
	@ResponseBody
	@RequestMapping(value = "/delete")
	public Map<String, Object> delete(@RequestBody ScheduleDTO schedule) throws Exception {
	    Map<String, Object> result = new HashMap<>();
	  
	    if (scheduleService.scheduleDelete(schedule.getSchedule_Num())) {
	        result.put("message", "삭제가 완료했습니다!");
	    } else {
	        result.put("message", "삭제에 실패했습니다.");
	    }
    return result;
	}
//
//	@Controller
//	@RequestMapping("/ajax_page")
//	public class AjaxListController {
//
//
//	@GetMapping
//	   public String ajaxList(
//	        @RequestParam(value = "keyword", defaultValue = "") String keyword,
//	        @RequestParam(value = "order", defaultValue = "") String order,
//	        @RequestParam(value = "curPage", defaultValue = "1") int curPage,
//	        Model model) {
//
//	        int count = dao.getSearchCount(keyword);
//	        Pager pager = new Pager(count, curPage);
//	        int start = pager.getPageBegin();
//	        int end = pager.getPageEnd();
//	        int totPage = pager.getTotPage();
//
////	        List<ScheduleDTO> list = s.getSearchList(start, end, order, keyword);
//
//	        model.addAttribute("List", scheduleList);
//	        model.addAttribute("page", pager);
//	        model.addAttribute("pageNo", totPage);
//	        model.addAttribute("count", count);
//	        model.addAttribute("keyword", keyword);
//
//	        return "ajax_list";
//	    }
//	}
//
//	//무한 스크크롤
//    @GetMapping("/list")
//    public String mainPage(Model model, @RequestParam(value = "page",defaultValue = "1") int pageNo) 			{
//        int count = dao.getContentsCount();
//        Pager pager = new Pager(count, pageNo);
//        int start = pager.getstart_Num();
//        int end = pager.getend_Date();
//        int totPage = pager.getTotalCount();
//        String order = "view_cnt";
//
//        List<ScheduleDTO> list = schedule.ScheduleList(start, end, order);
//
//        model.addAttribute("list", list);
//        model.addAttribute("page", pager);
//        model.addAttribute("totalPageSize", totalPageSize);
//        model.addAttribute("count", count);
//
//        return "scheduleList";
//    }
//	
	
	//하트색
	@PostMapping("/updateHeartColor")
	@ResponseBody
	public Map<String, Object> updateHeartColor(@RequestParam("scheduleNum") String scheduleNum) {
	    Map<String, Object> response = new HashMap<>();
	    try {

	        response.put("success", true);
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("error", e.getMessage());
	    }
	    return response;
	}
}
