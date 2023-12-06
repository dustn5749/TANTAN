package com.team1.project.controller.sns;

import com.team1.project.service.NCloudFileService;
import com.team1.project.service.sns.SnsBoardRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

import com.team1.project.service.auth.AuthService;
import java.util.UUID;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team1.project.dto.MemberDTO;
import com.team1.project.entity.SnsBoard;
import com.team1.project.service.sns.SnsBoardService;
import com.team1.project.service.sns.SnsLikeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

@RequiredArgsConstructor
@RestController
@Slf4j
public class SnsBoardController {

    private final SnsBoardService service;
    private final SnsLikeService likeService;
    private final AuthService authService;
    private final NCloudFileService nCloudFileService;

    @GetMapping("/boards")
    public List<SnsBoard> getList(
        @RequestParam SnsBoardRequest request
    ) {
        return service.getList(request);
    }
    @GetMapping("/boards/like/{id}")
    public boolean like(@PathVariable Long id,Authentication authentication) {
        String memberId = authService.getMemberId(authentication);
        return likeService.registerLike(id,memberId);
    }

    @PostMapping("/boards/upload")
    public void file(
        @RequestParam MultipartFile file,
        Authentication authentication
    ) throws IOException {
        String key = nCloudFileService.fileUpload(UUID.randomUUID().toString(), file);

        String memberId = authService.getMemberId(authentication);

        service.registerBoard(SnsBoard.builder()
            .title(key)
            .content(key)
            .deleteYn("N")
            .viewCount(0L)
            .memberId(memberId)
            .build(), key);

    }
}

