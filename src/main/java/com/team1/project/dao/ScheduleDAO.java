package com.team1.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.CityDTO;
import com.team1.project.dto.DayDTO;
import com.team1.project.dto.ScheduleDTO;
import com.team1.project.dto.UsDTO;

@Mapper
public interface ScheduleDAO {

	//일정 전체 목록
	public List<ScheduleDTO> getScheduleList(Map<String, Object> param) throws Exception;
	 
    //일정 글쓰기
	public int writeInsert(ScheduleDTO schdule) throws Exception;
	
	//일정 전체게시글
	public int totalCount(ScheduleDTO schdule) throws Exception;
	
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

			
	// 일정 수정하기
	public boolean scheduleUpdate(Map<String, Object> params) throws Exception;

	// 일정 삭제하기
	public boolean schduleDelete(int schedule_Num) throws Exception;
	
	
	//답글 폼
	public int reply(ScheduleDTO schdule) throws Exception;


	//크롤링 url
	 public int insertScheduleList(ScheduleDTO schduleDTO) throws Exception;	

	// 내 일정 정보 가져오기 
	public List<ScheduleDTO> getMyScheduleList(String member_id);

	//도 전체카운트
	public int doe_nametotalCount(ScheduleDTO schdule);

	
	// top3 스케쥴 목록 가져오기
	public List<ScheduleDTO> getTop3ScheduleList();

	// 좋아요 추가하기
	public void plusLikeCnt(Map<String, Object> param);

	// 좋아요 삭제하기
	public void minusLikeCnt(Map<String, Object> param);
	
	// 관리자 일일 작성된 일정 게시글 수
	public ScheduleDTO todaySchedule(ScheduleDTO schedule);
	
	// 좋아요 수 증가하기
	public void updateLikeCnt(int schedule_Num);
	
	// 좋아요 수 가져오기
	public int getLikeCount(int schedule_Num) ;
	
	
	

	//일정 위시리스트 가져오기
	public List<ScheduleDTO> getLikeScheduleList(Map<String, Object> param);

	// 위시리스트 총 갯수 세기
	public int LikeTotalCount(ScheduleDTO schedule);

	//글쓴이 얻기
	public String getWriter(int schedule_Num);
}
