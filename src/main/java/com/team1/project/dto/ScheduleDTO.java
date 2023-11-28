package com.team1.project.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class ScheduleDTO {

		private int schedule_Num;
	    private String member_id;
	    private String doe_Name;
	    private String doe_Num;
	    private String city_name;
	    private Date start_Num;
	    private Date end_Date;
	    private Date reg_Date;

	    private Date day_date;
	    private Date mod_Date;
	    private String DELETEYN;
	    private String memo1;
	    private String memo2;
	    private String place1;
	    private String place2;
	    
	    private String doe_img;
	    private String place3;
	    private String memo3;
	    
	    private String date1;
	    private String date2;
	    private String date3;
	    
		private String imageUrl;
		
	    private double city_latitude;
	    private double city_longitude;
	    
	    private List<ScheduleDTO> scheduleList;
	    private String memoList;
	    private String area; 
	    private String Like_CNT;
	    private String title;
	    
	    private boolean isLike;		// 좋아요 여부
	    private String order;		// 정렬 순서

		private int level = 1;         // 게시글 레벨 (기본값 1)
		private int pageNo = 1;        // 현재 페이지 번호
		private int totalCount;        // 전체 게시글 건수
		private int totalPageSize;     // 전체 페이지 수
		private int pageLength = 12;   // 한 페이지의 길이
		
		private int navSize = 10;      // 페이지 하단에 출력되는 페이지의 항목 수
		private int navStart = 0;      // 페이지 하단에 출력되는 페이지 시작 번호
		private int navEnd = 0;        // 페이지 하단에 출력되는 페이지 끝 번호
		
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

	
	    public void setReg_Date(Date date) {
	        this.reg_Date = date;
	    }
	    
	}
