
package com.team1.project.dto;



import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class UsDTO {
	
	private int us_num; // 객체의 고유 식별 번호입니다.
	private String city_name; // 객체와 연관된 도시의 이름입니다.
	private String content; // 객체와 관련된 상세한 내용이나 정보입니다.
	private Date start_Date; // 객체와 관련된 시간 범위의 시작 날짜입니다.
	private Date end_Date; // 객체와 관련된 시간 범위의 종료 날짜입니다.
	private String title; // 객체와 관련된 제목이나 헤드라인입니다.
	private int us_cnt; // 객체와 관련된 수치적 값 또는 카운트입니다.
	private Date regdate; // 객체의 등록 날짜입니다.
	private String writer; // 객체를 작성한 사람의 이름 또는 식별자입니다.
	private int reportcnt;
	private int fileNo; //첨부파일 번호
	private List<UsFileDTO> file;
	private String status; // 동행 게시글 상태

   //관리자 동행 목록 가져오기
   public List<UsDTO> usList() {
      return usList();
   }
   
   public List<UsDTO> usReportList() {
      return usReportList();
   }
   // 페이징
   public String searchTitle;
   public int level = 1;
   public int pageNo = 1;
   public int totalCount;
   public int totalPageSize;
   public int pageLength = 16;
   
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

