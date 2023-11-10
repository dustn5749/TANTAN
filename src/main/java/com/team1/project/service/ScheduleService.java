package com.team1.project.service;

import java.util.HashMap;
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
		public Map<String, Object> usPageList(ScheduleDTO schdule) throws Exception {
			Map<String, Object> result = new HashMap<>();
			try {
			result.put("scheduleList", schduleDAO.getScheduleList(schdule)); // 게시글 목록 조회
			result.put("schdule", schdule);
			} catch (Exception e) {
				result.put("message", "서버 오류 발생");
				e.printStackTrace();
			}
			System.out.println("schduleService: " + result);
			return result;
		}
		//일정 작성하기
		public boolean writeInsert(ScheduleDTO schedule) throws Exception {
		System.out.println("ScheduleDTO 일정 작성하기 =" + schedule);
		schduleDAO.writeInsert(schedule);
		schedule.getSchedule_Num();
//		for(int i =0;i<schedule.getMemoList().length;i++) {
		DayDTO in = DayDTO.builder()
							.schedule_Num(schedule.getSchedule_Num())
							.dayDate(schedule.getStart_Num())
							.place(schedule.getPlace())
							.memo(schedule.getMemoList())
							.build();
		schduleDAO.day(in);
//		}
		return true;
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
		
//		// 일정추가 
//		public Map<String, Object> day(ScheduleDTO schedule) {
//			Map<String, Object> result = new HashMap<>();
//			result.put("day", schduleDAO.day(schedule)); 
//			System.out.println(result);			
//			return result;
//		}
//		
//		
	
		
//	// 메인 top5
//	public List<ScheduleDTO> ScheduleTop5() throws Exception {
//		return ScheduleDAO.schduleTop5;
//	}

	
 //일정 상세보기
		public ScheduleDTO schduleDetail(int schedule_num) throws Exception {
			System.out.println("us.service.schedukeDetail() 함수가 호출되었습니다");
		    return schduleDAO.schduleDetail(schedule_num) ;		    
		}
	
		// 일정 수정하기
		public boolean scheduleUpdate(ScheduleDTO schedule) throws Exception {
		    System.out.println("schedule.service.usUpdate() 함수가 호출되었습니다");
			return schduleDAO.schduleUpdate(schedule);
		}
//		// 일정 삭제하기
//		public boolean usDelete(int usNum) throws Exception {
//		    System.out.println("us.service.usDelete() 함수가 호출되었습니다");
//		    return ScheduleDAO.usDelete(usNum);
//		}
//
//		//일저 댓글 등록
//		public int reply(UsDTO us) throws Exception {
//		System.out.println("동행 댓글 호출됨");
//
//		int level = us.getLevel();
//		us.setLevel(level + 1);
//
//		int result = ScheduleDAO.reply(us);
//
//		return result;
		
}
	