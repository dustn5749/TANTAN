package com.team1.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.CityDTO;
import com.team1.project.dto.DayDTO;
import com.team1.project.dto.ScheduleDTO;

@Mapper
public interface ScheduleDAO {

	//일정 전체 목록
	public List<ScheduleDTO> getScheduleList(ScheduleDTO schdule) throws Exception;
	 
    //일정 글쓰기
	public int writeInsert(ScheduleDTO schdule) throws Exception;
	
	//일정 지역 번호 가져오기
	public List<ScheduleDTO> Doenum(ScheduleDTO doe_Num) throws Exception;

	// 도시 위도, 경도 가져오기
	public CityDTO selectCity(ScheduleDTO schedule);
	
	//day일정 추가
	public int day(DayDTO dayDTO) throws Exception;
	
	// 일정 상세보기
	List<ScheduleDTO> schduleDetail(int schedule_Num);

	// 일정 조회수증가
	public int viewCount(int scheduleNum) throws Exception;

	//2. 메인에 TOP5 출력하기
	//	public List<ScheduleDTO> schduleTop5() throws Exception;
			
	// 일정 수정하기
	public boolean schduleUpdate(ScheduleDTO schdule) throws Exception;

	// 일정 삭제하기
	public boolean schduleDelete(int schedule_Num) throws Exception;

	//답글 폼
	public int reply(ScheduleDTO schdule) throws Exception;
}