package com.team1.project.controller.sns;

import com.team1.project.dto.MemberDTO;
import com.team1.project.service.MemberService;
import com.team1.project.service.NCloudFileService;
import com.team1.project.service.auth.AuthService;
import com.team1.project.service.friend.FriendService;
import com.team1.project.service.sns.SnsBoardRequest;
import com.team1.project.service.sns.SnsBoardService;
import com.team1.project.service.sns.SnsProfileService;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@RequiredArgsConstructor
@Controller
@Slf4j
public class SnsProfileDataController {

    private final SnsProfileService snsProfileService;
    private final SnsBoardService snsBoardService;
    private final FriendService friendService;

    private final AuthService authService;

    private final MemberService memberService;

    private final NCloudFileService nCloudFileService;

    //sns main페이지로 이동
    @PostMapping("/sns/profile")
    public String goMainPage(HttpServletRequest request,
        @RequestParam MultipartFile file,
        Authentication authentication) throws IOException {
        if(authentication == null || !authentication.isAuthenticated()){
            return "redirect:/member/loginForm.do";
        }
        String key = nCloudFileService.fileUpload(UUID.randomUUID().toString(), file);
        String memberId = authService.getMemberId(authentication);

        MemberDTO byId = memberService.findById(memberId);


        snsProfileService.updateProfileImg(memberId,key);

        return "snsProfile";
    }


}
