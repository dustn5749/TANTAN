package com.team1.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.project.dto.FileUploadDTO;
import com.team1.project.service.FileUploadService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FilePrintController {
	private final FileUploadService fileUploadService;

	@GetMapping("/files/{fileNo}")
	public void downloadFile(@PathVariable("fileNo") int fileNo, HttpServletResponse response) throws Exception{
		OutputStream out = response.getOutputStream();
		System.out.println("파일 출력하기  = " + fileNo);
		FileUploadDTO fileUploadVO = fileUploadService.findById(fileNo);
		
		if (fileUploadVO == null) {
			response.setStatus(404);
		} else {
			
			String originName = fileUploadVO.getOriginal_filename();
			originName = URLEncoder.encode(originName, "UTF-8");
			//다운로드 할 때 헤더 설정
			response.setHeader("Cache-Control", "no-cache");
			response.addHeader("Content-disposition", "attachment; fileName="+originName);
			response.setContentLength((int)fileUploadVO.getLength());
			response.setContentType(fileUploadVO.getContent_type());
			
			//파일을 바이너리로 바꿔서 담아 놓고 responseOutputStream에 담아서 보낸다.
			FileInputStream input = new FileInputStream(new File(fileUploadVO.getReal_filename()));
			
			//outputStream에 8k씩 전달
	        byte[] buffer = new byte[1024*8];
	        
	        while(true) {
	        	int count = input.read(buffer);
	        	if(count<0)break;
	        	out.write(buffer,0,count);
	        }
	        input.close();
	        out.close();
		}
	}	
}
