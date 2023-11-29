package com.team1.project.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team1.project.dao.CustomerDAO;
import com.team1.project.dto.InquiryDTO;
import com.team1.project.service.CustomerService;
import com.team1.project.service.FileTokenService;
import com.team1.project.service.FileUploadService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class CKEditorController {
	private final FileTokenService fileTokenService;
	private final FileUploadService fileUploadService;
	
	@Autowired
	public CustomerService customerService;

	
	@PostMapping(value = "/imageUpload")
	@ResponseBody
	public Map<String, Object> image(MultipartHttpServletRequest request) throws Exception {
    
		// ckeditor는 이미지 업로드 후 이미지 표시하기 위해 uploaded 와 url을 json 형식으로 받아야 함
		// ckeditor 에서 파일을 보낼 때 upload : [파일] 형식으로 해서 넘어옴, upload라는 키 이용하여 파일을 저장 한다
		MultipartFile file = request.getFile("upload");
		String token = request.getParameter("token");
		
		System.out.println("token = " + token);

		//이미지 첨부 파일을 저장한다 
		int file_id = fileUploadService.fileUploadProcess(token, file);
		System.out.println("ckeditor.file_id = " + file_id);

		// 이미지를 현재 경로와 연관된 파일에 저장하기 위해 현재 경로를 알아냄
		String uploadPath = request.getServletContext().getContextPath() + "/files/" + file_id;
		System.out.println("uploadPath = " + uploadPath);
		Map<String, Object> result = new HashMap<>();
		result.put("uploaded", true); // 업로드 완료
		result.put("url", uploadPath); // 업로드 파일의 경로

		return result;
	}
	// TODO : 추후 작업을 해야  하는 것은 아래 설명 함 
	// 만약 게시글 작성 중 서버에 이미지를 업로드한 후 작성중인 게시글을 저장하지 않고 취소 하고 나가는 경우 업로드한 이미지가 존재하게 된다 
	// 이런 경우 발생하면 서버에 의미 없어 업로드된 이미지가 존재하게 된다  
	// token 값은 시작시 발급 받고 
	// 이미지 저장 시 token 값도 같이 이미지 저장시 사용한다.
	// 최종으로 작업이 완료될 때 token을 이용 마무리 작업을 처리한다 
	// 만약 마지막 작업이 완료 되지 않은 경우 스토리지 서버에 저장된 파일을 삭제 할 수 있게 구현 해야 한다(현재는 사용하지 않음)
	
	
	@PostMapping(value = "/ckeditorWrite")
	@ResponseBody
	public Map<String, Object> ckeditorWrite(@RequestBody Map<String, Object> param) throws Exception {
		
		System.out.println(param);
			String token = (String)param.get("token");
			String memberId = (String) param.get("member_id");
		    String title = (String) param.get("title");
		    String content = (String) param.get("content");
		    int categoryNum = Integer.parseInt((String.valueOf(param.get("category_num"))));

		    InquiryDTO inquiry = new InquiryDTO();
		    inquiry.setMember_id(memberId);
		    inquiry.setTitle(title);
		    inquiry.setContent(content);
		    inquiry.setCategory_num(categoryNum);
		    
		                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
		    
		fileUploadService.updateUseStatus(param);
		
		List<Integer> file_ids = fileUploadService.findByIdtoToken(token);
		inquiry.setFile_id(file_ids);
		System.out.println("inquiry = " + inquiry);
		
		Map<String, Object> result = new HashMap<>();
		customerService.insert(inquiry);
		int insertResult = customerService.getInsertInquiry();
		System.out.println("insertResultm = " + insertResult);
		if(insertResult != 0) {
			result.put("result", true); // 업로드 완료
			for(Integer file :file_ids) {
				fileUploadService.updateInquiryNum(file, insertResult);				
			}
			
		} else {
			
			result.put("result", false); 
		}
		

		return result;
	}
	
	
}
