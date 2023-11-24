package com.team1.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.ReviewDTO;

@Mapper
public interface ReviewDAO {

	//리뷰 전체 목록
	public List<ReviewDTO> getReviewList(ReviewDTO review) throws Exception;
	
	//검색기능
	public void reviewWrite(ReviewDTO review);
	
	//리뷰 수정
	public void reviewModify(ReviewDTO review);

	//도 평균내기
	public double averageDoe(int doeNum);
}
