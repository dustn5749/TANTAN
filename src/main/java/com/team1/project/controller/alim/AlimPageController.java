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


    @GetMapping("/page/alim")
    public String getAlim(HttpServletRequest request, Authentication authentication){

        String memberId = authService.getMemberId(authentication);

        log.info("/page/alim/{}" , memberId);
        request.setAttribute("alimList", service.getAlimListByReceiveMember(memberId));
        return "alim";
    }

}
