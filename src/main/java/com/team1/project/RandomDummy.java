package com.team1.project;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ThreadLocalRandom;

public class RandomDummy {

    private static Set<String> usedIds = new HashSet<>();
    private static Set<String> usedPhones = new HashSet<>();
    private static Set<String> usedEmails = new HashSet<>();
//    private static int currentReviewNum = 40; // 초기 REVIEW_NUM 값
//	
	public static String nName() {
		List<String> 성 = Arrays.asList("김", "이", "박", "최", "정", "강", "조", "윤", "장", "임", "한", "오", "서", "신", "권", "황", "안",
		        "송", "류", "전", "홍", "고", "문", "양", "손", "배", "조", "백", "허", "유", "남", "심", "노", "정", "하", "곽", "성", "차", "주",
		        "우", "구", "신", "임", "나", "전", "민", "유", "진", "지", "엄", "채", "원", "천", "방", "공", "강", "현", "함", "변", "염", "양",
		        "변", "여", "추", "노", "도", "소", "신", "석", "선", "설", "마", "길", "주", "연", "방", "위", "표", "명", "기", "반", "왕", "금",
		        "옥", "육", "인", "맹", "제", "모", "장", "남", "탁", "국", "여", "진", "어", "은", "편", "구", "용");
		List<String> 이름 = Arrays.asList("가", "강", "건", "경", "고", "관", "광", "구", "규", "근", "기", "길", "나", "남", "노", "누", "다",
		        "단", "달", "담", "대", "덕", "도", "동", "두", "라", "래", "로", "루", "리", "마", "만", "명", "무", "문", "미", "민", "바", "박",
		        "백", "범", "별", "병", "보", "빛", "사", "산", "상", "새", "서", "석", "선", "설", "섭", "성", "세", "소", "솔", "수", "숙", "순",
		        "숭", "슬", "승", "시", "신", "아", "안", "애", "엄", "여", "연", "영", "예", "오", "옥", "완", "요", "용", "우", "원", "월", "위",
		        "유", "윤", "율", "은", "의", "이", "익", "인", "일", "잎", "자", "잔", "장", "재", "전", "정", "제", "조", "종", "주", "준",
		        "중", "지", "진", "찬", "창", "채", "천", "철", "초", "춘", "충", "치", "탐", "태", "택", "판", "하", "한", "해", "혁", "현", "형",
		        "혜", "호", "홍", "화", "환", "회", "효", "훈", "휘", "희", "운", "모", "배", "부", "림", "봉", "혼", "황", "량", "린", "을", "비",
		        "솜", "공", "면", "탁", "온", "디", "항", "후", "려", "균", "묵", "송", "욱", "휴", "언", "령", "섬", "들", "견", "추", "걸", "삼",
		        "열", "웅", "분", "변", "양", "출", "타", "흥", "겸", "곤", "번", "식", "란", "더", "손", "술", "훔", "반", "빈", "실", "직", "흠",
		        "흔", "악", "람", "뜸", "권", "복", "심", "헌", "엽", "학", "개", "롱", "평", "늘", "늬", "랑", "얀", "향", "울", "련");
		    Collections.shuffle(성);
		    Collections.shuffle(이름);
		    return 성.get(0) + 이름.get(0) + 이름.get(1);
	}
//	
	private static String generateRandomId() {
        String ran = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        StringBuilder text = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            text.append(ran.charAt((int) (Math.random() * ran.length())));
        }
        return text.toString();
    }
//	
	public static String nId() {
        String text;
        do {
            text = generateRandomId();
        } while (usedIds.contains(text));
        usedIds.add(text);
        return text;
    }
		public static String nNo2() {
	        return String.format("%03d", ThreadLocalRandom.current().nextInt(1, 1001));
	    }
	
//	public static String nPhone() {
//		List<String> 번호 = Arrays.asList("010","011","012","013");
//		Collections.shuffle(번호);
//		
//		return 번호.get(0);
//	}
	public static String nNo() {
		return (int)(Math.random() * 8999)+1000 +"";
	}
	
	public static String nNick() {
		List<String> 닉 = Arrays.asList("기분나쁜","기분좋은","신바람나는","상쾌한","짜릿한","그리운","자유로운","서운한","울적한","비참한","위축되는","긴장되는","두려운","당당한","배부른","수줍은","창피한","멋있는",
										"열받은","심심한","잘생긴","이쁜","시끄러운", "명석한", "외로운", "똑똑한");
		List<String> 네임 = Arrays.asList("사자","코끼리","호랑이","곰","여우","늑대","너구리","침팬치","고릴라","참새","고슴도치","강아지","고양이","거북이","토끼","앵무새","하이에나","돼지","하마","원숭이","물소","얼룩말","치타",
										"악어","기린","수달","염소","다람쥐","판다");
		Collections.shuffle(닉);
		Collections.shuffle(네임);
		String text = 닉.get(0)+네임.get(0);
		return text;
	}
	
	private static Random getRandom() {
        return new Random();
    }
	
    public static String nDate() {
        // 현재 날짜와 시간을 가져오기
        Date currentDate = new Date();

        // 랜덤한 날짜를 생성하기 위해 시작 날짜를 설정 (2023년 1월 1일)
        long startMillis = new Date(123, 0, 1).getTime();

        // 현재 시간에서 2023년 1월 1일까지의 랜덤한 시간을 생성
        long randomMillis = ThreadLocalRandom.current().nextLong(startMillis, currentDate.getTime());

        // Date 객체를 생성하여 랜덤한 날짜와 시간을 설정
        Date randomDate = new Date(randomMillis);

        // SimpleDateFormat을 사용하여 원하는 형식으로 포맷팅
        SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd HH:mm:ss.SSS");
        return dateFormat.format(randomDate);
    }
    
    private static String generateRandomPhone() {
        List<String> phoneNumbers = Arrays.asList("010", "011", "012", "013");
        Collections.shuffle(phoneNumbers);
        return phoneNumbers.get(0) + nNo() + nNo();
    }
    
    public static String nPhone() {
        String text;
        do {
            text = generateRandomPhone();
        } while (usedPhones.contains(text));
        usedPhones.add(text);
        return text;
    }
    
    public static String nAge() {
        // 19살부터 65살까지 랜덤한 나이 생성
        int age = ThreadLocalRandom.current().nextInt(19, 66);
        return String.valueOf(age);
    }

    private static String generateRandomEmail() {
        List<String> domains = Arrays.asList("gmail.com", "yahoo.com", "hotmail.com", "outlook.com");
        Collections.shuffle(domains);
        return nId() + "@" + domains.get(0);
    }
    
    public static String nEmail() {
        String text;
        do {
            text = generateRandomEmail();
        } while (usedEmails.contains(text));
        usedEmails.add(text);
        return text;
    }
    
    public static String nGender() {
        List<String> genders = Arrays.asList("Male", "Female");
        Collections.shuffle(genders);
        return genders.get(0);
    }
    
    public static void main(String[] args) {
        for (int i = 0; i < 100; i++) {
            if (i % 10 == 0) {
                System.err.println();
            }
            System.err.print("INSERT INTO member (member_id, name, pwd, nickname, register_time, phone, email, gender, age) VALUES ('");
            System.out.println();
            System.err.print(nId() + nNo2() + "', '");
            System.err.print(nName() + "', '");
            System.err.print("$2a$10$yNyTiw5aKVqx7RkcpiZ.juA9vqwoLPaaiilK4C8xX0tV6rqYPWkqq" + "', '");
            System.out.println();
            System.err.print(nNick() + "', '");
            System.err.print(nDate() + "', '");
            System.err.print(nPhone() + "', '");
            System.err.print(nEmail() + "', '");
            System.err.print(nGender() + "', '");
            System.err.print(nAge() + "');\n");
        }
    }
}
	
//	public static int generateRandomReviewNum() {
//        return ThreadLocalRandom.current().nextInt(1, 1001);
//    }
//
//    public static int generateRandomDoeNum() {
//        return ThreadLocalRandom.current().nextInt(1, 17);
//    }

//	public static String nId() {
//  String text;
//  do {
//      text = generateRandomId();
//  } while (usedIds.contains(text));
//  usedIds.add(text);
//  return text;
//}

//    public static int generateRandomScore() {
//        return ThreadLocalRandom.current().nextInt(1, 6);
//    }
//
//    public static String generateRandomContent(int score) {
//        List<String> feedbacks = Arrays.asList("별로에요", "애매해요", "갈만해요", "좋았어요", "최고에요!");
//        
//        // score가 1 미만이면 1로, 5를 초과하면 5로 설정
//        int adjustedScore = Math.min(Math.max(score, 1), 5);
//        
//        return feedbacks.get(adjustedScore - 1);
//    }
//
//    public static String generateRandomRegDate() {
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        int year = 2023;
//        int month = ThreadLocalRandom.current().nextInt(1, 12);
//        int day = ThreadLocalRandom.current().nextInt(1, 29);
//        int hour = ThreadLocalRandom.current().nextInt(0, 24);
//        int minute = ThreadLocalRandom.current().nextInt(0, 60);
//        int second = ThreadLocalRandom.current().nextInt(0, 60);
//
//        String formattedDate = String.format("%d-%02d-%02d %02d:%02d:%02d", year, month, day, hour, minute, second);
//        return formattedDate;
//    }
//
//    public static String generateRandomDeleteYN() {
//        return "N";
//    }
//    
////    public static int generateSequentialReviewNum() {
////        return currentReviewNum++;
////    }
//    
//    private static Set<Integer> usedReviewNums = new HashSet<>();
//
//    public static int generateSequentialReviewNum() {
//        int reviewNum;
//        do {
//            reviewNum = ThreadLocalRandom.current().nextInt(40, 1001);
//        } while (usedReviewNums.contains(reviewNum));
//
//        usedReviewNums.add(reviewNum);
//        return reviewNum;
//    }
//
//    public static void main(String[] args) {
//        for (int i = 0; i < 940; i++) {
////            int reviewNum = generateRandomReviewNum();
//            int doeNum = generateRandomDoeNum();
//            String memberId = nId();
//            int score = generateRandomScore();
//            String content = generateRandomContent(score);
//            String regDate = generateRandomRegDate();
//            String deleteYN = generateRandomDeleteYN();
//
//          System.err.print("INSERT INTO review (review_num, doe_num, member_id, score, content, regDate, deleteYN) VALUES ('");
//          System.err.print(generateSequentialReviewNum() + "', '");
//          System.err.print(doeNum + "', '");
//          System.err.print(memberId + "', '");
//          System.err.print(score + "', '");
//          System.err.print(content + "', '");
//          System.err.print(regDate + "', '");
//          System.err.print(deleteYN + "');\n");
//        }
//    }
//}