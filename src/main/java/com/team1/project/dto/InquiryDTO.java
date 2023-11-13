package com.team1.project.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class InquiryDTO {
    public int inquiry_num;
    public int category_num;
    public String category;
    public String member_id;
    public String title;
    public String content;
    public Date regdate;
    public String answer_yn;
    
    // 페이징
    public String searchTitle;
    public int level = 1;
    public int pageNo = 1;
    public int totalCount;
    public int totalPageSize;
    public int pageLength = 15;
    
    private int navSize = 10;
    private int navStart = 0;
    private int navEnd = 0;
    
    
    public void setTotalCount(int totalCount) {
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
}
