package com.team1.project.controller.alim;


import com.team1.project.service.auth.AuthService;
import com.team1.project.service.alim.AlimService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequiredArgsConstructor
public class AlimPageController {
    private final AlimService service;
    private final AuthService authService;

    //알림 페이지 조회
    @GetMapping("/page/alim")
    public String getAlim(HttpServletRequest request, Authentication authentication){

        String memberId = authService.getMemberId(authentication);

        log.info("/page/alim/{}" , memberId);
        // 현재 로그인한 사용자가 받은 알림 목록을 알림 페이지에 전달
        request.setAttribute("alimList", service.getAlimListByReceiveMember(memberId));
        return "alim";
        
    }

}
