package com.team1.project.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team1.project.dao.FileTokenDAO;
import com.team1.project.dto.FileTokenDTO;



@Service
public class FileTokenService {

	@Autowired
	private FileTokenDAO fileTokenDAO;

	@Transactional
	public String getToken() {
		final String token = UUID.randomUUID().toString(); 
		
		fileTokenDAO.insert(token);
		
		return token;
	}
	
	@Transactional
	public int updateUseStatus(String token) {
		FileTokenDTO fileTokenVO = new FileTokenDTO(token, 1);
		
		return fileTokenDAO.updateStatus(fileTokenVO);
	}

}