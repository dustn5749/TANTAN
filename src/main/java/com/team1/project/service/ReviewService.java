package com.team1.project.service;

import java.util.HashMap;
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
	
//	@Autowired
//	FileUpload fileUpload;

	
	//리뷰 목록 조회
    public Map<String, Object> getReviewList(ReviewDTO review) throws Exception {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("reviewList", reviewDAO.getReviewList(review)); // 리뷰 목록 조회
            result.put("review", review);
        } catch (Exception e) {
            result.put("message", "서버 오류 발생");
            e.printStackTrace();
        }
        System.out.println("reviewService: " + result);
        return result;
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

