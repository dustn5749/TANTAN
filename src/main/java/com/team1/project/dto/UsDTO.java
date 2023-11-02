package com.team1.project.dto;
import java.util.Date;

import lombok.Data;

@Data
public class UsDTO {
    private int usNum;
    private String cityName;
    private String writer;
    private int usCount;
    private Date regDate;
    private Date startDate;
    private Date endDate;
    private String title;
    private String content; 

	private int level = 1;         // 게시글 레벨 (기본값 1)
	private int pageNo = 1;        // 현재 페이지 번호
	private int totalCount;        // 전체 게시글 건수
	private int totalPageSize;     // 전체 페이지 수
	private int pageLength = 10;   // 한 페이지의 길이
	
	private int navSize = 10;      // 페이지 하단에 출력되는 페이지의 항목 수
	private int navStart = 0;      // 페이지 하단에 출력되는 페이지 시작 번호
	private int navEnd = 0;        // 페이지 하단에 출력되는 페이지 끝 번호
	 

	private String [] ids;          // 아이디 배열 (미사용)
	
	
	public void getTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		// 2. 전체 페이지 건수를 계산한다
		totalPageSize = (int) Math.ceil((double) totalCount / pageLength);
		
		// 3. 페이지 네비게이터 시작 페이지를 계산한다
		navStart = ((pageNo - 1) / navSize) * navSize + 1;
		
		// 4. 페이지 네비게이터 끝 페이지를 계산한다
		navEnd = ((pageNo - 1) / navSize + 1) * navSize;
		
		// 5. 전체 페이지를 초과하면 전체 페이지 값을 변경한다
		if (navEnd >= totalPageSize) {
			navEnd = totalPageSize;
		}
	}
	
	public int getStartNo() {
		return (pageNo - 1) * pageLength + 1;  // 페이지의 시작 게시글 번호 계산
	}
	
	public int getEndNo() {
		return pageNo * pageLength;  // 페이지의 마지막 게시글 번호 계산
	}
	
	// 검색 필드
	private String searchTitle = "";  // 검색 제목 (미사용)
	
}

