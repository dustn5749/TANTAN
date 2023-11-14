package com.team1.project.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum AlimContentEnum {

    LIKE("님이 회원님의 게시물을 좋아합니다."),
    FRIEND_REQ("님이 회원님에게 친구요청 했습니다."),

    ;


    private final String template;


}
