package com.team1.project.utility.FileUpload;

import java.io.File;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import com.team1.project.dto.ReviewDTO;

public class FileUpload {
	public boolean uploadReviewImg(ReviewDTO reviewDto) {
		
	String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
	String uploadForder= Paths.get("C:", "delivery", "upload").toString();
	String imageUploadForder = Paths.get("reviewImg", today).toString();
	String uploadPath = Paths.get(uploadForder, imageUploadForder).toString();
	
	File dir = new File(uploadPath);
	if (dir.exists() == false) {
		dir.mkdirs();
	}
	
	
	UUID uuid = UUID.randomUUID();
	String reviewImgName = uuid+"_"+reviewDto.getFile().getOriginalFilename(); 

	
	try {
		File target = new File(uploadPath, reviewImgName);
		reviewDto.getFile().transferTo(target);

	} catch (Exception e) {
		return false;
	}
	
	
	//reviewDto.setReviewImg("upload\\"+imageUploadForder+"\\"+reviewImgName);
	
	
	return true;

	}
}