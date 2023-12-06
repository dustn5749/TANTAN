package com.team1.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.ReportDTO;
import com.team1.project.dto.ReviewDTO;

@Mapper
public interface ReportDAO {
    void addReport(@Param("us_num") int us_num);
    
    public ReportDTO todayReport(ReportDTO todayReport);
}
