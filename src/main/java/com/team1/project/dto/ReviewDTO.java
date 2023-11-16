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
	private int review_num;
    private String doe_name;
    private int doe_num;
    private String member_id;
    private int score;
    private String content;
    private Date regdate;
    private String deleteYn;
    
    
	private MultipartFile file;
    
	private int reviewCount;
	private int likesCount;
	
	

}
