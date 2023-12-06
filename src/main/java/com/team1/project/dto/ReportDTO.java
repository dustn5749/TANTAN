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

public class ReportDTO {
	private int reportnum;
	public String member_id;
	private Date reportDate;
//	private String report_type;
	private int us_num;
	private int todayReport;
//	private String reporter;
	
}
