package com.team1.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.project.dto.DoeDTO;
import com.team1.project.dto.ReviewDTO;
import com.team1.project.service.DoeService;
import com.team1.project.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

   @Autowired
   public ReviewService reviewService;

   
    @Autowired 
    public DoeService doeService;
    
   
    // 리뷰 메인
    @RequestMapping(value = "/main")
    public String Main(ReviewDTO board) throws Exception {
        return "reviewMain";
    }
    
    
    
    // 리뷰 상세보기
    @ResponseBody
    @RequestMapping("/display")
    public Map<String, Object> displayReviewDoe(@RequestBody ReviewDTO review) throws Exception {
       System.out.println("reviewController.displayReviewDoe(review)" + review);
       Map<String, Object> result= new HashMap<>();
       
       int doe_num = doeService.findDoeNum(review.getDoe_name());
       review.setDoe_num(doe_num);
       
       List<ReviewDTO> reviewList =  reviewService.getReviewList(review);
       System.out.println("reviewList = " + reviewList);
       
       reviewService.averageDoe(review.getDoe_num());
       DoeDTO doe = doeService.getDoe(review.getDoe_num());

       result.put("reviewList",reviewList);
       result.put("doe", doe);
       result.put("result", true);
       return result;
    }
    
    // 리뷰 상세보기
    @RequestMapping("/display2")
    public String displayReviewDoe2(@RequestParam("doe_name") String doe_name, Model model) throws Exception {
       System.out.println("reviewController.displayReviewDoe2(doe_name)" + doe_name);
       int doe_num = doeService.findDoeNum(doe_name);
       ReviewDTO  review = new ReviewDTO(); 
       review.setDoe_num(doe_num);
       List<ReviewDTO> reviewList =  reviewService.getReviewList(review);
       reviewService.averageDoe(review.getDoe_num());
       DoeDTO doe = doeService.getDoe(review.getDoe_num());
       System.out.println("doe = " + doe);
       model.addAttribute("reviewList",reviewList);
       model.addAttribute("doe", doe);
       return "reviewMain";
    }
    
   //리뷰 작성
   @ResponseBody
   @RequestMapping("/insert") 
   public Map<String, Object> reviewWrite(@RequestBody ReviewDTO review, Authentication auth) throws Exception{
      System.out.println("reviewController.reviewWrite()");
      System.out.println("review = " + review);

      Map<String,Object> result = new HashMap<>();
      int doe_num = doeService.findDoeNum(review.getDoe_name());
      System.out.println("doe_num = " + doe_num);
      review.setDoe_num(doe_num);
      
      
      if(auth.getName()== null) {
         result.put("result", false);
      } else {
         review.setMember_id(auth.getName());
         
         if(reviewService.insert(review)) {
             List<ReviewDTO> reviewList =  reviewService.getReviewList(review);

             reviewService.averageDoe(review.getDoe_num());
             DoeDTO doe = doeService.getDoe(review.getDoe_num());

             result.put("reviewList",reviewList);
             result.put("doe", doe);
             result.put("result", true);
         }
      }
      return result;
      
   }

    
}