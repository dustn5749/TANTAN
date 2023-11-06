package com.team1.project.config.auth;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.team1.project.dao.MemberDao;
import com.team1.project.dto.MemberDTO;



@Service
public class PrincipalDetailsService implements UserDetailsService {

	@Autowired
	private MemberDao memberDAO;

	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		System.out.println("PrincipalDetailsService : 진입");
		System.out.println("username = " + member_id);
		MemberDTO member = memberDAO.findById(member_id);
		
		System.out.println("PrincipalDetailsService : member -> " + member);


		return new PrincipalDetails(member);
	}
}
