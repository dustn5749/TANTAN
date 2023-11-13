
package com.team1.project.dto;

import lombok.*;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SnsBoardDTO {

    private Long boardNum;

    private String title; // 제목

    private String content; // 내용

    private String deleteYn; // 삭제 여부

    private String memberId; //회원 아이디

    private Long viewCount; //조회수

    private Long likeCount;
    private Long commentCount;

    private boolean liked;

    private String realName;


}