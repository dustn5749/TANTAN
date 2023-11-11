package com.team1.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.UsDTO;
import com.team1.project.dto.UsFileDTO;

@Mapper
public interface UsDAO {
	
	//동행 전체 목록
	public List<UsDTO> getUsList(UsDTO us) throws Exception;
	
	//동행 전체 게시글 증가
	public int totalCount(UsDTO us) throws Exception;

	// 동행 조회수증가
	public int viewCount(int usNum) throws Exception;
	
	//2. 메인에 TOP5 출력하기
    public List<UsDTO> usTop5() throws Exception;
		
    //동행 글쓰기
	public int writeInsert(UsDTO us) throws Exception;

	// 동행 상세보기
	public UsDTO usDetail(int us_num) throws Exception;

	// 동행 수정하기
	public boolean usUpdate(UsDTO us) throws Exception;

	// 동행 삭제하기
	public boolean usDelete(int usNum) throws Exception;

	//답글 폼
	public int reply(UsDTO us) throws Exception;

	// 최신 동행 모집글 
	public List<UsDTO> getUsRecentList();
	
	//관리자 동행 리스트
	public List<UsDTO> usList();
<<<<<<< HEAD

	//us_num의 번호 가져오기
	public int nextUsNum();

	//us에 fileno저장
	public void updateFile(UsFileDTO file);

=======
	
	//관리자 신고 리스트
	public List<UsDTO> usReportList();
	
	//관리자 동행글 삭제하기
	public boolean ausDelete(int us_num) throws Exception;
	
	//관리자 동행글 복구하기
	public boolean ausChange(int us_num) throws Exception;
>>>>>>> branch 'main' of https://github.com/dustn5749/TANTAN.git
}