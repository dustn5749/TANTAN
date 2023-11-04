package com.team1.project.config.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.team1.project.dao.MemberDao;

@Component
public class AuthSuccessHandler extends SimpleUrlAuthenticationSuccessHandler { 
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
    public void onAuthenticationSuccess(
    		HttpServletRequest request
    		, HttpServletResponse response
    		, Authentication authentication //로그인한 사용자 정보가 있는 객체 
    		) throws IOException, ServletException {
        System.out.println("로그인에 성공했습니다.");
		memberDao.updateMemberLastLogin(authentication.getName());
		memberDao.loginCountClear(authentication.getName());
		
		System.out.println("authentication ->" + authentication);
		
        setDefaultTargetUrl("/");
        
        super.onAuthenticationSuccess(request, response, authentication);
    }

}
