package com.team1.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team1.project.dto.FileTokenDTO;


@Mapper
@Repository
public interface FileTokenDAO {

	public int insert(String token);
	public int updateStatus(FileTokenDTO fileTokenVO);
	public List<FileTokenDTO> listToken();
	public int deletes(Map<String, Object> map);
	public void deleteByToken(String token);
	
}

