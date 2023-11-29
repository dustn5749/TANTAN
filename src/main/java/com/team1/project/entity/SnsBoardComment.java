package com.team1.project.entity;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class SnsBoardComment {
    private Long commentNum; //댓글 번호

    private Long boardNum; 
    private Long memberId;
    private String content;
    private Date regDate;
    private Date modDate;
}
