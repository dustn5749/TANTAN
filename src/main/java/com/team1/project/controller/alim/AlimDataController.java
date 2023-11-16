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
    
    // 테스트용 더미 알림을 등록하는 엔드포인트, authentication: 현재 로그인한 사용자의 인증 정보
    @GetMapping("/alim/dummy")
    public void dummy(Authentication authentication){
    	// 현재 로그인한 사용자의 아이디를 가져옴
        String memberId = authService.getMemberId(authentication);
        
        //더미 알림을 생성하여 등록
        service.registerAlim(Alim.builder()
                        .url("/test")
                        .content(AlimContentEnum.LIKE)
                        .receiveMemberId("7800")
                        .sendMemberId(memberId)
                        .createTime(new Date())
                        .readYn("N")
                .build());
    }
    // 현재 로그인한 사용자의 알림 개수를 조회
    @GetMapping("/alim/count")
    public Long getCount(Authentication authentication){
    	 // 현재 로그인한 사용자의 아이디를 가져옴
        String memberId = authService.getMemberId(authentication);
        log.info("count : {}" , service.getCount(memberId));
        return service.getCount(memberId);
    }
    // 현재 로그인한 사용자가 받은 알림 목록을 조회하는 엔드포인트
    @GetMapping("/alim")
    public List<AlimDTO> getAlim(Authentication authentication){
        String memberId = authService.getMemberId(authentication);
        return service.getAlimListByReceiveMember(memberId);
    }
    // 현재 로그인한 사용자가 받은 알림을 모두 읽은 상태로 처리하는 엔드포인트
    @PutMapping("/alim/read")
    public void readAlimByMemberId(Authentication authentication){
        String memberId = authService.getMemberId(authentication);
        service.readAlimByMemberId(memberId);
    }
    
    // 특정 알림을 읽은 상태로 처리하는 엔드포인트
    @PutMapping("/alim/read/{alimId}")
    public void readAlimByAlimId(@PathVariable Long alimId, Authentication authentication){
        String memberId = authService.getMemberId(authentication);
        service.readAlimByAlimId(alimId);
    }
    

}
