package com.team1.project.service;

import java.util.Objects;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.team1.project.dao.MemberDao;
import com.team1.project.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	public MemberDao memberDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	// 회원가입하기
	public void insertMember(MemberDTO member) throws Exception{
		System.out.println("memberService.insertMember(member)");
		try {

			if(member == null || Objects.isNull(member.getEmail())) {
				throw new Exception("아이디는 필수 정보입니다.");
			} else if(Objects.isNull(member.getOauth()) && Objects.isNull(member.getPwd())) {
				throw new Exception("비밀번호는 필수 정보입니다.");
			}
			
			MemberDTO existMember = memberDao.findByEmail(member.getEmail());
			if(existMember != null && !Objects.isNull(member.getEmail())) {
				throw new Exception(member.getEmail() +"계정이 존재합니다.");
			}
		
			if(Objects.isNull(member.getPwd())) {
				member.setPwd(passwordEncoder.encode(member.getPwd()));				
			}
			
//			System.out.println("member.pwd = " + member.getPwd());
			// 비밀번호 암호화 한다
			System.out.println("memberservice.id = " + member.getMember_id());
			memberDao.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public boolean checkMember(MemberDTO member) {
		System.out.println("memberserviec.checkMeber. 기존 회원인지 체크하기");
		return memberDao.checkMember(member) != 0;
	}
	
	//비밀번호 암호화해서 저장하기
	public void encodingPwd(MemberDTO member)  {
		memberDao.encodingPwd(member);
	}
	
	
	// 회원 리스트 가져오기
//	public List<MemberDTO> memberList(MemberDTO member) throws Exception {
//	    
//	    return memberDao.memberList(member);
//	}
	public Map<String,Object> memberList(MemberDTO member){
        int todayRegisterCount = memberDao.todayRegister(member).getTodayRegister();
        member.setTodayRegister(todayRegisterCount);
		Map<String,Object> map = new HashMap<>();
		
		map.put("memberList", memberDao.memberList(member));
		map.put("todayRegister", todayRegisterCount);
		return map;
	}
	
	public int getTotalSize(MemberDTO member) {
	    return memberDao.getTotalCount(member);
	}

	// 회원 정보 수정하기
	public boolean modify(MemberDTO member) {
		System.out.println("memberservice.modify()");
		return memberDao.modify(member);
	}

	// 아이디로 멤버 찾기
	public MemberDTO findById(String member_id) {
		System.out.println("memberservice.findById()");
		return memberDao.findById(member_id);
	}
	
	// 관리자 리스트 가져오기
	public List<MemberDTO> adminList() throws Exception{
		
		System.out.println("service.memberList -> " + memberDao.adminList());
		
		return memberDao.adminList();
	}
	
	// 관리자 회원 정지
	public boolean memberStop(String member_id) throws Exception{
		return memberDao.memberStop(member_id);
	}

	// 관리자 회원 정지 해제
	public boolean memberRelease(String member_id) throws Exception{
		return memberDao.memberRelease(member_id);
	}
	
	// 관리자 월별 가입자 수
	public List<MemberDTO> monthMember() throws Exception{
		System.out.println("service.monthMember -> " + memberDao.monthMember());
		return memberDao.monthMember();
	}
	
	public int totalMembers(MemberDTO member) {
		
		return memberDao.totalMembers(member);
	}
	
	// 관리자 일일 가입자 수
    public int todayRegister(MemberDTO member) {
        int todayRegisterCount = memberDao.todayRegister(member).getTodayRegister();
        System.out.println(todayRegisterCount);
        member.setTodayRegister(todayRegisterCount);

        return todayRegisterCount;
    }
	
    public void reportCnt(String member_id) {
    	System.out.println("Inside reportCnt service method");
    	memberDao.increaseReportCount(member_id);
    }
    
}
