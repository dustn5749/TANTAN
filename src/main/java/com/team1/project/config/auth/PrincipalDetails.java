package com.team1.project.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.team1.project.dto.MemberDTO;


public class PrincipalDetails implements UserDetails {

    private static final long serialVersionUID = -951226953749557253L;
	private MemberDTO user;

    public PrincipalDetails(MemberDTO user) {
        this.user = user;
    }

    public MemberDTO getUser() {
        return user;
    }

    @Override
    public String getPassword() {
        return user != null ? user.getPwd() : "";
    }

    @Override
    public String getUsername() {
        return user != null ? user.getEmail() : "";
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        user.getRoleList().forEach(r -> {
            authorities.add(() -> {
                return "ROLE_" + r;
            });
        });
        return authorities;
    }
}
