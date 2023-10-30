package com.team1.project.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {

	private String uid;		
	private String name;	
	private String pwd;		
	private String phone;	
	private String email;	
	private String address;	
	private int age;		
	private String gender;	
	
	public boolean isEqualPwd(MemberDTO member) {
		return pwd.equals(pwd);
	}
}
