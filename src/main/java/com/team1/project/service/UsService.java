package com.team1.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.UsDAO;
import com.team1.project.dao.UsFileDAO;
import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.UsDTO;
import com.team1.project.dto.UsFileDTO;

@Service
public class UsService {

	@Autowired
	private UsDAO usDAO;
	
	@Autowired
	private UsFileDAO usfileDAO;
	
	// 1. 동행 목록 조회
	public Map<String, Object> usPageList(UsDTO us) throws Exception {
		int totalCount= usDAO.totalCount(us);
		
		us.setTotalCount(totalCount); 
	
		Map<String, Object> param = new HashMap<>();
		param.put("start_Date", us.getStart_Date());
		param.put("end_Date", us.getEnd_Date());		
		param.put("endNo", us.getEndNo());
		param.put("startNo", us.getStartNo());
		param.put("DOE_NAME", us.getDoe_Name());
		param.put("ORDER", us.getORDER());
		
		System.out.println("param: " + param);
		
		System.out.println("param:" + us.getDoe_Name() );
		
		Map<String, Object> result = new HashMap<>();
		try {
			result.put("list", usDAO.getUsList(param));
			result.put("us", us);
		} catch (Exception e) {
			result.put("message", "서버 오류 발생");
			e.printStackTrace();
		}
		//System.out.println("usService: " + result);
		return result;
	}

	// 메인 top5
	public List<UsDTO> usTop5() throws Exception {
		return usDAO.usTop5();
	}
	
	
	//동행 글쓰기
	public boolean writeInsert(UsDTO us) throws Exception {
		System.out.println("usService.writeInsert()");
		System.out.println("usService =" + us);
		boolean result = false;
		
		
		usDAO.insert(us);
		int usNum = usDAO.nextUsNum();
		System.out.println("usNum = " + usNum);
		
		
		for(UsFileDTO file : us.getFile()) {
			file.setUsNum(usNum);
			file.setMemberId(us.getWriter());
			System.out.println("file " + file);
			usfileDAO.add(file);
			int fileNo = usfileDAO.getFileNo(file.getUsNum());
			System.out.println("fileNo = " + fileNo);
			file.setUsFileNum(fileNo);
			usDAO.updateFile(file);
		}
		if(usNum > 0) {
			result = true;
		}

		
	return result;
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
	public List<UsDTO> usList2(UsDTO us) throws Exception{
		return usDAO.usList(us);
	}

	public Map<String,Object> usList(UsDTO us){
		Map<String,Object> map = new HashMap<>();
		map.put("usList", usDAO.usList(us));
		return map;
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
	
	// 관리자 월별 작성된 동행 리스트
	public List<UsDTO> monthUs() {
		return usDAO.monthUs();
	}

// 조회수 증가
public int viewCount(int us_num ) throws Exception {
		System.out.println("us.service.viewCount() 함수 호출됨");
		return usDAO.viewCount(us_num);
			}

	public void commentplus(int us_num) {
		System.out.println("uscomment 댓글 ");
		usDAO.commentplus(us_num);
	
	}



	
	// 관리자 일일 작성된 동행 게시글 수
	public int todayWrite(UsDTO us) {
		int todayWriteCount = usDAO.todayWrite(us).getTodayWrite();
		
		return todayWriteCount;
	}
	
	public int getTotalSize(UsDTO us) throws Exception {
		return usDAO.totalCount(us);
	}
	
	public int totalPosts(UsDTO us) {
		return usDAO.totalPosts(us);
	}
	
	public int reportCnt(int us_num) {
		return usDAO.increaseReportCount(us_num);
	}
//// 조회수 증가
//public int viewCount(int usNum) throws Exception {
//System.out.println("us.service.viewCount() 함수 호출됨");
//return usDAO.viewCount(usNum);
}
