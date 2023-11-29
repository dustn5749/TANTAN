package com.team1.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.project.dto.UsCommentDTO;
import com.team1.project.service.UsCommentService;


@Controller
public class UsCommentController {
	
	@Autowired
	private UsCommentService uscommentService;

	 @RequestMapping("/comment/insertComment") 
	 @ResponseBody
	   public Map<String, Object> insertComment(@RequestBody UsCommentDTO comment) throws Exception {
		 System.out.println("댓글쓰기");
		 System.out.println("comment = " + comment);
	      Map<String, Object> result = new HashMap<>();
	      if(uscommentService.insertCommentUs(comment)) {
	          result.put("status", true);
	          result.put("message", "댓글이 등록되었습니다");
	          List<UsCommentDTO> commentList = uscommentService.getUsCommentList(comment.getUs_num());
	          System.out.println("commentList = " + commentList);
	          result.put("commentList", commentList);
	       } else {
	          result.put("status", false);
	          result.put("message", "댓글 작성 중 오류가 발생하였습니다");
	       }
	      
	      return result;
	   }
	}
	 
