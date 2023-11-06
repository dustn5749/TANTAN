package com.team1.project.sns.board.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Setter
@Getter
@ToString
@Entity(name = "sns_file")
public class SnsBoardFile {
    @Id
    @Column(name = "file_num", nullable = false)
    private Long fileNum; //파일 번호

    private Long boardNum; //게시물 번호(파일이 속한 게시물의 번호) 
    private Long memberId; //회원아이디(업로드 한 회원 아이디)
    private String uploadName; // 업로드된 파일의 원본 이름
    private String realName; // 업로드된 파일의 저장 이름 (실제 파일 이름)
    private String fileType; // 파일 유형
    private Long orderNum; // 파일 순서 (게시물 내에서 파일의 순서)
}
