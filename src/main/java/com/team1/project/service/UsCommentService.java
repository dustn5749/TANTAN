package com.team1.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.UsCommentDAO;
import com.team1.project.dto.UsCommentDTO;

@Service
public class UsCommentService {
	
	@Autowired
	private UsCommentDAO uscommentDAO;

	// 댓글 등록하기
	public boolean insertCommentUs(UsCommentDTO comment) throws Exception {
		System.out.println("UsCommentService.insertComment()");
		return uscommentDAO.insertCommentUS(comment);
		   }
	
	// 댓글 목록 가져오기
	public List<UsCommentDTO> getUsCommentList(int us_num) {
		System.out.println("getUsCommnetList.us_num = " + us_num);
		
		return uscommentDAO.getUsCommentList(us_num);
	}
	
	
	// 댓글 수 세기
	public int getLength(int us_num){
		System.out.println("commentService.getLenght()");
		return uscommentDAO.getLength(us_num);
	}
	
}
