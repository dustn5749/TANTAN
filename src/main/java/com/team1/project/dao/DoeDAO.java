package com.team1.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.DoeDTO;

@Mapper
public interface DoeDAO {

	
	//도의 별점 평균내기
	public List<DoeDTO> ScheduleAverageDoe(String  doe_name);
	
	// 도의 정보가져오기
	public DoeDTO getDoe(int doe_num);

	//도 평균 업데이트하기
	public void updateAverage(DoeDTO doe);

	// 도 이름으로 도 번호 찾기
	public int findDoeNum(String doe_name);
}
