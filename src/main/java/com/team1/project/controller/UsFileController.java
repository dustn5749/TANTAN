package com.team1.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.UsFileDTO;
import com.team1.project.service.UsFileService;

import net.coobird.thumbnailator.Thumbnails;

@RequestMapping("/file")
@Controller
public class UsFileController {

	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";

	@Autowired
	private UsFileService usFileService;
	
	// 파일 다운로드
	@RequestMapping("/download.do")
	public void download(UsFileDTO file,
							HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		System.out.println("fileController.download()");
		UsFileDTO attacheFile = usFileService.getUsFile(file.getFileNo());
		if(attacheFile != null) {
			String filePath = CURR_IMAGE_REPO_PATH  + attacheFile.getFileNo();
			System.out.println("attachFile = " + attacheFile);
			System.out.println("filePath = " + filePath);
			File images = new File(filePath);
			
			response.setHeader("Cache-Control", "no-cache");
			response.addHeader("Content-disposition", "attachment; fileName=" + URLEncoder.encode(attacheFile.getUploadName(), "UTF-8") );
			response.setContentType("application/octet-stream");
			response.setContentLength(attacheFile.getLength());
			
			FileInputStream in = new FileInputStream(images);
			
			byte[] buffer = new byte[1024*8];
			while(true) {
				int count = in.read(buffer);
				if(count == -1) {
					break;
				}
				out.write(buffer, 0, count);
			}
			in.close();
		}
		out.close();
		System.out.println("download()");
	}
	
	   // 파일 출력하기 ( 썸네일 )
	   @RequestMapping("/displayImage.do")
	   public void displayImage(UsFileDTO file, HttpServletResponse response) throws Exception {
	       OutputStream out = response.getOutputStream();
	       UsFileDTO usFile = usFileService.getUsFile(file.getFileNo());
	       if (usFile != null) {
	           String filePath = CURR_IMAGE_REPO_PATH + usFile.getFileNo();
	           File images = new File(filePath);
	           String getFileName = usFile.getUploadName();
	           int lastIndex = getFileName.lastIndexOf(".");
			   String extension = getFileName.substring(lastIndex);
			   if(extension.contains("jpg") || extension.contains("png") || extension.contains("jepg")) {
				   File thumbnail = new File(CURR_IMAGE_REPO_PATH + "\\" +"thumbnail"+ "\\" + getFileName + extension);
		           if (images.exists()) {
		        	   thumbnail.getParentFile().mkdirs();
		               Thumbnails.of(images).forceSize(500, 500).outputFormat("png").toOutputStream(out);
		           }
			   }
	         
	       }
	       out.close();
	   }
	
}
