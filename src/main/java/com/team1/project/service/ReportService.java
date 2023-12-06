package com.team1.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.io.FileSystemUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.team1.project.dao.DoeDAO;
import com.team1.project.dao.FileTokenDAO;
import com.team1.project.dao.FileUploadDAO;
import com.team1.project.dao.MemberDao;
import com.team1.project.dao.ReportDAO;
import com.team1.project.dao.ReviewDAO;
import com.team1.project.dao.UsDAO;
import com.team1.project.dto.DoeDTO;
import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.ReportDTO;
import com.team1.project.dto.ReviewDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReportService {
	
    @Autowired
    private ReportDAO reportDao;

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private UsDAO usDao;
    
    @Autowired
    private ReportDAO reportDAO;
    
	// 메인에 리뷰 페이지 
	
    public void report(int us_num) {
    	System.out.println("reportService 접근");
        // 3. report 테이블에 새로운 신고 기록 추가
        reportDao.addReport(us_num);
    }
    
    public int todayReport(ReportDTO todayReport) {
    	int todayReportCount = reportDAO.todayReport(todayReport).getTodayReport();
    	todayReport.setTodayReport(todayReportCount);
    	return todayReportCount;
    }
}

