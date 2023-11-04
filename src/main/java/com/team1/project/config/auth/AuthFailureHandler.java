package com.team1.project.config.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class AuthFailureHandler extends  SimpleUrlAuthenticationFailureHandler{
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
	    String msg = "로그인에 실패하였습니다";
	    
	    // exception 관련 메세지 처리
	    if (exception instanceof LockedException) {
        	msg = "계정이 잠겼습니다";
	    } else if (exception instanceof DisabledException) {
        	msg = "유효하지 않은 계정입니다";
        } else if(exception instanceof CredentialsExpiredException) {
        	msg = "패스워드 유효기간이 만료되었습니다";
        } else if(exception instanceof BadCredentialsException ) {
        	msg = "패스워드가 일치하지 않습니다";
        }
	    setDefaultFailureUrl("/member/loginForm.do?error=true&exception=" + msg);
	    
		super.onAuthenticationFailure(request, response, exception);
	}
}
