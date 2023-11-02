package com.team1.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.BoardDTO;

@Controller
@RequestMapping("/us")
public class UsController {
	
	// 1. 동행 전체 목록 페이지
	@RequestMapping(value = "/list")
	public String list(BoardDTO board, Model model) throws Exception {
		try {
//		model.addAttribute("result", usService.boardPageList(board));
        } catch (Exception e) {
            e.printStackTrace();
        }
		return "us/List";	
	} 
}
