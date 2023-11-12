package com.team1.project.controller.sns;

import java.util.List;

import com.team1.project.service.auth.AuthService;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.team1.project.dto.MemberDTO;
import com.team1.project.entity.SnsBoard;
import com.team1.project.service.sns.SnsBoardService;
import com.team1.project.service.sns.SnsLikeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@RestController
@Slf4j
public class SnsBoardController {

    private final SnsBoardService service;
    private final SnsLikeService likeService;
    private final AuthService authService;

    @GetMapping("/boards")
    public List<SnsBoard> getList() {
        return service.getList();
    }

    // title과 content를 뺄까 아니면 임의로만 집어넣고 화면에서 출력은 안되게 할 지 고민중이라서 일단 아무렇게나 적어서 집어 넣음
    @GetMapping("/boards/insert/dummny")
    public void dummy(MemberDTO ddd, Authentication authentication) {

        String memberId = authService.getMemberId(authentication);

        service.registerBoard(SnsBoard.builder()
                .title("ssssss111s")
                .content("sssssss11")
                .deleteYn("N")
                .viewCount(0L)
                .memberId(memberId)
                .build());        
    }
    
    @GetMapping("/boards/like/{id}")
    public void dummy(@PathVariable Long id,Authentication authentication) {
        String memberId = authService.getMemberId(authentication);
        likeService.registerLike(id,memberId);
    }

}

