package com.team1.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AccompanyList {
	
	private int id; 
	private String memberKey;
	private String imageId; 
	private int planId;
	private String title; 
	private String content; 
	private int maximum;
	private int views;
	private int msgCount;
	private String pullAt; 
	private String createdAt;
	private int isDel; 
	private String style_1;
	private String style_2;
	private int age;
	private String gender;
	private int duration; 
	private String startAt; 
	private String endAt;
	private String temp_1;
	private String temp_2;
	private int isMine;
	private String area;
	private String nickName; 
	private String profile;
	private String tendency; 
	private String style;
	private String imageUrl;  
	private int isEnd;
	private int commentCount; 
	private int recruitCount;
	private int isRecruit; 
}
