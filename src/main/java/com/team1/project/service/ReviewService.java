package com.team1.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.ReviewDAO;
import com.team1.project.dto.ReviewDTO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
    
    //도 선택에 따른 리뷰리스트 목록 조회
	public List<ReviewDTO> getReview(ReviewDTO review) {
		System.out.println();
		return null;
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

