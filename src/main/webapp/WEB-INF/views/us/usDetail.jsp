<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
   <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .bg-dark {
            background-color: #343a40;
            color: #ffffff;
        }

        .profile-details p {
            margin: 5px 0;
        }
        #main {
            max-width: 70%;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border: 2px solid #0099ff;
            border-radius: 5px;
            box-shadow: 0px 0px 15px 0px rgba(0, 0, 0, 0.1);
        }
        .container {
            padding: 20px;
            margin-bottom: 30px;
        }

        .profile-info {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
        }
        .profile-image img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #ccc;
        }
        .report-button {
            background-color: #ff4444;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .report-button:hover,
        .orange-btn:hover {
            background-color: #0099ff;;
        }
        .orange-btn {
            background-color: #0099ff;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .reply-form {
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .reply-form-button-wrapper {
            display: flex;
            justify-content: flex-end;
        }
        .schedule {
        
          width: 150px;
            height: 150px;
        }
    </style>
</head>
<body>
    <section id="main">
        <div class="container">

 <header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <img src="images/travel-header.jpg" alt="여행 상세정보 이미지!" style="width: 100%; max-width: 600px;">
        </div>
    </div>
</header>
            <div class="profile-info">
                <div class="profile-image">
                    <img src="images/profile-image.jpg" alt="프로필 이미지">
                </div>
                <div class="profile-details">
                    <h2>사용자 이름</h2>
                    <p>이메일: example@example.com</p>
                    <p>전화번호: 123-456-7890</p>
                </div>
            </div>
        </div>
        <div class="container">
           <strong> 지역:</strong>서울 
            <strong>모집 인원:</strong> 50명
         	<div class="schedule">
  <form>
    <div style="display: flex; align-items: center;">
        <input type="date" class="form-control mt-1" id="date_start" name="date_start" placeholder="날짜 선택">
        <span style="margin: 0 5px;">-</span>
        <input type="date" class="form-control mt-1" id="date_end" name="date_end" placeholder="날짜 선택">
    </div>
</form>
 <div class="location-info">
        <p>내용을 입력칸 </p>
                <button class="report-button" onclick="report()">신고하기</button>
            </div>
        </div>
        <div class="container">
            <div class="reply-form">
                <textarea class="form-control" id="reply-form" placeholder="댓글을 입력하세요"></textarea>
                <div class="reply-form-button-wrapper">
                    <button class="orange-btn" onclick="btnInsert('${postdetail.id}')">댓글쓰기</button>
		<button class="orange-btn" onclick="goToHomepage()">뒤로가기</button>
		<script>
		    function goToHomepage() {
		        window.location.href = '/us/list'; // 홈페이지 URL 주소로 대체하세요.
		    }
		</script>
                </div>
                </div>
            </div>
            <div class="reply-container">
                <!-- 댓글 목록을 표시하거나 렌더링하는 부분 -->
            </div>
        </div>
    </section>
</body>
    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.dropotron.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
        function report() {
            // 여기에 신고 처리하는 코드를 작성
            alert("신고가 완료되었습니다.");
            // 필요에 따라 서버로 데이터를 보내거나 다른 작업을 수행합니다.
        }
    </script>
</body>
</html>
