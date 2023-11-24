package com.team1.project.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DoeDTO {

	public int doe_num;
	public String doe_name;
	public String doe_img;
	public double average;
}
