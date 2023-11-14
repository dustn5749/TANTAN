package com.team1.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team1.project.dto.InquiryDTO;

@Mapper
public interface InquiryDAO {

   // 문의 목록 가져오기
   public List<InquiryDTO> getInquiryList(InquiryDTO inquiry);

   // 전체 문의 갯수 가져오기
   public int getTotalCount(InquiryDTO inquiry);

}