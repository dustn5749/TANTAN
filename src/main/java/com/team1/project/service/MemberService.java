package com.team1.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.MemberDao;
import com.team1.project.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	public MemberDao memberDao;
	
	// 일반 로그인하기
	public boolean login(MemberDTO member) {
		System.out.println("memberService.login(member)");
		MemberDTO loginmember = memberDao.login(member);
		boolean result = loginmember.getPwd().equals(member.getPwd());
		System.out.println("result = " + result);
		return result;
	}
}