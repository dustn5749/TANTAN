package com.team1.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.context.annotation.Bean;

import com.team1.project.dto.UsDTO;



@Mapper
public class UsDAO {
	
	@Bean
	public List<UsDTO> getUsList(UsDTO us) throws Exception {
		return null;
	}

//	동행 글쓰기
//	public boolean insertUs(UsDTO us) throws Exception;
//
//	// 동행 상세보기
//	public UsDTO detailUs(int usNum) throws Exception;
//	
//	// 동행 수정하기
//	public boolean usUpdate(UsDTO us) throws Exception;
//	
//	// 동행 삭제하기
//	public boolean usDelete(int usNum) throws Exception;
//		
//	//2. 메인에 TOP5 출력하기
//	public List<UsDTO> usTop5() throws Exception;
//
//	//7.  조회수증가
//	public int viewCount(int usNum) throws Exception;
//		
//	//8. 체크박스된 게시글 삭제
//	public Map<String, Object> deleteBoards(UsDTO us) throws Exception;
//		
//	//3. [페이징]검색된 전체 건수 얻는다
//	public int totalCount(UsDTO us) throws Exception;
//	
//	//답글 폼
//	public int insertUsReply(UsDTO us) throws Exception;
}
