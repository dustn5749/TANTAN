package com.team1.project.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class UsFileDTO {

	  private int usFileNum;
	  private int usNum;
	  private String memberId;
	  private Integer length;
	  private String uploadName;
	  private String realName;
	  private String fileType;
	  private Date regDate;
	  private int fileNo;
	}
