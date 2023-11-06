package com.team1.project.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class UsCommentDTO {
	private int commentid;
	private int us_num;
	private String content;
	private String writer;
	private Date regdate;
}