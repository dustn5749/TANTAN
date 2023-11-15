package com.team1.project.service;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.team1.project.dao.UsDAO;
import com.team1.project.dto.AccompanyList;
import com.team1.project.dto.Root;
import com.team1.project.dto.UsDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CrawlingService {

    private final UsDAO usDAO;
    
//    @Transactional
//    @Scheduled(fixedDelay = 300000)
    
    
    
    
    
    
    public void fileTokenAutoDelete() throws Exception {
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Root> response = restTemplate.getForEntity(
                "https://api.tripsoda.com/accompany/list?page=1&limit=2377", Root.class);
        Root root = response.getBody();
        
        if (root != null && root.getAccompanyList() != null) {
            List<UsDTO> list = new ArrayList<>();
            for (AccompanyList accompany : root.getAccompanyList()) {
                UsDTO usDTO = new UsDTO();
                usDTO.setTitle(accompany.getTitle());
                usDTO.setContent(accompany.getArea());
                usDTO.setWriter(accompany.getNickName());
                usDTO.setUs_cnt(accompany.getIsRecruit());
                usDTO.setRegdate(accompany.getCreatedAt());
                usDTO.setStart_Date(accompany.getStartAt());
                usDTO.setEnd_Date(accompany.getEndAt());
                usDTO.setImageUrl(accompany.getImageUrl());
           
                usDAO.insertUsList(usDTO);
                list.add(usDTO);
            }
            
            // List<UsDTO>를 List<AccompanyList>로 변환하여 전달
           // List<AccompanyList> accompanyList = convertToAccompanyList(list);
            System.out.println("UsDTO List: " + list);
            System.out.println("Data inserted into the database successfully.");
        }
    }

	/*
	 * private List<AccompanyList> convertToAccompanyList(List<UsDTO> usDTOList) {
	 * List<AccompanyList> accompanyList = new ArrayList<>(); for (UsDTO usDTO :
	 * usDTOList) { AccompanyList accompany = new AccompanyList();
	 * accompany.setTitle(usDTO.getTitle()); accompany.setArea(usDTO.getContent());
	 * accompany.setNickName(usDTO.getWriter());
	 * accompany.setIsRecruit(usDTO.getUs_cnt());
	 * accompany.setCreatedAt(usDTO.getRegdate());
	 * accompany.setStartAt(usDTO.getStart_Date());
	 * accompany.setEndAt(usDTO.getEnd_Date());
	 * accompany.setImageId(usDTO.getFileNo());
	 * 
	 * accompanyList.add(accompany); } return accompanyList; }
	 */
}
