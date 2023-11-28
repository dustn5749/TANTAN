package com.team1.project.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.team1.project.dao.ScheduleDAO;
import com.team1.project.dto.PlanList;
import com.team1.project.dto.Root;
import com.team1.project.dto.ScheduleDTO;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor

public class CrawlingService2 {

	
	    private final ScheduleDAO scheduleDAO;

//	    @Transactional
//	    @Scheduled(fixedDelay = 300000)
	    
	    public void fileTokenAutoDelete() throws Exception {
	        RestTemplate restTemplate = new RestTemplate();
	        ResponseEntity<Root> response = restTemplate.getForEntity(
	                "https://api.tripsoda.com/plan/list?page=1&limit=1158&search=&areaId=", Root.class);
	        Root root = response.getBody();

	        if (root != null && root.getPlanList() != null) {
	            List<ScheduleDAO> list = new ArrayList<>();
	          
	     

	            for (PlanList plan : root.getPlanList()) {
	                ScheduleDTO scheduleDTO = new ScheduleDTO();
	                scheduleDTO.setTitle(plan.getTitle());
	                scheduleDTO.setMember_id(plan.getNickName());

	                if (plan.getUpdatedAt() != null) {
	                    try {
	                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	                        String updatedAtString = plan.getUpdatedAt();
	                        if (updatedAtString != null && !updatedAtString.isEmpty()) {
	                            scheduleDTO.setReg_Date(new Date(dateFormat.parse(updatedAtString).getTime()));
	                        }
	                    } catch (ParseException e) {
	                        e.printStackTrace();
	                    }
	                }

	             

	                scheduleDTO.setImageUrl(plan.getImageUrl());
	                scheduleDAO.insertScheduleList(scheduleDTO);
	            }

	    }
	    }
}

