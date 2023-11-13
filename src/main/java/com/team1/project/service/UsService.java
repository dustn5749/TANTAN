package com.team1.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.UsDAO;
import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.UsDTO;

@Service
public class UsService {

	@Autowired
	private UsDAO usDAO;
	
//	 1. 동행 목록 조회
	public Map<String, Object> usPageList(UsDTO us) throws Exception {
		// 1. 전체 건수를 얻기
		us.setTotalCount(usDAO.totalCount(us)); //여기서 전체 게시글 수를 불러와서 저장함.
		
		Map<String, Object> result = new HashMap<>();
		try {
		result.put("list", usDAO.getUsList(us)); // 게시글 목록 조회
		result.put("us", us);
		} catch (Exception e) {
			result.put("message", "서버 오류 발생");
			e.printStackTrace();
		}
		System.out.println("usService: " + result);
		return result;
	}

	
	
	// 메인 top5
	public List<UsDTO> usTop5() throws Exception {
		return usDAO.usTop5();
	}
	//동행 글쓰기
	public boolean writeInsert(UsDTO us) throws Exception {
		System.out.println("us =" + us);
	return usDAO.writeInsert(us);
	}
	
	// 동행 상세보기
	public UsDTO usDetail(int us_num) throws Exception {
	    System.out.println("us.service.usDetail() 함수가 호출되었습니다");
	    return usDAO.usDetail(us_num);
	}

	// 동행 수정하기
	public boolean usUpdate(UsDTO us) throws Exception {
	    System.out.println("us.service.usUpdate() 함수가 호출되었습니다");
		return usDAO.usUpdate(us);
	}
	// 동행 삭제하기
	public boolean usDelete(int usNum) throws Exception {
	    System.out.println("us.service.usDelete() 함수가 호출되었습니다");
	    return usDAO.usDelete(usNum);
	}

	//댓글 등록
	public int reply(UsDTO us) throws Exception {
	System.out.println("동행 댓글 호출됨");

	int level = us.getLevel();
	us.setLevel(level + 1);

	int result = usDAO.reply(us);

	return result;

}
	//최신 동행 리스트
	public List<UsDTO> getUsRecentList() {
		System.out.println("usService.getUsRecentList()");
		return usDAO.getUsRecentList();
	}

	// 관리자 리스트 가져오기
	public List<UsDTO> usList() throws Exception{
		
		System.out.println("service.memberList -> " + usDAO.usList());
		
		return usDAO.usList();
	}

	// 관리자 신고 리스트
	public List<UsDTO> usReportList() throws Exception{
		return usDAO.usReportList();
	}
	
	// 관리자 동행 게시글 삭제
	public boolean ausDelete(int us_num) throws Exception{
		
		return usDAO.ausDelete(us_num);
	}
	
	// 관리자 동행 게시글 복구
	public boolean ausChange(int us_num) throws Exception{
		
		return usDAO.ausChange(us_num);
	}
	
//// 조회수 증가
//public int viewCount(int usNum) throws Exception {
//System.out.println("us.service.viewCount() 함수 호출됨");
//return usDAO.viewCount(usNum);
}
