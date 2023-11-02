package com.team1.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.UsDAO;
import com.team1.project.dto.UsDTO;

@Service
public class UsService {

	@Autowired(required=false)
	private UsDAO usDAO;
	
	// 1. 동행 목록 조회
	public Map<String, Object> boardPageList(UsDTO us) throws Exception {
		// 1. 전체 건수를 얻기
//		us.setTotalCount(usDAO.totalCount(us)); //여기서 전체 게시글 수를 불러와서 저장함.
		Map<String, Object> result = new HashMap<>();
		try {
//			result.put("list", usDAO.getUsList(us)); // 게시글 목록 조회
			result.put("board", us);
		} catch (Exception e) {
			result.put("message", "서버 오류 발생");
			e.printStackTrace();
		}
		return result;
	}
//	// 동행 등록
//	public boolean insertBoard(UsDTO us) throws Exception {
//		return usDAO.insertUs(us);
//	}
//	//동행 상세보기
//	public UsDTO getBoard(int usNum) throws Exception {
//		return usDAO.detailUs(usNum);
//	}
//	// 동행 수정하기
//	public boolean boardUpdate(UsDTO us) throws Exception {
//		return usDAO.usUpdate(us);
//	}
//	// 동행 삭제하기
//	public boolean boardDelete(int usNum) throws Exception {
//		System.out.println("board.service.getBoard() 함수 호출됨");
//		return usDAO.usDelete(usNum);
//	}
//	// 메인 top5
//	public List<UsDTO> boardTop5() throws Exception {
//		return usDAO.usTop5();
//	}
//	// 조회수 증가
//	public int viewCount(int usNum) throws Exception {
//		System.out.println("board.service.viewCount() 함수 호출됨");
//		return usDAO.ViewCount(usNum);
//	}
//	// 댓글 등록
//	public int reply(UsDTO us) throws Exception {
//		System.out.println("공지사항 댓글 호출됨");
//
//		int level = us.getLevel();
//		us.setPid(us.getBoardid());
//		us.setLevel(level + 1);
//
//		int result = usDAO.insertUsReply(us);
//
//		return result;

	}
	




