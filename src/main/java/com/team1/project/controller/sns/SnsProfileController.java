package com.team1.project.controller.sns;

import com.team1.project.dto.MemberDTO;
import com.team1.project.service.MemberService;
import com.team1.project.service.auth.AuthService;
import com.team1.project.service.friend.FriendService;
import com.team1.project.service.sns.SnsBoardService;
import com.team1.project.service.sns.SnsProfileService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.PathVariable;

@RequiredArgsConstructor
@Controller
@Slf4j
public class SnsProfileController {

    private final SnsProfileService snsProfileService;
    private final SnsBoardService snsBoardService;
    private final FriendService friendService;

    private final AuthService authService;

    private final MemberService memberService;

    //sns main페이지로 이동
    @GetMapping("/sns/profile")
    public String goMainPage(HttpServletRequest request, Authentication authentication) {
        log.info("{}" ,snsBoardService.getBoardList());

        String memberId = authService.getMemberId(authentication);

        MemberDTO byId = memberService.findById(memberId);

        request.setAttribute("boardList", snsBoardService.getBoardList());
        request.setAttribute("friendList", friendService.getFriendList(memberId));
        request.setAttribute("member", byId);

        return "snsProfile";
    }

    @GetMapping("/sns/profile/{memberId}")
    public String goProfilePage(HttpServletRequest request , @PathVariable String memberId) {
        // log.info("{}" ,snsBoardService.getBoardList());

        MemberDTO byId = memberService.findById(memberId);


        request.setAttribute("boardList", snsBoardService.getBoardList());
        request.setAttribute("friendList", friendService.getFriendList(memberId));
        request.setAttribute("member", byId);
        return "snsProfile";
    }


    //sns 프로필 편집 페이지로 이동
    @GetMapping("/sns/profile/modify")
    public String goModifyPage() {
        return "snsProfileModify";
    }

}
