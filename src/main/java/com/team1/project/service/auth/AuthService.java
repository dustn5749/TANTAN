package com.team1.project.service.auth;

import com.team1.project.config.auth.PrincipalDetails;
import lombok.Setter;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class AuthService {
    public String getMemberId(Authentication authentication){
        PrincipalDetails principal = (PrincipalDetails) authentication.getPrincipal();
        return principal.getUser().getMember_id();
    }
}
