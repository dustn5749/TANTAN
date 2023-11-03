package com.team1.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.project.dto.BoardDTO;

@Controller
@RequestMapping("/review")
public class ReviewController {

    // 리뷰 메인
    @RequestMapping(value = "/main")
    public String Main(BoardDTO board) throws Exception {
//    	try {
//			//model.addAttribute("result", boardService.boardPageList(board));
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return "reviewMain";
    }
    
    
    
}
