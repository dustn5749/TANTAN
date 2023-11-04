package com.team1.project.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.team1.project.dao.MemberDao;
import com.team1.project.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	public MemberDao memberDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	// 일반 로그인하기
	public boolean login(MemberDTO member) {
		System.out.println("memberService.login(member)");
		MemberDTO loginmember = memberDao.login(member);
		boolean result = loginmember.getPwd().equals(member.getPwd());
		System.out.println("result = " + result);
		return result;
	}
	
	// 회원가입하기
	public void insertMember(MemberDTO member) throws Exception{
		System.out.println("memberService.insertMember(member)");
		try {

			if(member == null || Objects.isNull(member.getEmail())) {
				throw new Exception("아이디는 필수 정보입니다.");
			} else if(Objects.isNull(member.getOauth()) && Objects.isNull(member.getPwd())) {
				throw new Exception("비밀번호는 필수 정보입니다.");
			}
			
			MemberDTO existMember = memberDao.findByEmail(member.getEmail());
			if(existMember != null && !Objects.isNull(member.getEmail())) {
				throw new Exception(member.getEmail() +"계정이 존재합니다.");
			}
		
			if(Objects.isNull(member.getPwd())) {
				member.setPwd(passwordEncoder.encode(member.getPwd()));				
			}
			
//			System.out.println("member.pwd = " + member.getPwd());
			// 비밀번호 암호화 한다
			System.out.println("memberservice.id = " + member.getMember_id());
			memberDao.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
