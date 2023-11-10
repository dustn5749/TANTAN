package com.team1.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.UsDTO;
import com.team1.project.dto.UsFileDTO;

@Mapper
public interface UsFileDAO {
    // 첨부파일 추가하기
    int add(UsFileDTO file) throws Exception;

    // 첨부파일 정보
    UsFileDTO getUsFile(int usFileNum) throws Exception;

    // 게시판에 따른 첨부파일 리스트 얻기
    List<UsFileDTO> getUsFiles(int usNum) throws Exception;

    // 첨부파일 삭제하기
    boolean delete(int usNum) throws Exception;

    // 첨부파일 삭제하기 (여러개, 게시판에 따른 삭제)
    boolean deletes(int[] deleteNumList) throws Exception;


}
