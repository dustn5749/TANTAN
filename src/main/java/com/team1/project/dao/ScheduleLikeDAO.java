package com.team1.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.CityDTO;
import com.team1.project.dto.DayDTO;
import com.team1.project.dto.ScheduleDTO;
import com.team1.project.dto.UsDTO;

@Mapper
public interface ScheduleLikeDAO {
    //일정 글쓰기
	public int insert(Map<String, Object> param);
	
	public int delete(Map<String, Object> param);
}
