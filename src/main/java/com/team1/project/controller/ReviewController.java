package com.team1.project.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.ReviewDTO;

@Controller
@RequestMapping("/review")
public class ReviewController {

    // 리뷰 메인
    @RequestMapping(value = "/main")
    public String Main(ReviewDTO board) throws Exception {
        return "reviewMain";
    }
    
//	//리뷰 작성
//	@PostMapping("/write") 
//	public ResponseEntity<String> reviewWrite(ReviewDTO review){
//		
//		ReviewDTO.setUserId(review.memberId());
//		if(reviewService.reviewWrite(review))
//			return ResponseEntity.ok().body("리뷰 작성 완료");
//		
//		
//		return ResponseEntity.badRequest().body("파일 저장 실패");
//		
//	}
//	
//	//리뷰 수정
//	@PutMapping("/modify") 
//	public ResponseEntity<String> reviewModify(ReviewDTO review){
//		reviewDTO.setUserId(review.getmemberId());
//		if(reviewService.reviewModify(review))
//			return ResponseEntity.ok().body("리뷰 수정 완료");
//		
//		
//		return ResponseEntity.badRequest().body("파일 저장 실패");
		
//	}
    
}
