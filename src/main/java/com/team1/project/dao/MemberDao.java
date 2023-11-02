package com.team1.project.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.MemberDTO;

@Mapper
public interface MemberDao {

	// 로그인하기
	public MemberDTO login(MemberDTO member);
	
}
