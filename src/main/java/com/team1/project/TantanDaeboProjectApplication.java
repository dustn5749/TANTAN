/*
 * package com.team1.project;
 * 
 * import java.util.List;
 * 
 * import org.springframework.boot.CommandLineRunner; import
 * org.springframework.boot.SpringApplication; import
 * org.springframework.boot.autoconfigure.SpringBootApplication; import
 * org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.ComponentScan; import
 * org.springframework.http.ResponseEntity; import
 * org.springframework.scheduling.annotation.EnableScheduling; import
 * org.springframework.web.client.RestTemplate;
 * 
 * import com.team1.project.dto.UsDTO;
 * 
 * @EnableScheduling
 * 
 * @SpringBootApplication
 * 
 * @ComponentScan(basePackages = "com.team1.project") public class
 * TantanDaeboProjectApplication {
 * 
 * 
 * 
 * public static void main(String[] args) {
 * SpringApplication.run(TantanDaeboProjectApplication.class, args); } }
 * 
 * // @Bean // CommandLineRunner getRunner() { // return args -> { //
 * RestTemplate restTemplate = new RestTemplate(); // ResponseEntity<Root>
 * response = restTemplate.getForEntity(
 * "https://api.tripsoda.com/accompany/list?page=1&limit=23", Root.class); // //
 * Root root = response.getBody(); // // root.accompanyList //
 * .forEach(accompany -> System.out.println(accompany.area)); // }; // } //} //
 * // // // // //class AccompanyList{ // // public int id; // public String
 * memberKey; // public String imageId; // public int planId; // public String
 * title; // public String content; // public int maximum; // public int views;
 * // public int msgCount; // public String pullAt; // public String createdAt;
 * // public int isDel; // public String style_1; // public String style_2; //
 * public int age; // public String gender; // public int duration; // public
 * String startAt; // public String endAt; // public String temp_1; // public
 * String temp_2; // public int isMine; // public String area; // public String
 * nickName; // public String profile; // public String tendency; // public
 * String style; // public String imageUrl; // public int isEnd; // public int
 * commentCount; // public int recruitCount; // public int isRecruit; //} //
 * //class Root{ // public boolean success; // public int totalCount; // public
 * List<AccompanyList> accompanyList; //}
 */