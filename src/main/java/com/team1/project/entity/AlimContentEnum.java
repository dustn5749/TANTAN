package com.team1.project.entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum AlimContentEnum {

    LIKE("님이 회원님의 게시물을 좋아합니다."),
    FOLLOW("님이 회원님을 팔로우 합니다."),


    ;


    private final String template;


}
