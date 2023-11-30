//package com.team1.project.service;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.transaction.Transactional;
//
//import org.apache.commons.fileupload.FileUpload;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.team1.project.dao.ReviewDAO;
//import com.team1.project.dto.ReviewDTO;
//
//@Service
//public class ReviewService {
//	
//	@Autowired
//	private ReviewDAO reviewDAO;
//	
////	@Autowired
////	FileUpload fileUpload;
//
//	
//	//리뷰 목록 조회
//    public Map<String, Object> getReviewList(ReviewDTO review) throws Exception {
//        Map<String, Object> result = new HashMap<>();
//        try {
//            result.put("reviewList", reviewDAO.getReviewList(review)); // 리뷰 목록 조회
//            result.put("review", review);
//        } catch (Exception e) {
//            result.put("message", "서버 오류 발생");
//            e.printStackTrace();
//        }
//        System.out.println("reviewService: " + result);
//        return result;
//    }
////    
////    //리뷰작성
////  	@Transactional
////  	public boolean reviewWrite(ReviewDTO review) {
////  		if(review.getFile() == null) {
////  			review.setReviewImg("");
////  		}
////  		
////  		else {
////  			if(!fileUpload.uploadReviewImg(review))
////  				return false;
////  		}
////  		review.reviewWrite(review);
////  		return true;
////  	}
////  	
////  	//리뷰수정
////  	@Transactional
////  	public boolean reviewModify(ReviewDTO review) {
////  		if(review.getFile() == null) {
////  			review.setReviewImg("");
////  		}
////  		
////  		else {
////  			if(!fileUpload.uploadReviewImg(review))
////  				return false;
////  		}
////  		review.reviewModify(review);
////  		return true;
////  	}
package com.team1.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.io.FileSystemUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.team1.project.dao.DoeDAO;
import com.team1.project.dao.FileTokenDAO;
import com.team1.project.dao.FileUploadDAO;
import com.team1.project.dao.MemberDao;
import com.team1.project.dao.ReportDAO;
import com.team1.project.dao.ReviewDAO;
import com.team1.project.dao.UsDAO;
import com.team1.project.dto.DoeDTO;
import com.team1.project.dto.ReviewDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReportService {
	
    @Autowired
    private ReportDAO reportDao;

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private UsDAO usDao;
    
	// 메인에 리뷰 페이지 
	
    @Transactional
    public void report(String memberId, int usNum, String reportType, String reporter) {
        // 1. 글 작성자의 reportcnt 증가
        memberDao.increaseReportCount(memberId);

        // 2. 게시글의 reportcnt 증가
        usDao.increaseReportCount(usNum);

        // 3. report 테이블에 새로운 신고 기록 추가
        reportDao.addReport(memberId, usNum,  reportType, reporter);
    }
}

