package com.team1.project.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.UsCommentDTO;
import com.team1.project.dto.UsDTO;
import com.team1.project.dto.UsFileDTO;
import com.team1.project.service.MemberService;
import com.team1.project.service.UsCommentService;
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
	
	
	@Autowired
	private UsCommentService usCommentService;
	

	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";


	// 1. 동행 전체 목록 페이지
	@RequestMapping(value = "/list")
	public String list( UsDTO us, Model model) throws Exception {
		System.out.println("uscontroller.list()");
		System.out.println("order=" +us);

		System.out.println("us = " + us.getPageNo());
		model.addAttribute("result", usService.usPageList(us));
	return "usList"; 
	} 
	
	//글쓰기 페이징 이동
	@RequestMapping(value = "/write" ) 
	public String  writeUs(Model model)throws Exception {
    return "usWrite";
    }

	//글쓰기 작성
	@ResponseBody
	@RequestMapping(value = "/writeInsert" ) 
	public Map<String, Object>  writeInsert(MultipartHttpServletRequest request)throws Exception {
		UsDTO us = UsDTO.builder().writer(request.getParameter("writer"))
								.us_cnt(Integer.parseInt(request.getParameter("us_cnt")))
								.start_Date(request.getParameter("start_Date"))
								.end_Date(request.getParameter("end_Date"))
								.title(request.getParameter("title"))
								.content(request.getParameter("content"))
								.doe_Name(request.getParameter("doe_Name"))
								.build();
		System.out.println("us = " + us);
		
		Map<String,Object> map = new HashMap<>();
		Enumeration enu = request.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value= request.getParameter(name);
			map.put(name, value);
		}
		System.out.println("map = " + map.toString());
		us.setFile(fileProcess(request));
		
		
		Map<String, Object> result = new HashMap<>();
		boolean rs= usService.writeInsert(us);
		System.out.println("rs = " + rs);
		if (rs) {
    		result.put("message", "등록 성공했습니다!");
    		result.put("result",true);
        } else {
        	result.put("message", "등록 실패했습니다.");
        	result.put("result", false);
        }
    return result;
    }
	
	
	// 파일 첨부하기
		private List<UsFileDTO> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
			List<UsFileDTO> fileList = new ArrayList<>();
			Iterator<String> fileNames = multipartRequest.getFileNames();
			Calendar now = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("\\yyyy\\MM\\dd");
			
			while(fileNames.hasNext()){
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				String fileNameOrg = mFile.getOriginalFilename();
				String realFolder = sdf.format(now.getTime());
				
				File file = new File(CURR_IMAGE_REPO_PATH + realFolder);
				if (file.exists() == false) {
					file.mkdirs();
				}

				String fileNameReal = UUID.randomUUID().toString();
				
				
				mFile.transferTo(new File(file, fileNameReal)); 

				fileList.add(
						UsFileDTO.builder()
						.uploadName(fileNameOrg)
						.realName(realFolder + "\\" + fileNameReal)
						.length((int) mFile.getSize())
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
	      
	      usService.viewCount(usDetail.getUs_num());
	      
	      
	      model.addAttribute("writer", writer);
	      model.addAttribute("us", usDetail);
	      model.addAttribute("commentList", usCommentService.getUsCommentList(us_num));
	      model.addAttribute("commentLength", usCommentService.getLength(us_num));
	      
	    return "usDetail";
	    }
	
	
	@ResponseBody
	@RequestMapping(value = "/RealDetail", method = RequestMethod.POST)
	public UsDTO detail(@RequestParam("us_num") int us_num) throws Exception {                       
	    UsDTO us = usService.usDetail(us_num);
	    System.out.println("동행 상세보기 컨트롤러");
	    return us;
	}

//	 수정하기
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public Map<String, Object> update(@RequestBody UsDTO us) throws Exception {
		System.out.println("us = " + us);
		System.out.println("작성자 = " + us.getWriter());
	    boolean update = usService.usUpdate(us);
	    Map<String, Object> result = new HashMap<>();
	    if (update) {
	        result.put("message", "수정 성공했습니다!");
	        result.put("us_num", us.getUs_num());
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
		System.out.println("us= " + us);
	    Map<String, Object> result = new HashMap<>();
	    if (usService.usDelete(us.getUs_num())) {
	        result.put("message", "삭제가 완료했습니다!");
	    } else {
	        result.put("message", "삭제에 실패했습니다.");
	    }
	    return result;
	}

	//댓글 추가하기
	 @RequestMapping(value = "/insertComment", method = RequestMethod.POST) 
	 @ResponseBody
	   public Map<String, Object> insertComment(@RequestBody UsCommentDTO comment) throws Exception {
		 System.out.println("댓글쓰기");
		 
		 usService.commentplus(comment.getUs_num());
	      Map<String, Object> result = new HashMap<>();
	      if(usCommentService.insertCommentUs(comment)) {
	          result.put("status", true);
	          result.put("message", "댓글이 등록되었습니다");
	       
	       } else {
	          result.put("status", false);
	          result.put("message", "댓글 작성 중 오류가 발생하였습니다");
	       }
	      
	      return result;
	   }
	}


