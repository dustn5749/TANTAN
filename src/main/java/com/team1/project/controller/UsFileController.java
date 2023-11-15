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

	
	// 이미지 출력
	@RequestMapping("/displayImage.do")
	public void displayImage(@RequestParam("usFileNum") int usFileNum, HttpServletResponse response) throws Exception {
	    System.out.println("displayImage().usFileNum = " + usFileNum);
	    OutputStream out = response.getOutputStream();
	    UsFileDTO usFile = usFileService.getUsFile(usFileNum);

	    if (usFile != null) {
	        System.out.println("usFile = " + usFile);

	        String filePath = CURR_IMAGE_REPO_PATH + usFile.getRealName();
	        File imageFile = new File(filePath);

	        try (FileInputStream input = new FileInputStream(imageFile)) {
	            byte[] buffer = new byte[1024 * 8];

	            while (true) {
	                int count = input.read(buffer);
	                if (count < 0) break;
	                out.write(buffer, 0, count);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            out.close();
	        }
	    }
	}
	
	         
	       
	    
	  
}
