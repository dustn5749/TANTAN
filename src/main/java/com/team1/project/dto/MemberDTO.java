package com.team1.project.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;

import java.util.List;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {

	private String member_id;		
	private String name;	
	private String pwd;		
	private String phone;	
	private String email;	
	private String address;	
	private int age;		
	private String gender;
	private String nickname;
	private String status;
	private int reportcnt;
	private int page;
    private int pageSize; // 페이지 크기
    private String register_time;
    private String month;
    private int signup_count;
//	private String introduce;
	
	//카카오 인증에 대한 필드
	private String oauth;
	private String roles;
	private String accountExpired;
	private String accountLocked;
	private int loginCnt;
	private Timestamp last_login_time;
	private String profile_img;

	
	public boolean isEqualPwd(MemberDTO member) {
		return pwd.equals(pwd);
	}
	
	public List<String> getRoleList() {
	    if (this.roles != null && !this.roles.isEmpty()) {
	        return Arrays.asList(this.roles.split(","));
	    }
	    return new ArrayList<>();
	}

//	관리자
	
//	전체 회원 가져오기.
//	public List<MemberDTO> memberList(){
//		
//		System.out.println("DTO.memberList -> " + memberList());
//		
//		return memberList();
//	}
////	관리자 계정 가져오기
//	public List<MemberDTO> adminList(){
//		
//		return adminList();
//	}
//	
	// 페이징
	   public String searchTitle;
	   public int level = 1;
	   public int pageNo = 1;
	   public int totalCount;
	   public int totalPageSize;
	   public int pageLength = 26;
	   
	   private int navSize = 10;
	   private int navStart = 0;
	   private int navEnd = 0;
	   
	   
	   public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
			
			// 2. 전체 페이지 건수를 계산한다
			totalPageSize = (int) Math.ceil((double) totalCount / pageLength);
			
			// 3. 페이지 네비게이터 시작 페이지를 계산한다
			navStart = ((pageNo - 1) / navSize) * navSize + 1;
			
			// 4. 페이지 네비게이터 끝 페이지를 계산한다
			navEnd = ((pageNo - 1) / navSize + 1) * navSize;
			
			// 5. 전체 페이지를 초과하면 전체 페이지 값을 변경한다
			if (navEnd >= totalPageSize) {
				navEnd = totalPageSize;
			}
		}
		
		public int getStartNo() {
			return (pageNo - 1) * pageLength + 1;  // 페이지의 시작 게시글 번호 계산
		}
		
		public int getEndNo() {
			return pageNo * pageLength;  // 페이지의 마지막 게시글 번호 계산
		}
	   
}
