package com.team1.project.controller;

import java.security.Principal;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team1.project.config.auth.PrincipalDetails;
import com.team1.project.dto.KakaoProfile;
import com.team1.project.dto.MemberDTO;
import com.team1.project.dto.OAuthToken;
import com.team1.project.dto.ScheduleDTO;
import com.team1.project.service.MemberService;
import com.team1.project.service.ScheduleService;

@Controller
@RequestMapping("/member")
public class MemberController {

   
   @Autowired
   private MemberService memberservice; 
   
   @Autowired
   private ScheduleService scheduleservice;
   
   
   // 로그인폼으로 연동
   @RequestMapping("/loginForm.do")
   public String loginForm(Model model,
                  @RequestParam (value="error", required = false) String error,
                  @RequestParam(value="exception", required = false) String exception) {
      model.addAttribute("error", error);
      model.addAttribute("exception", exception);
      return "loginForm";
   }
   
   // 회원가입 form으로 가기
   @RequestMapping("/joinForm.do")
   public String joinForm() {
      return "joinForm";
   }
   
   // sns 회원가입하기 form으로 가기
   @RequestMapping("/snsJoinForm.do")
   public String snsJoinForm() {
      return "snsJoinForm";
   }
   
   // 회원가입 완료창
   @RequestMapping("/joinComplete.do")
   public String joinComplete() {
      return "joinComplete";
   }
   
   // 마이페이지로 이동
   @RequestMapping("/mypage.do")
   public String mypage() {
      return "mypage";
   }
   
   // 카카오 인가 코드 받기
   @RequestMapping("/kakao/callback")
   public String kakaoCallback(String code) throws JsonMappingException, JsonProcessingException {
      RestTemplate restTemplate = new RestTemplate();
      
      //HttpHeader 오브젝트 생성
      HttpHeaders headers = new HttpHeaders();
      headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
      
      //HttpBody 오브젝트 생성
      MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
      params.add("grant_type", "authorization_code");
      params.add("client_id", "fb376ab678ff9e4b03fa8a74dd227173");
      params.add("redirect_uri", "http://localhost:9000/member/kakao/callback");
      params.add("code", code);
      
      HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
      
      // Http 요청 
      ResponseEntity<String> response = restTemplate.exchange(
            "https://kauth.kakao.com/oauth/token",
            HttpMethod.POST,
            kakaoTokenRequest,
            String.class
            );
      
      System.out.println("https://kauth.kakao.com/oauth/token의 body = " + response.getBody());
      
      ObjectMapper objectMapper = new ObjectMapper();
      OAuthToken oauthToken = null;
      
      try {
         oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
      } catch (Exception e) {
         e.printStackTrace();
      }
   
      System.out.println("카카오 액세스 토큰 : " + oauthToken.getAccess_token());
      
      RestTemplate rt2 = new RestTemplate();
      
      //HttpHeader 오브젝트 생성
      HttpHeaders headers2 = new HttpHeaders();
      headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
      headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
      
      // HttpHeader와 HttpBody를 하나의 오브젝트에 담기
      HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);
      
      // Http 요청하기 - Post방식으로 - 그리고 response 변수의 응답 받음.
      ResponseEntity<String> response2 = rt2.exchange(
            "https://kapi.kakao.com/v2/user/me",
            HttpMethod.POST,
            kakaoProfileRequest2,
            String.class
      );
      System.out.println(response2.getBody());
      
      ObjectMapper objectMapper2 = new ObjectMapper();
      KakaoProfile kakaoProfile = null;
      
      
         kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
      
      System.out.println("카카오 프로필 =" + kakaoProfile );
      // User 오브젝트 : username, password, email
      System.out.println("카카오 아이디(번호) : "+kakaoProfile.getId());
      System.out.println("카카오 이메일 : "+kakaoProfile.getKakao_account().getEmail());
      
      Timestamp timeStamp = Timestamp.valueOf(LocalDateTime.now());
      MemberDTO kakaoMember = MemberDTO.builder()
            .member_id(String.valueOf(kakaoProfile.getId()))
            .name(kakaoProfile.getProperties().getNickname())
            .email(kakaoProfile.getKakao_account().getEmail())
            .nickname(kakaoProfile.getKakao_account().getEmail())
            .last_login_time(timeStamp)
            .roles("USER")
            .oauth("kakao")
            .phone("")
            .pwd("")
            .gender("")
            .profile_img(kakaoProfile.getProperties().getProfile_image())
            .accountExpired("N")
            .accountLocked("N")
            .build();
      System.out.println("kakaoMember" + kakaoMember);
      
      try {
         
         // 기존회원인지 체크하기
         
            memberservice.insertMember(kakaoMember);             
         
         
         System.out.println("기존 회원이 아니기에 자동 회원가입을 진행함");
      }catch (Exception e) {
         System.out.println("기존 회원 가입된 경우 다음으로 진행");
      }
      
      System.out.println("자동 로그인 진행");
      
      
      // 로그인 처리
      PrincipalDetails principalDetails = new PrincipalDetails(kakaoMember);
      Authentication authentication = new UsernamePasswordAuthenticationToken(
            principalDetails,
            null,
            principalDetails.getAuthorities());
            
      SecurityContextHolder.getContext().setAuthentication(authentication);
      
      return "redirect:/";
   }
   
   // 회원 정보 수정하기
   @ResponseBody
   @RequestMapping("/modify.do")
   public Map<String, Object> modify(@RequestBody MemberDTO member){
      System.out.println("membercontroller.modify()");
      System.out.println("member = " + member);
      Map<String, Object> result = new HashMap<>();
      result.put("result", memberservice.modify(member));
      result.put("member", memberservice.findById(member.getMember_id()));
      return result;
   }
   
   //내 일정으로 가기
   @RequestMapping("/mySchedule.do")
   public ModelAndView  mySchedule(ModelAndView mv, HttpServletRequest request,
         Principal principal) {
       System.out.println("membercontroller.mySchedule()");
       String viewPage = "mySchedule";
       if(principal != null) {
          List<ScheduleDTO> list = scheduleservice.getMyScheduleList(principal.getName());
          System.out.println("list = " + list);
          request.setAttribute("scheduleList", list);          
          request.setAttribute("scheduleList", list);
       }
       
      mv.setViewName(viewPage);
       return mv;
   }
   

   

}