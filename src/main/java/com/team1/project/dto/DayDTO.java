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
public class DayDTO {
	   private int dayId;
	   private int schedule_Num;
	   private Date dayDate;
	   private String place;
	   private String memo;
}
