package com.team1.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.UsCommentDAO;
import com.team1.project.dto.UsCommentDTO;

@Service
public class UsCommentService {
	
	@Autowired
	private UsCommentDAO uscommentDAO;

	public boolean insertCommentUs(UsCommentDTO comment) throws Exception {
		return uscommentDAO.insertCommentUS(comment);
		   }
	
	
}
