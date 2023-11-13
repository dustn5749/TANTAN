package com.team1.project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.project.dto.UsFileDTO;
import com.team1.project.service.UsFileService;

import net.coobird.thumbnailator.Thumbnails;

@RequestMapping("/file")
@Controller
public class UsFileController {

	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";

	@Autowired
	private UsFileService usFileService;

	
	   // 파일 출력하기 ( 썸네일 )
	   @RequestMapping("/displayImage.do")
	   public void displayImage(@RequestParam("usFileNum") int usFileNum, HttpServletResponse response) throws Exception {
	       System.out.println("displayImage().usFileNum = " + usFileNum);
		   OutputStream out = response.getOutputStream();
	       UsFileDTO usFile = usFileService.getUsFile(usFileNum);
	       
	       if (usFile != null) {
	    	   System.out.println("usFile = " + usFile);
	           String filePath = CURR_IMAGE_REPO_PATH + usFile.getRealName();
	           File images = new File(filePath);
	           String getFileName = usFile.getUploadName();
	           int lastIndex = getFileName.lastIndexOf(".");
			   String extension = getFileName.substring(lastIndex);
			   if(extension.contains("jpg") || extension.contains("png") || extension.contains("jpeg")) {
				   File thumbnail = new File(CURR_IMAGE_REPO_PATH + "/thumbnails");
				   System.out.println("file = " + thumbnail);
		           if (images.exists()) {
		        	   System.out.println("images = " +images.exists() );
		        	   thumbnail.getParentFile().mkdirs();
		               Thumbnails.of(images).forceSize(4500, 3000).outputFormat("png").toOutputStream(out);
		           }
			   }
	         
	       }
	       out.close();
	   }
}
