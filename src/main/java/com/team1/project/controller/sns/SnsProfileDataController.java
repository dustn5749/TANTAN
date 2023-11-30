package com.team1.project.controller.sns;

import com.team1.project.dto.SnsBoardDTO;
import com.team1.project.service.auth.AuthService;
import com.team1.project.service.sns.SnsBoardRequest;
import com.team1.project.service.sns.SnsBoardService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@Slf4j
public class SnsProfileDataController {

    private final SnsBoardService snsBoardService;
    private final AuthService authService;
    @GetMapping("/sns/data/profile")
    public List<SnsBoardDTO> dd(
        @RequestParam Long lastId,
        Authentication authentication,
        HttpServletRequest request
    ){

        String memberId = authService.getMemberId(authentication);
        SnsBoardRequest snsBoardRequest = new SnsBoardRequest();
        snsBoardRequest.setLastId(lastId);
        snsBoardRequest.setMemberId(memberId);

        return snsBoardService.getBoardList(snsBoardRequest);
    }


}
