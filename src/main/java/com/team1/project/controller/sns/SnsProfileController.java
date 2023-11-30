package com.team1.project.controller.sns;

import com.team1.project.dto.FriendDTO;
import com.team1.project.dto.FriendRequestDTO;
import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.SnsBoardDTO;
import com.team1.project.entity.FriendRequest;
import com.team1.project.service.MemberService;
import com.team1.project.service.NCloudFileService;
import com.team1.project.service.auth.AuthService;
import com.team1.project.service.friend.FriendService;
import com.team1.project.service.sns.SnsBoardRequest;
import com.team1.project.service.sns.SnsBoardService;
import com.team1.project.service.sns.SnsProfileService;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@RequiredArgsConstructor
@Controller
@Slf4j
public class SnsProfileController {

    private final SnsProfileService snsProfileService;
    private final SnsBoardService snsBoardService;
    private final FriendService friendService;

    private final AuthService authService;

    private final MemberService memberService;

    private final NCloudFileService nCloudFileService;

    //sns main페이지로 이동
    @GetMapping("/sns/profile")
    public String goMainPage(
        HttpServletRequest request,
        Authentication authentication,
        @RequestParam(required = false) Long detail
    ) {
        if(authentication == null || !authentication.isAuthenticated()){
            return "redirect:/member/loginForm.do";
        }

        String memberId = authService.getMemberId(authentication);
        MemberDTO byId = memberService.findById(memberId);

        List<FriendRequestDTO> requestList = friendService.getRequestDTOList(memberId);

        SnsBoardRequest snsBoardRequest = new SnsBoardRequest();
        snsBoardRequest.setSize(10L);
        snsBoardRequest.setMemberId(memberId);

        List<SnsBoardDTO> boardList = snsBoardService.getBoardList(snsBoardRequest);

        request.setAttribute("boardList", boardList);
        request.setAttribute("friendList", friendService.getFriendList(memberId));
        request.setAttribute("member", memberService.findById(memberId));

        if(!CollectionUtils.isEmpty(boardList)){
            SnsBoardDTO snsBoardDTO = boardList.get(boardList.size() - 1);
            request.setAttribute("lastId", snsBoardDTO.getBoardNum());
        }else {
            request.setAttribute("lastId", null);
        }

        request.setAttribute("detail",detail);

        return "snsProfile";
    }

    @GetMapping("/sns/profile/{memberId}")
    public String goProfilePage(HttpServletRequest request , @PathVariable String memberId , Authentication authentication) {

        if(authentication == null || !authentication.isAuthenticated())
            return "redirect:/member/loginForm.do";

        MemberDTO byId = memberService.findById(memberId);

        SnsBoardRequest snsBoardRequest = new SnsBoardRequest();
        snsBoardRequest.setSize(10L);
        snsBoardRequest.setMemberId(memberId);

        List<SnsBoardDTO> boardList = snsBoardService.getBoardList(snsBoardRequest);

        request.setAttribute("boardList", boardList);

        List<FriendRequestDTO> requestList = friendService.getRequestDTOList(memberId);
        List<FriendDTO> friendList = friendService.getFriendList(memberId);

        String loginMember = authService.getMemberId(authentication);
        request.setAttribute("friendList", friendList);
        request.setAttribute("friendReqList", requestList);
        request.setAttribute("alreadyReq", requestList.stream().anyMatch(v->v.getSendMemberId().equals(loginMember)));
        request.setAttribute("alreadyFriend", friendList.stream().anyMatch(v->v.getRegId().equals(loginMember)));
        request.setAttribute("member", byId);

        if(!CollectionUtils.isEmpty(boardList)){
            SnsBoardDTO snsBoardDTO = boardList.get(boardList.size() - 1);
            request.setAttribute("lastId", snsBoardDTO.getBoardNum());
        }else {
            request.setAttribute("lastId", null);
        }
        return "snsProfile";
    }


    //sns 프로필 편집 페이지로 이동
    @GetMapping("/sns/profile/modify")
    public String goModifyPage(Authentication authentication
    ,HttpServletRequest request

    ) {
        if(authentication == null || !authentication.isAuthenticated())
            return "redirect:/member/loginForm.do";
        String memberId = authService.getMemberId(authentication);
        MemberDTO byId = memberService.findById(memberId);

        request.setAttribute("member", byId);

        return "snsProfileModify";
    }

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
