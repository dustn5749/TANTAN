package com.team1.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.ScheduleDTO;
import com.team1.project.dto.UsDTO;

@Mapper
public interface ScheduleDAO {

	//동행 전체 목록
	public List<ScheduleDTO> getScheduleList(ScheduleDTO schdule) throws Exception;
	
	//동행 전체 게시글 증가
	public int totalCount(ScheduleDTO schdule) throws Exception;

	// 동행 조회수증가
	public int viewCount(int scheduleNum) throws Exception;
	
//	//2. 메인에 TOP5 출력하기
//    public List<UsDTO> usTop5() throws Exception;
//		
//    //동행 글쓰기
//	public boolean writeInsert(UsDTO us) throws Exception;
//
//	// 동행 상세보기
//	public UsDTO usDetail(Long us_num) throws Exception;
//
//	// 동행 수정하기
//	public boolean usUpdate(UsDTO us) throws Exception;
//
//	// 동행 삭제하기
//	public boolean usDelete(int usNum) throws Exception;
//
//	//답글 폼
//	public int reply(UsDTO us) throws Exception;
}
	

