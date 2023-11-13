package com.team1.project.controller;


import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.UsDTO;
import com.team1.project.dto.UsFileDTO;
import com.team1.project.service.MemberService;
import com.team1.project.service.UsService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/us")
public class UsController {
	
	@Autowired
	private UsService usService;
	
	@Autowired
	private MemberService memberservice;
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";

	// 1. 동행 전체 목록 페이지
	@RequestMapping(value = "/list")
	public String list( UsDTO us, Model model) throws Exception {
		System.out.println("uscontroller.list()");

		System.out.println("us = " + us);
		model.addAttribute("result", usService.usPageList(us));
	return "usList"; //타일즈랑 리턴값이랑 동일해야함.
	} 
	
	//글쓰기 페이징 이동
	@RequestMapping(value = "/write" ) 
	public String  writeUs(Model model)throws Exception {
    return "usWrite";
    }

	//글쓰기 작성
	@ResponseBody
	@RequestMapping(value = "/writeInsert") 
	public Map<String, Object> writeInsert(
	    MultipartHttpServletRequest request,
	    @RequestParam String city_name,
	    @RequestParam String content,
	    @RequestParam Date start_Date,
	    @RequestParam Date end_Date,
	    @RequestParam int us_cnt,
	    @RequestParam String title,
	    @RequestParam String writer
	) throws Exception {
	    System.out.println("usController.writeInsert()");
	    Map<String, Object> map = new HashMap<>();        
	    Map<String, Object> result = new HashMap();
	    UsDTO us = UsDTO.builder()
	    		.writer(writer)
	    		.city_name(city_name)
	    		.content(content)
	    		.title(title)
	    		.start_Date(start_Date)
	    		.end_Date(end_Date)
	    		.us_cnt(us_cnt)
	    		.build();
	    System.out.println(us);
	    	
	    Enumeration enu=request.getParameterNames();
	    while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=request.getParameter(name);
			map.put(name,value);
		}
	    us.setFile(fileProcess(request));
	    
	    result.put("result", usService.writeInsert(us));
	    return result;
	}
	
	//파일 첨부하기
	private List<UsFileDTO> fileProcess(MultipartHttpServletRequest request) throws Exception{
		
		List<UsFileDTO> fileList = new ArrayList<>();
		Iterator<String> fileNames = request.getFileNames();
		Calendar now = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("\\yyyy\\MM\\dd");
		
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = request.getFile(fileName);
			String fileNameOrg = mFile.getOriginalFilename();
			String realFolder = sdf.format(now.getTime());
			
			File file = new File(CURR_IMAGE_REPO_PATH + realFolder);
			if (file.exists() == false) {
				file.mkdirs();
			}
			

			String fileNameReal = UUID.randomUUID().toString();
			/*
			 * File uploadedFile = new File(file, fileNameReal);
			 * mFile.transferTo(uploadedFile);
			
			 * // 썸네일 생성 String thumbnailFileNameReal = "thumb_" + fileNameReal; File
			 * thumbnailFile = new File(file, thumbnailFileNameReal);
			 */
			
			
			mFile.transferTo(new File(file, fileNameReal));

			fileList.add(
					UsFileDTO.builder()
					.uploadName(fileNameOrg)
					.realName(realFolder + "\\" + fileNameReal)
					.length((int)mFile.getSize())
					.fileType(mFile.getContentType())
					.build()
					);
		}
			return fileList;
	}	
	
	
	//글쓰기 상세보기 페이지 이동
	@RequestMapping(value = "/Detail" ) 
	public String detailUs(@RequestParam("us_num") int us_num, Model model) throws Exception {
		System.out.println("us = " + us_num);
		log.info("");
		UsDTO usDetail = usService.usDetail(us_num);
		System.out.println("usDetail = " + usDetail);
		MemberDTO writer = memberservice.findById(usDetail.getWriter());
		System.out.println("동행 상세보기 컨트롤러");
		model.addAttribute("writer", writer);
		model.addAttribute("us", usDetail);
    return "usDetail";
    }
	

//	 수정하기
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public Map<String, Object> update(@RequestBody UsDTO us) throws Exception {
	    boolean update = usService.usUpdate(us);
	    Map<String, Object> result = new HashMap<>();
	    if (update) {
	        result.put("message", "수정 성공했습니다!");
	    } else {
	        result.put("message", "수정 실패했습니다.");
	    }
	    result.put("us", update);

	    System.out.println("수정하기 확인 " + us);

	    return result;
	}
    // 동행 삭제하기
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Map<String, Object> delete(@RequestBody UsDTO us) throws Exception {
	    Map<String, Object> result = new HashMap<>();
	    if (usService.usDelete(us.getUs_num())) {
	        result.put("message", "삭제가 완료했습니다!");
	    } else {
	        result.put("message", "삭제에 실패했습니다.");
	    }
	    return result;
	}

	

 
//	 @PostMapping("/comments/add")
//	    public ResponseEntity<String> addComment(@RequestBody CommentData commentData) {
//	        String userId = commentData.getUserId();
//	        String content = commentData.getContent();
//
//	        if (userId != null && content != null) {
//	            Comment comment = new Comment(userId, content);
//
//	            try {
//	            	usService.saveComment(comment); 
//	                return ResponseEntity.ok("댓글이 성공적으로 추가되었습니다.");
//	            } catch (Exception e) {
//	                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("댓글 추가에 실패했습니다.");
//	            }
//	        } else {
//	            return ResponseEntity.badRequest().body("잘못된 요청입니다.");
//	        }
	
}

