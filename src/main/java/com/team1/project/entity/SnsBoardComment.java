package com.team1.project.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

@Setter
@Getter
@ToString
@Entity(name = "sns_comment")
public class SnsBoardComment {
    @Id
    @Column(name = "comment_num", nullable = false)
    private Long commentNum; //댓글 번호

    private Long boardNum; 
    private Long memberId;
    private String content;
    private Date regDate;
    private Date modDate;
}
