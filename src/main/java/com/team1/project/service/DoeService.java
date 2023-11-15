package com.team1.project.service;

import javax.transaction.Transactional;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.team1.project.dto.DoeDTO;

@Service
public class DoeService {

	// 스케쥴러를 이용해서 도의 평균내기
	@Scheduled(fixedDelay = 60000)
	@Transactional
	public DoeDTO ScheduleAverageDoe(String  doe_name) {
		
		return null;
	}
}
