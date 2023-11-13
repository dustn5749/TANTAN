package com.team1.project.entity;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@ToString
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "sns_board")
public class SnsBoard {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SNS_BOARD_SEQ_GEN")
    @SequenceGenerator(sequenceName = "SNS_BOARD_SEQ", allocationSize = 1, name = "SNS_BOARD_SEQ_GEN")
    @Column(name = "board_num")
    private Long boardNum; //게시물 번호

    private String title; // 제목

    private String content; // 내용

    private String deleteYn; // 삭제 여부

    private String memberId; //회원 아이디

    private Long viewCount; //조회수

    private Long likeCount; //조회수
    private Long commentCount; //조회수
    
    //JPA에서 1대다 매핑설정으로 게시물, 파일, 댓글 관계를 매핑하고 SQL쿼리 자동으로 생성하고 저장
    @OneToMany(mappedBy = "boardNum")
    private List<SnsBoardFile> files;

    @OneToMany(mappedBy = "boardNum")
    private List<SnsBoardComment> comments;
}