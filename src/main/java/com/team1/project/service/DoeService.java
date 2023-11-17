package com.team1.project.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.team1.project.dao.DoeDAO;
import com.team1.project.dto.DoeDTO;

@Service
public class DoeService {

	@Autowired
	public DoeDAO doeDAO;
	
	

	
	// 스케쥴러를 이용해서 도의 평균내기
	@Scheduled(fixedDelay = 60000)
	@Transactional
	public DoeDTO ScheduleAverageDoe(String  doe_name) {
		
		return doeDAO.ScheduleAverageDoe(doe_name);
	}
	
	// 도의 정보가져오기
	public DoeDTO getDoe(int doe_num) {
		System.out.println("doeService.getDoe()");
		return doeDAO.getDoe(doe_num);
	}
}
