package com.team1.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.DoeDAO;
import com.team1.project.dao.ReviewDAO;
import com.team1.project.dto.DoeDTO;
import com.team1.project.dto.ReviewDTO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private DoeDAO doeDAO;
    
    //도 선택에 따른 리뷰리스트 목록 조회
	public List<ReviewDTO> getReviewList(ReviewDTO review) throws Exception {
		System.out.println("reviewService.getReview()");
		List<ReviewDTO> reviewList = reviewDAO.getReviewList(review);
		System.out.println("reviewList = " + reviewList);
		return reviewList;
	}

	// 도 평균 내기
	public void averageDoe(int doeNum) {
		System.out.println("reviewService.averageDoe()");
		System.out.println("doeNum = " + doeNum);
		double average = reviewDAO.averageDoe(doeNum);
		System.out.println("average = " + average);
		
		DoeDTO doe = DoeDTO.builder().doe_num(doeNum).average(average).build();
		
		doeDAO.updateAverage(doe);
	}

	// 리뷰 추가하기
	public boolean insert(ReviewDTO review) {
		System.out.println("reviewService.insert()");
		System.out.println("review = " + review);
		return reviewDAO.insert(review) != 0;
	}
    
    
//    
//    //리뷰작성
//  	@Transactional
//  	public boolean reviewWrite(ReviewDTO review) {
//  		if(review.getFile() == null) {
//  			review.setReviewImg("");
//  		}
//  		
//  		else {
//  			if(!fileUpload.uploadReviewImg(review))
//  				return false;
//  		}
//  		review.reviewWrite(review);
//  		return true;
//  	}
//  	
//  	//리뷰수정
//  	@Transactional
//  	public boolean reviewModify(ReviewDTO review) {
//  		if(review.getFile() == null) {
//  			review.setReviewImg("");
//  		}
//  		
//  		else {
//  			if(!fileUpload.uploadReviewImg(review))
//  				return false;
//  		}
//  		review.reviewModify(review);
//  		return true;
//  	}


    
}

