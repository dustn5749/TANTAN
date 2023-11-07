package com.team1.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.ScheduleDAO;
import com.team1.project.dto.ScheduleDTO;


@Service
public class ScheduleService {

	@Autowired
	private ScheduleDAO schduleDAO;
	
	// 1. 일정 목록 조회
		public Map<String, Object> usPageList(ScheduleDTO schdule) throws Exception {
			// 1. 전체 건수를 얻기
			schdule.setTotalCount(schduleDAO.totalCount(schdule)); //여기서 전체 게시글 수를 불러와서 저장함.
			Map<String, Object> result = new HashMap<>();
			try {
			result.put("list", schduleDAO.getScheduleList(schdule)); // 게시글 목록 조회
				result.put("schdule", schdule);
			} catch (Exception e) {
				result.put("message", "서버 오류 발생");
				e.printStackTrace();
			}
			System.out.println("schduleService: " + result);
			return result;
		}

		// 내 일정 정보 얻기
		public List<ScheduleDTO> getMyScheduleList(String member_Id) {
			System.out.println("scheduleservice.getMyScheduleList()");
			System.out.println("member = " + member_Id);
			return schduleDAO.getMyScheduleList(member_Id);
		}
	
}
