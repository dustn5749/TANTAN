
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <style>
        /* 모든 요소를 가운데 정렬 */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
/*             height: 100vh; */
            margin: 0;
            font-family: Arial, sans-serif;
        }

/*         /* 전체 내용의 최대 너비 설정 */ */
/*         #main { */
/*             max-width: 800px; */
/*             width: 100%; */
/*         } */

        .box {
            margin-bottom: 20px;
        }

/*         .featured-image img { */
/*             width: 100%; */
/*             height: auto; */
/*         } */

/*         .info-section { */
/*             margin-bottom: 20px; */
/*         } */

        .report-button {
            background-color: red;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

/*         .reply-form { */
/*             margin-bottom: 20px; */
/*         } */

/*         .reply-form-button-wrapper { */
/*             margin-top: 10px; */
/*         } */
    </style>
</head>
<body>
    <section id="main">
        <div class="container">
            <div class="row">
                <div id="content" class="col-8 col-12-medium">
                    <article class="box post">
                        <header>
                            <h2>여행가고 싶은 킹연수 언니</h2>
                        </header>
                        <!-- 이미지를 넣을 공간 -->
                        <div class="featured-image">
                            <img src="images/your-image.jpg" alt="이미지 설명">
                        </div>
                        <p>자소서 언제 쓰누;</p>
                    </article>
                </div>
            </div>
        </div>
    </section>

    <div class="info-section">
        <h2>모집 정보</h2>
        <p><strong>지역:</strong> 서울</p>
        <p><strong>모집 인원:</strong> 50명</p>
        <p><strong>날짜:</strong> 2023년 11월 15일</p>
        <button class="report-button" onclick="report()">신고하기</button>
    </div>

    <div class="section-footer">
        <div class="reply-form">
            <label class="form-label">댓글작성</label>
            <textarea class="form-control" id="reply-form"></textarea>
            <div class="reply-form-button-wrapper">
                <button class="btn orange-btn" onclick="btnInsert('${ postdetail.id }')">댓글쓰기</button>
            </div>
        </div>
        <div class="reply-container">
            <!-- 댓글 목록을 표시하거나 렌더링하는 부분 -->
        </div>
    </div>

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
