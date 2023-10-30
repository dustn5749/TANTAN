package com.team1.project.dto;


import lombok.Builder;

public class FileDTO {


    private Long id;                // 파일 번호 (PK)
    private Long postId;            // 게시글 번호 (FK)
    private String originalName;    // 원본 파일명
    private String saveName;        // 저장 파일명
    private long size;              // 파일 크기

    @Builder
    public FileDTO(String originalName, String saveName, long size) {
        this.originalName = originalName;
        this.saveName = saveName;
        this.size = size;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }
	
}
