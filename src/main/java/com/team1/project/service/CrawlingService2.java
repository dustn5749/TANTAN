//package com.team1.project.service;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Service;
//import org.springframework.web.client.RestTemplate;
//
//import com.team1.project.dao.ScheduleDAO;
//import com.team1.project.dto.PlanList;
//import com.team1.project.dto.Root;
//import com.team1.project.dto.ScheduleDTO;
//
//import lombok.RequiredArgsConstructor;
//
//public class CrawlingService2 {
//
//	
//	@Service
//	@RequiredArgsConstructor
//	public class CrawlingService {
//
//	    private final ScheduleDAO scheduleDAO;
//	    
////	    @Transactional
////	    @Scheduled(fixedDelay = 300000)
//
//	    public void fileTokenAutoDelete() throws Exception {
//	        RestTemplate restTemplate = new RestTemplate();
//	        ResponseEntity<Root> response = restTemplate.getForEntity(
//	                "https://api.tripsoda.com/plan/list?page=1&limit=1158&search=&areaId=", Root.class);
//	        Root root = response.getBody();
//	     
//	  
//	        if (root != null && root.getPlanList() != null) {
//	            List<ScheduleDAO> list = new ArrayList<>();
//	            
//	            for (PlanList plan : root.getPlanList()) {
//	            	
//	                ScheduleDTO scheduleDTO = new ScheduleDTO();
//	                scheduleDTO.setTitle(plan.getTitle());
//	                scheduleDTO.setDoe_Name(plan.getArea());
//	                scheduleDTO.setMember_id(plan.getMdDetailPlanId());
//	                scheduleDTO.setReg_Date(plan.getDays());
//	                scheduleDTO.setRegdate(plan.getCreatedAt());
//	                scheduleDTO.setStart_Date(plan.getStartAt());
//	                scheduleDTO.setEnd_Date(plan.getEndAt());
//	                scheduleDTO.setImageUrl(plan.getImageUrl());
//   
//	                scheduleDAO.insertScheduleList(scheduleDTO);
//	                list.add(scheduleDTO);
//	            }
//	        }
//	    }
//	}
//	
//	
//}
