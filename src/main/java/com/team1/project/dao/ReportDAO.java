package com.team1.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.ReviewDTO;

@Mapper
public interface ReportDAO {
	void addReport(String memberId, int usNum, String reportType, String reporter);
}
