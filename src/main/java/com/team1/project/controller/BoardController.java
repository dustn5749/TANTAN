//package com.team1.project.controller;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.team1.project.dto.BoardDTO;
//	
//@Controller
//@RequestMapping("/board")
//public class BoardController {
//
//	// 1. 게시판 전체 목록 페이지
//	@RequestMapping(value = "/list")
//	public String list(BoardDTO board, Model model) throws Exception {
//		System.out.println("보드컨트롤러");
//		try {
//			//model.addAttribute("result", boardService.boardPageList(board));
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//		return "board/List";	
//	} 
//
//
//    // 게시판 상세보기
//    @RequestMapping(value = "/detail")
//    public String detail(BoardDTO board) throws Exception {
////    	try {
////			//model.addAttribute("result", boardService.boardPageList(board));
////        } catch (Exception e) {
////            e.printStackTrace();
////        }
//        return "board/Detail";
//    }
//    
//    
//    // 게시판 상세보기
//    @RequestMapping(value = "/map")
//    public String map(BoardDTO board) throws Exception {
////    	try {
////			//model.addAttribute("result", boardService.boardPageList(board));
////        } catch (Exception e) {
////            e.printStackTrace();
////        }
//        return "board/map";
//    }
//    
//    @RequestMapping(value = "/cap")
//    public String cap(BoardDTO board) throws Exception {
//    return "cap";
//    }
//    
//    @RequestMapping(value = "/capDetail")
//    public String capDetail(BoardDTO board) throws Exception {
//    return "capDetail";
//    }
//        
//     @RequestMapping(value = "/list")
//     public String schedule(BoardDTO board) throws Exception {
//     return "schedule";
//     
//     }
//     
//    @RequestMapping(value = "/hang")
//    public String hang(BoardDTO board) throws Exception {
//    return "hang";
//            
////    // 게시판 수정    @ResponseBody
////    @RequestMapping(value = "/revice", method = RequestMethod.POST)
////    public Map<String, Object> revice(@RequestBody BoardDTO board) throws Exception {
////    	boolean revice = boardService.boardUpdate(board);
////    	//boardUpdate 수정하기
////    	Map<String, Object> result = new HashMap<>();
////    	if (revice) {
////    		result.put("message", "수정 성공했습니다!");
////        } else {
////        	result.put("message", "수정 실패했습니다.");
////        }
////    	result.put("board", revice);
////    	return result;
////    }
////    // 게시판 삭제하기
////    @ResponseBody
////    @RequestMapping(value = "/delete", method = RequestMethod.POST)
////    public Map<String, Object> delete(@RequestBody BoardDTO board) throws Exception {
////    	Map<String, Object> result = new HashMap<>();
////    	if (boardService.boardDelete(board.getBoardid())) {
////    		result.put("message", "삭제가 완료했습니다!");
////        } else {
////        	result.put("message", "삭제에 실패했습니다.");
////        }
////    	return result;
////    }
////	// 게시판 답글
////    @ResponseBody
////    @RequestMapping(value = "/reply", method = RequestMethod.POST)
////    public Map<String, Object> reply(@RequestBody BoardDTO board) throws Exception {
////        System.out.println("게시글 등록: " + board);
////        Map<String, Object> resultMap = new HashMap<>();
////        // 게시글 답변 등록
////        int result = boardService.reply(board);
////        // 게시글 답변 결과를 로그에 출력
////        System.out.println("답변 확인형" + result);
////        if (result > 0) {
////            resultMap.put("message", "답변 등록에 성공했습니다!");
////            String autoEmail = "audtjd1201@naver.com";
////            try {
//////                mailService.sendMail(autoEmail);
////            } catch (Exception e) {
////                e.printStackTrace();
////            }
////        } else {
////            resultMap.put("message", "답변 등록에 실패했습니다.");
////        }
////        return resultMap;
//    
//	
//		}
//	
//}