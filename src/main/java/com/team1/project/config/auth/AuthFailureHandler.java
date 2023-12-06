package com.team1.project.config.auth;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

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
        	msg = "locked";
	    } else if (exception instanceof DisabledException) {
        	msg = "none";
        } else if(exception instanceof CredentialsExpiredException) {
        	msg = "expiredPassword";
        } else if(exception instanceof BadCredentialsException ) {
        	msg = "wrongPassword";
        }
	    
	    msg = URLEncoder.encode(msg, StandardCharsets.UTF_8.toString());
	    setDefaultFailureUrl("/member/loginForm.do?error=true&exception=" + msg);
	    
		super.onAuthenticationFailure(request, response, exception);
	}
}
