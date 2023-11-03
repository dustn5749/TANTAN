package com.team1.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.MemberDTO;

@Mapper
public interface MemberDao {

	// 로그인하기
	public MemberDTO login(MemberDTO member);
	
	public List<MemberDTO> memberList();
}
