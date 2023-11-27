package com.team1.project.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.team1.project.dao.DoeDAO;
import com.team1.project.dto.DoeDTO;
import com.team1.project.dto.ReviewDTO;

@Service
public class DoeService {

	@Autowired
	public DoeDAO doeDAO;
	
	
	// 평점 순 리뷰리스트 
	@Scheduled(fixedDelay = 60000)
	public List<DoeDTO> getTopReviewList() {
		System.out.println("시간마다 파일 리뷰 평점 순위 데이터 가져오기");
		// 전체 도 평균 내기
		doeDAO.averageDoeTotal();
		List<DoeDTO> doeList = doeDAO.getTopReviewList();
		System.out.println("doeList = " + doeList);
		return doeList;
	}
    
	// 도의 정보가져오기
	public DoeDTO getDoe(int doe_num) {
		System.out.println("doeService.getDoe()");
		return doeDAO.getDoe(doe_num);
	}
	// 도 이름으로 도 번호 찾기
    public int findDoeNum(String doe_name) {
        System.out.println("doeServiec.findDoeNum");
        return doeDAO.findDoeNum(doe_name);
    }
    
    // 도 리뷰 이미지 가져오기
	public String getDoeImg(String doe_Name) {
		System.out.println("doeService.getDoeImg(doe_name) = " + doe_Name);
		String doe_img =  doeDAO.getDoeImg(doe_Name);
		System.out.println("doe_img = " + doe_img);
		return doe_img;
	}
    


}
