package com.team1.project.controller.alim;

import com.team1.project.dto.AlimDTO;
import com.team1.project.service.auth.AuthService;
import com.team1.project.entity.Alim;
import com.team1.project.entity.AlimContentEnum;
import com.team1.project.service.alim.AlimService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
public class AlimDataController {
    private final AlimService service;
    private final AuthService authService;

    @GetMapping("/alim/dummy")
    public void dummy(Authentication authentication){
        String memberId = authService.getMemberId(authentication);
        service.registerAlim(Alim.builder()
                        .url("/test")
                        .content(AlimContentEnum.LIKE)
                        .receiveMemberId("7800")
                        .sendMemberId(memberId)
                        .createTime(new Date())
                        .readYn("N")
                .build());
    }

    @GetMapping("/alim/count")
    public Long getCount(Authentication authentication){
        String memberId = authService.getMemberId(authentication);
        log.info("count : {}" , service.getCount(memberId));
        return service.getCount(memberId);
    }

    @GetMapping("/alim")
    public List<AlimDTO> getAlim(Authentication authentication){
        String memberId = authService.getMemberId(authentication);
        return service.getAlimListByReceiveMember(memberId);
    }

    @PutMapping("/alim/read")
    public void readAlimByMemberId(Authentication authentication){
        String memberId = authService.getMemberId(authentication);
        service.readAlimByMemberId(memberId);
    }

    @PutMapping("/alim/read/{alimId}")
    public void readAlimByAlimId(@PathVariable Long alimId, Authentication authentication){
        String memberId = authService.getMemberId(authentication);
        service.readAlimByAlimId(alimId);
    }


}
