package com.team1.project.entity;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SnsBoard {
    private Long boardNum; //게시물 번호

    private String title; // 제목

    private String content; // 내용

    private String deleteYn; // 삭제 여부

    private String memberId; //회원 아이디

    private Long viewCount; //조회수

    private Long likeCount; //조회수
    private Long commentCount; //조회수
    
    private List<SnsBoardFile> files;

    private List<SnsBoardComment> comments;
}