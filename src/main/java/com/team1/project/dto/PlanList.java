package com.team1.project.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class PlanList {
	
	private int id;
    private String memberKey;
    private String mdDetailPlanId;
    private String imageUrl;
    private String title;
    private String[] area;
    private String startAt;
    private String endAt;
    private int days;
    private int isPublic;
    private int isMine;
    private String createdAt;
    private String updatedAt;
    private String nickName;
    private String profile;
    private String information;
    private String tendency;
    private String gender;
    private int age;
    private String[] placeIdList;

}



