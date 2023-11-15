package com.team1.project.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.team1.project.dao.FileTokenDAO;
import com.team1.project.dao.FileUploadDAO;
import com.team1.project.dto.FileTokenDTO;
import com.team1.project.dto.FileUploadDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FileSchedulerService {
	private final FileTokenDAO fileTokenDAO;
	private final FileUploadDAO fileUploadDAO;
	
	
	@Transactional
	@Scheduled(fixedDelay = 60000)
	public void fileTokenDelete() {
		System.out.println("업로드 안된 파일 삭제");
		List<FileTokenDTO> fileTokenList = fileTokenDAO.listToken();
		if(fileTokenList.size() != 0) {
			Map<String, Object> map = Map.of("list", fileTokenList);
			List<FileUploadDTO> fileUploadList = fileUploadDAO.deleteFileList(map);
			for(FileUploadDTO file : fileUploadList) {
				new File(file.getReal_filename()).delete();
			}
			fileUploadDAO.deleteTokenList(map);
			fileTokenDAO.deletes(map);
		}
	}
}
