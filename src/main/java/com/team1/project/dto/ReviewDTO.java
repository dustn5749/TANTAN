package com.team1.project.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class ReviewDTO {
	private int reviewNum;
    private String doeName;
    private int doeNum;
    private String memberId;
    private int score;
    private String content;
    private Date regdate;
    private String deleteYn;
    
    
	private MultipartFile file;
    
	private int reviewCount;
	private int likesCount;
	
	private int score1; // 리뷰 1점
	private int score2; // 리뷰 2점
	private int score3; // 리뷰 3점
	private int score4; // 리뷰 4점
	private int score5; // 리뷰 5점	

}
