package com.team1.project.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.UsCommentDTO;

@Mapper
public interface UsCommentDAO {
	
//게시판 댓글 쓰기
public boolean insertCommentUS(UsCommentDTO comment) throws Exception;

// 댓글 목록 가져오기
public List<UsCommentDTO> getUsCommentList(int us_num);

}
