package com.team1.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.MemberDTO;

import oracle.security.crypto.core.ECC;


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
	 
	 //아이디로 회원찾기
	 public MemberDTO findById(String member_id);
	 
	 //회원가입 (멤버 추가하기)
	 public void insertMember(MemberDTO member);
	 
	 // 로그인 카운트 수 증가
	 public void loginCountInc(MemberDTO member);
	 
	 // 기존 회원인지 체크하기
	 public int checkMember(MemberDTO member);
	
	 //회원리스트 가져오기
	 public List<MemberDTO> memberList(MemberDTO member);
	
	//비밀번호 암호화하기
	public void encodingPwd(MemberDTO member); 
	
	// 관리자리스트 가져오기
	public List<MemberDTO> adminList();

	// 회원 정보 수정하기
	public boolean modify(MemberDTO member); 
	
	// 관리자 회원 정지
	public boolean memberStop(String member_id);
	
	// 관리자 회원 정지 해제
	public boolean memberRelease(String member_id);
	
	// 관리자 월별 가입자 현황 리스트
	public List<MemberDTO> monthMember();
	
	public int totalMembers(MemberDTO member);
	
	public int getTotalCount(MemberDTO member);
	
	public MemberDTO todayRegister(MemberDTO member);
	
	public void increaseReportCount(String member_id);
}
