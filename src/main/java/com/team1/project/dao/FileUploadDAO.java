package com.team1.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team1.project.dto.FileUploadDTO;


@Mapper
@Repository
public interface FileUploadDAO {

	public void insert(FileUploadDTO fileUploadVO);
	
	
	public FileUploadDTO findById(int file_id);
	
	//게시물 완료 시 token관련 첨부 파일 목록을 얻는다  
	public List<FileUploadDTO> getFileUploadList(String token);
	
	//게시물 완료 시 이전에 편집 중 삭제한 목록을 삭제한다  
	public int deleteTemplateFile(Map<String, Object> map);
	
	//스케줄러에서 임시 파일 삭제를 위한 목록(파일 삭제을 목록)을 얻는다  
	public List<FileUploadDTO> deleteFileList(Map<String, Object> map);
	//스케줄러에서 임시 파일 삭제을 삭제한다  
	public int deleteTokenList(Map<String, Object> map);
	
	//토큰에 따른 파일 아이디 찾기
	public List<Integer> findByIdtoToken(String token);

	// 문의사항번호 추가하기
	public void updateInquiryNum(Map<String, Object> map);

	//문의사항 게시판에 따른 파일번호 가져오기
	public List<Integer> getFiles(int inquiry_num);
	
}

