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
		System.out.println("inquiry = " + inquiry);
		Map<String, Object> map = new HashMap<>();
		inquiry.setTotalCount(customerDAO.getTotalCount(inquiry));
		map.put("inquiry", inquiry);
		map.put("inquiryList", customerDAO.getInquiryList(inquiry));
		return map;
	}
}
