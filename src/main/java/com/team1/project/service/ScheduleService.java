package com.team1.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.ScheduleDAO;
import com.team1.project.dto.DayDTO;
import com.team1.project.dto.ScheduleDTO;


@Service
public class ScheduleService {

	@Autowired
	private ScheduleDAO schduleDAO;
	
	// 1. 일정 목록 조회
		public Map<String, Object> schedulePageList(ScheduleDTO schdule) throws Exception {
		
			int totalCount = schduleDAO.totalCount(schdule);
			System.out.println("totalCount " + totalCount );
			System.out.println("totalCount " + schdule.getNavStart() );
			schdule.setTotalCount(totalCount);
			
			Map<String, Object> result = new HashMap<>();
			try {
			result.put("scheduleList", schduleDAO.getScheduleList(schdule)); // 게시글 목록 조회
			result.put("schedule", schdule);
			} catch (Exception e) {
				result.put("message", "서버 오류 발생");
				e.printStackTrace();
			}
			System.out.println("schduleService: " + schduleDAO.getScheduleList(schdule));
//			System.out.println("schduleService: " + result);
			return result;
			
		}
		//일정 작성하기
		public boolean writeInsert(ScheduleDTO schedule) throws Exception {
		System.out.println("ScheduleDTO 일정 작성하기 =" + schedule);
		int result = schduleDAO.writeInsert(schedule);
		
//		DayDTO in = DayDTO.builder()
//							.schedule_Num(schedule.getSchedule_Num())
//							.dayDate(schedule.getStart_Num())
//							.place(schedule.getPlace())
//							.memo(schedule.getMemoList())
//							.build();
//		int result2 =  schduleDAO.day(in);
		System.out.println("result = " + result);
//		System.out.println("result2 = " + result2);
		if(result == 1 && result == 1) {
			return true;
		}
		return false;
		}
		
		//일정 지역 번호 가져오기
		public Map<String, Object> Doenum(ScheduleDTO schedule) throws Exception {
			Map<String, Object> result = new HashMap<>();
			result.put("result", schduleDAO.Doenum(schedule)); 
			System.out.println(result);
			return result;
		}

		// 도시 위도, 경도 가져오기
		public Map<String, Object> selectCity(ScheduleDTO schedule) {
			Map<String, Object> result = new HashMap<>();
			result.put("city", schduleDAO.selectCity(schedule)); 
			System.out.println(result);			
			return result;
		}
		
		// 일정추가 
		//		public Map<String, Object> day(ScheduleDTO schedule) {
		//			Map<String, Object> result = new HashMap<>();
		//			result.put("day", schduleDAO.day(schedule)); 
		//			System.out.println(result);			
		//			return result;
		//		}
		
	
		//일정 상세보기
		public List<ScheduleDTO> getScheduleDetail(int schedule_Num) {
		    return schduleDAO.schduleDetail(schedule_Num);
		}
	
		// 일정 수정하기
		public boolean scheduleUpdate(int scheduleNum, ScheduleDTO schedule) throws Exception {
		    System.out.println("schedule.service.scheduleUpdate() 함수가 호출되었습니다");
		    Map<String, Object> params = new HashMap<>();
		    params.put("scheduleNum", scheduleNum);
		    params.put("schedule", schedule);
		    
			return schduleDAO.scheduleUpdate(params);
		}
		
		// 일정 삭제하기
		public boolean scheduleDelete(int schedule_num) throws Exception {
		System.out.println("scheduleservice.scheduleDelete() 함수가 호출되었습니다");
		    return schduleDAO.schduleDelete(schedule_num);
		}

		//일정 댓글 등록
		public int reply(ScheduleDTO schedule) throws Exception {
		System.out.println("일정 댓글 호출됨");

		int level = schedule.getLevel();
		schedule.setLevel(level + 1);

		int result = schduleDAO.reply(schedule);

		return result;
		
		}
		
		// 내일정 정보 불러오기
		public List<ScheduleDTO> getMyScheduleList(String member_id) {
			System.out.println("scheduleService.getMyScheduleList()");
			System.out.println("name = " + member_id);
			
			return schduleDAO.getMyScheduleList(member_id);
		}
}