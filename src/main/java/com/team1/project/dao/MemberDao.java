package com.team1.project.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.MemberDTO;


@Mapper
public interface MemberDao {

	// 로그인하기
	public MemberDTO login(MemberDTO member);
	
	// 마지막 로그인 시간 변경
	public int updateMemberLastLogin(String email);
	
	// 로그인 수 초기화
	public void loginCountClear(String email);
	
	// 이메일로 회원찾기
	 public MemberDTO findByEmail(String email);
	 
	 //회원가입 (멤버 추가하기)
	 public void insertMember(MemberDTO member);
	 
	 // 로그인 카운트 수 증가
	 public void loginCountInc(MemberDTO member);
}
