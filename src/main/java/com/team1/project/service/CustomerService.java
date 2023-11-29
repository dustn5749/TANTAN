package com.team1.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.CustomerDAO;
import com.team1.project.dto.InquiryDTO;

@Service
public class CustomerService {
	
	@Autowired
	public CustomerDAO customerDAO;

	// 고객센터 목록 가져오기
	public Map<String, Object> getInquiryList(InquiryDTO inquiry) {
		System.out.println("customerService.getInquiryList(inquiry)");
		Map<String, Object> map = new HashMap<>();
		int totalCount = customerDAO.getTotalCount(inquiry);
		
		inquiry.setTotalCount(totalCount);
		System.out.println("totalCount = " + totalCount);
		System.out.println("inquiry = " + inquiry);
		map.put("inquiry", inquiry);
		map.put("inquiryList", customerDAO.getInquiryList(inquiry));
		return map;
	}

	// 문의사항 추가하기
	public int insert(InquiryDTO inquiry) {
		System.out.println("customerService.insert()");
		System.out.println("inquiry = " + inquiry);
		return customerDAO.insert(inquiry);
	}

	// 문의사항 상세보기
	public InquiryDTO getInquiry(int inquiry_num) {
		System.out.println("customerService.getInquiry()");
		return customerDAO.getInquiry(inquiry_num);
	}
	
	// 관리자 문의사항 리스트 가져오기
	public List<InquiryDTO> inquiryList() throws Exception{
		return customerDAO.inquiryList();
	}

	//최근 삽입된 번호 얻기
	public int getInsertInquiry() {
		System.out.println("customerService.getInsertInquiry");
		return customerDAO.getInsertInquiry();
	}
}
