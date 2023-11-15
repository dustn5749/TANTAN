package com.team1.project.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FileUploadDTO {
	private int file_id;
	private String token;
	private String original_filename;
	private String real_filename;
	private String content_type;
	private long  length;
	private int inquiry_num;
	
	public static FileUploadDTO of(String token, String real_filename, MultipartFile file) {
		return FileUploadDTO.builder()
				.token(token)
				.original_filename(file.getOriginalFilename())
				.real_filename(real_filename)
				.content_type(file.getContentType())
				.length(file.getSize())
				.build();
	}
}
