package com.team1.project.sns.profile;

import com.team1.project.sns.board.service.SnsBoardService;
import com.team1.project.sns.profile.service.SnsProfileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@RequiredArgsConstructor
@Controller
@Slf4j
public class SnsProfileController {

    private final SnsProfileService snsProfileService;
    private final SnsBoardService snsBoardService;

    //sns main페이지로 이동
    @GetMapping("/sns/profile")
    public String goMainPage(HttpServletRequest request) {
        log.info("{}" ,snsBoardService.getBoardList());
        request.setAttribute("boardList", snsBoardService.getBoardList());
        request.setAttribute("", "");
        return "snsProfile";
    }

    //sns 프로필 편집 페이지로 이동
    @GetMapping("/sns/profile/modify")
    public String goModifyPage() {
        return "snsProfileModify";
    }

}
