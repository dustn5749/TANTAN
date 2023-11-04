package com.team1.project.dto;

<<<<<<< HEAD
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
=======
>>>>>>> branch 'main' of https://github.com/dustn5749/TANTAN.git
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
	
	//카카오 인증에 대한 필드
	private String oauth;
	private String roles;
	private String accountExpired;
	private String accountLocked;
	private int loginCnt;
	private LocalDateTime lastLoginTime;
	
	public boolean isEqualPwd(MemberDTO member) {
		return pwd.equals(pwd);
	}
<<<<<<< HEAD
	
	public List<String> getRoleList(){
			if(this.roles.length() > 0) {
				return Arrays.asList(this.roles.split(","));
			}
		return new ArrayList<>();
	}
}
=======
//	관리자
	public List<MemberDTO> memberList(){
		
		System.out.println("DTO.memberList -> " + memberList());
		
		return memberList();
	}
}
>>>>>>> branch 'main' of https://github.com/dustn5749/TANTAN.git
