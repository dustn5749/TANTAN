package com.team1.project.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class UsFileDTO {

	  private int usFileNum;
	  private int usNum;
	  private String memberId;
	  private Integer length;
	  private String uploadName;
	  private String realName;
	  private String fileType;
	  private Date regDate;
	  private List<UsDTO> us_num_list;
	}
