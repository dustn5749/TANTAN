<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE HTML>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 상세 정보</title>
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        input,span,div,p,button,a,
        h2 {
            font-family: 'Pretendard-Regular';
        }

        .usDetail_div {
            width: 80%;
            margin-top: 10px;
            margin-bottom: 10px;
            margin: 0 auto;
            text-align: center;
        }

        .profile-details {
            width: 100%;
            height: 500px;
            border: none;
            border-radius: 3px;
            margin-top: 30px;
            margin-bottom: 30px;

        }

        .profile-details>img {
            width: 100%;
            height: 100%;
            border-radius: 7px;
        }

        /* detail content div */
        .detail_content {
            text-align: center;
            margin: 0 auto;
            width: 95%;
        }

        .detail_content_div {

            width: 100%;
        }

        .detail_content_inner {
            width: 100%;
            display: flex;
        }

        .detail_content_inner1 {
            width: 100%;
        }

        .detail_content_inner>div {
            text-align: left;

        }

        .detail_title {
            width: 100%;
            display: flex;
        }

        .detail_title>p {
            font-size: 30px !important;
            font-weight: bold;
            font-family: 'Pretendard-Regular';
            width: 90%;
            text-align: left;
        }

        #report-button {
            border: none;
            background-color: rgb(239, 239, 239);
        }

        /* 동행 날짜 div */
        .detail_date {
            border: 2px dotted rgb(229, 229, 229);
            border-radius: 10px;
            font-family: 'Pretendard-Regular';
            height: 150px;
            padding: 35px;
            margin-top: 20px;
            margin-bottom: 20px;
            width: 95%;

        }

        .detail_date_inner {
            margin-top: 10px;
            display: flex;
        }

        .detail_date_inner>input,
        p {
            font-family: 'Pretendard-Regular';
        }

        .date {
            margin-right: 30px;
        }

        .doe_area {
            margin-left: 10px;
        }

        .detail_date>p>input {
            font-family: 'Pretendard-Regular';
            padding-left: 10px;
            margin-left: 10px;
            border: none;
            border-radius: 10px;
            height: 30px;
            background: none;
            border: none;
        }

        #start_Date,
        #end_Date {
            background: none;
            border: none;
            margin-left: 10px;

        }
        /* 프로필 */
        .profile {
            font-family: 'Pretendard-Regular';
            display: flex;
            text-align: left;
            background: rgb(239, 239, 239);
            border-radius: 8px;
            align-content: center;
            align-items: center;
            padding-left: 20px;
            height: 75px;
            margin: 30px;
            padding: 10px;
            width: 300px;
        }

        .profile-image>img {
            width: 50px;
        }


        .button-group {
            text-align: center;
            margin-top: 20px;
        }

        .button-group>button {
            padding: 10px 20px;
            margin: 0 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: auto;
            font-family: 'Pretendard-Regular';
        }

        .report-button {
            background-color: #ff4444;
            color: white;
        }

        .report-button:hover {
            background-color: #dd3333;
        }

        .orange-btn {
            background-color: #0099ff;
            color: white;
            width: 10%;
            height: 50px;
            border-radius: 4px;
            margin-top: 20px;
            margin-bottom: 20px;
            border: none;

        }

        .orange-btn:hover {
            background-color: rgb(0, 71, 119);
            color: white;
        }



        .reply-section {
            margin-top: 20px;
        }

        .form-control {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            display: block;
        }

        .reply-form-button-wrapper {
            text-align: center;
        }

        /*  */
        #replyContainer {
            display: flex;
            width: 100%;
            text-align: center;
        }

        #replyContainer>div {
            font-family: 'Pretendard-Regular';
            margin-right: 20px;
        }

        #replyContainer>button {
            font-family: 'Pretendard-Regular';
            width: 150px;
            background: #0099ff;
            border: none;
            border-radius: 7px;
        }

        #replyContainer>button:hover {
            background-color: rgb(0, 71, 119);
            color: white;
        }

        /* 신고 모달 스타일 */
        .reportmodal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 60%;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
            color: #555;
        }

        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
            margin-bottom: 15px;
        }

        #reportModal {
            text-align: center;
        }

        .report-buttons {
            margin-top: 15px;
        }

        .report-buttons button {
            padding: 10px 20px;
            margin: 0 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .report-buttons button {
            padding: 10px 20px;
            margin: 0 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* 추가된 스타일 */
        #reportSubmissionMessage {
            text-align: center;
            margin-top: 15px;
            color: green;
            font-weight: bold;
        }


        .user-details {
            margin-left: 20px;
            /* 프로필 이미지와 아이디 사이 여백 조절 */
            display: flex;
            margin-right: 20px;
        }

        .user-details h2 {
            margin: 0;
        }

        /* 내용 div */
        .details {
            padding-left: 40px;
            margin-top: 50px;
            margin-bottom: 30px;
        }

        .details>p {
            font-size: 20px !important;
            font-family: 'Pretendard-Regular';
        }

        /* 댓글 작성 div */
        .reply_content {
            display: flex;
            width: 100%;
            border: 1px solid grey;
            border-radius: 7px;

        }

        .reply_content>textarea {
            width: 100%;
            border: none;
        }


        /* 댓글 리스트 */
        .commnet_area {
            text-align: center;
            margin-top: 30px !important;
            margin-bottom: 50px !important;
            margin: 0 auto;
            align-content: center;
            align-items: center;
            justify-content: center;
            padding-left: 50px;
        }

        .comment_area_inner {
            display: flex;
            text-align: left;
            height: 40px;


        }

        .member_id_div {
            display: flex;
            margin-right: 30px;
            width: 120px;

        }

        .member_id_div>p {
            font-size: 20px !important;
            color: grey;
        }

        .btnarea>button {
            border: none;
            background: none;
        }

        .content_area {
            width: 60%;
        }

        /* content */
        #contentText {
            border: none;
            width: 90%;
            height: 200px;
            white-space: normal;
            overflow: hidden;
            border-radius: 5px;
        }

        #us_cnt {
            width: 50px;
            border: none;
            background: none;
            margin-left: 10px;
        }

        /* 조회수 div */
        .reviewCntDiv {
            display: flex;
            margin: 0 auto;
            width: 300px;
            text-align: center;
            align-content: center;
            align-items: center;
            justify-content: center;
            padding: 0;
        }

        .reviewCnt,
        .replyCnt {
            width: 120px;
            display: flex;
            margin: 0;
            padding: 0;
            text-align: center;
            position: relative;
        }

        .reviewCnt>img,
        .replyCnt>img {
            width: 100px;
        }

        .reviewCnt>p,
        .replyCnt>p {
            position: absolute;
            left: 60px;
            color: white;
            top: 12px;
            margin: 0;
            padding: 0;

        }
    </style>
</head>

<body>

    <div class="usDetail_div">
        <div id="reportSubmissionMessage" style="text-align: center; color: green; margin-top: 10px;"></div>


        <div class="profile-details">
            <c:choose>
                <c:when test="${us.fileNo!=0}">
                    <img src="/file/displayImage.do?usFileNum=${us.fileNo}" alt="동행이미지 사진" class="us_content_img">
                </c:when>
                <c:when test="${!empty us.imageUrl}">
                    <img src="${us.imageUrl}" class="us_content_img">
                </c:when>
                <c:when test="${empty us.imageUrl&& us.fileNo==0}">
                    <img src="https://tripsoda.s3.ap-northeast-2.amazonaws.com/prod/accompany/1697506783063-1207" class="us_content_img">
                </c:when>
            </c:choose>
        </div>
        <div class="detail_content">
            <div class="detail_content_div">
                <div class="detail_title">
                    <p id="title"><span>${us.title}</span></p>
                </div>

                <div class="detail_content_inner">
                    <div class="detail_content_inner1">
                        <div class="detail_date">
                            <p class="doe">모집 지역 : <sapn class="doe_area">${us.doe_Name}<span></span></p>
                            <div class="detail_date_inner">
                                <p class="date">시작 날짜: <input type="date" id="start_Date" value="${fn:substring(us.start_Date, 0, 10) }" readonly="readonly"> </p>
                                <p class="date"> ~ </p>
                                <p class="date">종료 날짜: <input type="date" id="end_Date" value="${fn:substring(us.end_Date, 0, 10) }" readonly="readonly"></p>
                                <p class="uscnt">모집 인원 : <input type="number" id="us_cnt" value="${us.us_cnt}" readonly="readonly" width="30px"></p>
                            </div>
                        </div>
                        <div class="details">
                            <p id="contentText">${us.content}</p>


                        </div>
                    </div>
                    <div class="profile">
                        <div class="profile-image">
                            <img src="/assets/img/no_profile.png" alt="프로필 이미지">
                        </div>
                        <div class="user-details">
                            <h2 id="writer">${us.writer}</h2>
                        </div>
                        <button id="report-button" onclick="openModal()"><img src="/assets/img/report.jpg" id="reportBtn" width="25px"></button>

                    </div>
                </div>
            </div>
            <!-- 버튼 그룹 -->
            <div class="reviewCntDiv">
                <div class="reviewCnt">
                    <img src="/assets/img/review.png" id="reviewIcon">
                    <p class="cntP">${us.viewCount}</p>
                </div>
                <div class="replyCnt">
                    <img src="/assets/img/reply.png" id="replyIcon">
                    <p class="cntP" id="replycnt">${commentLength}</p>
                </div>
            </div>
            <div class="button-group">
                <c:if test="${principal.user.member_id == us.writer}">
                    <button class="orange-btn" onclick="editEntry()">수정하기</button>
                    <button class="orange-btn saveButton" onclick="saveEntry()">저장하기</button>
                    <button class="orange-btn" onclick="deleteEntry()">삭제하기</button>
                </c:if>
            </div>

            <!-- 댓글 섹션 -->
            <div class="reply-section">
                <div id="replyContainer">
                    <div class="reply_content">
                        <textarea class="form-control" id="reply-form" placeholder="댓글을 입력하세요"></textarea>
                    </div>
                    <button class="insertBtn" onclick="btnInsert()">댓글쓰기</button>
                </div>

                <div class="commnet_area">
                    <c:forEach items="${commentList}" var="item">
                        <div class="comment_area_inner">
                            <div class="member_id_div">
                                <img src="/assets/img/userReview.png" width="30px">
                                <p class="member_id">${item.writer}</p>
                            </div>
                            <div class="content_area">${item.content}</div>
                            <c:if test="${item.writer==principal.user.member_id}">
                                <div class="btnarea">
                                    <button class="modifybtn">수정하기</button>
                                    <button class="deleteBtn">삭제하기</button>
                                </div>

                            </c:if>
                        </div>
                    </c:forEach>
                </div>
                <div class="reply-form-button-wrapper">
                    <button class="orange-btn" onclick="goToHomepage()">뒤로가기</button>
                </div>
            </div>
        </div>
        <!-- 신고 모달 -->
        <div id="reportModal" class="reportmodal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>신고하기</h2>
                <form id="reportForm">
                    <label for="reportType">신고유형</label>
                    <select id="reportType" name="reportType">
                        <option value="욕설">욕설</option>
                        <option value="음란물">음란물</option>
                        <option value="도배">도배</option>
                        <option value="유도성글">유도성 글</option>
                        <option value="광고">광고</option>
                    </select>

                    <label for="reportReason">신고사유</label>
                    <textarea id="reportReason" name="reportReason" rows="4" cols="50" placeholder="신고사유를 입력하세요"></textarea>

                    <button type="button" onclick="submitReport()">신고 제출</button>
                </form>
            </div>
        </div>
    </div>
    <c:choose>
        <c:when test="${!empty principal}">
            <input type="hidden" value="${principal.user.member_id}" class="member">
        </c:when>
        <c:otherwise>
            <input type="hidden" value="" class="member">
        </c:otherwise>
    </c:choose>
    <input type="hidden" id="us_num" value="${us.us_num}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById('deleteBtn').addEventListener('click', deleteEntry);
            document.getElementById('saveButton').addEventListener('click', saveEntry);
        });

        //신고하기 
        function openModal() {
            document.getElementById("reportModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("reportModal").style.display = "none";
        }

        function submitReport() {
            console.log('submitReport function called');
            const reportType = document.getElementById('reportType').value;
            const reportReason = document.getElementById('reportReason').value;

            // 일단 콘솔에 메시지를 출력하는 것으로 확인
            console.log('Report Type:', reportType);
            console.log('Report Reason:', reportReason);

            closeModal();
            showReportSubmissionMessage();
        }

        function showReportSubmissionMessage() {
            console.log('Entering showReportSubmissionMessage');
            const submissionMessageElement = document.getElementById('reportSubmissionMessage');
            submissionMessageElement.textContent = '신고 접수 완료했습니다.';
            setTimeout(() => {
                submissionMessageElement.textContent = '';
            }, 3000); // 3초 후 메시지 초기화
        }
        // 동행게시글 상세보기
        function DetailForm(us_num) {
            const url = "/RealDetail" + us_num;
            fetch(url, {
                    method: "GET",
                    headers: {
                        "Content-Type": "application/json; charset=UTF-8",
                    },
                })
                .then(response => response.json())
                .then(json => {
                    document.getElementById("writer").textContent = json.writer;
                    document.getElementById("title").textContent = json.title;
                    document.getElementById("content").textContent = json.content;
                    document.getElementById("start_Date").value = json.start_Date;
                    document.getElementById("end_Date").value = json.end_Date;
                    document.getElementById("us_num").textContent = json.us_num;
                    document.getElementById("us_cnt").textContent = json.us_cnt;
                })
                .catch(error => {
                    console.error("오류 발생:", error);
                });
            return false;
        }

        // 수정하기
        function editEntry() {
            const title = document.getElementById('title');
            const content = document.getElementById('contentText');
            const dateStart = document.getElementById('start_Date');
            const dateEnd = document.getElementById('end_Date');
            const us_cnt = document.getElementById('us_cnt');

            title.contentEditable = true;
            title.style.border = "1px solid grey";
            content.style.border = "1px solid grey";
            content.contentEditable = true;

            dateStart.readOnly = false;
            dateEnd.readOnly = false;
            us_cnt.readOnly = false;

        }
        //수정한거 저장버튼
        function saveEntry() {
            const title = document.getElementById('title').innerText;
            const content = document.getElementById('contentText').innerText;
            const start_Date = document.getElementById('start_Date').value;
            const end_Date = document.getElementById('end_Date').value;
            const us_cnt = $("#us_cnt").val();
            const us_num = $("#us_num").val();

            const data = {
                us_num: us_num,
                doe_Name: $(".doe_area").text(),
                title: title,
                content: content,
                start_Date: start_Date,
                end_Date: end_Date,
                us_cnt: us_cnt
            };

            fetch('/us/update', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: JSON.stringify(data),
                })
                .then(response => response.json())
                .then(json => {
                    console.log(json);
                    if (json.message === "수정 성공했습니다!") {
                        alert('수정이 완료되었습니다.');
                        location.href = "/us/Detail?us_num=" + json.us_num;
                    } else {
                        alert('수정에 실패했습니다.');
                        // 수정에 실패한 경우에 대한 처리를 추가할 수 있습니다.
                    }
                })
                .catch(error => {
                    console.error('수정 중 오류 발생:', error);
                });
        }
        // 삭제하기
        function deleteEntry() {
            const us_num = $("#us_num").val();
            fetch('/us/delete', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: JSON.stringify({
                        us_num: parseInt(us_num)
                    }),
                })
                .then(response => response.json())
                .then(data => {
                    alert(data.message);
                    goToHomepage();
                })
                .catch(error => {
                    console.error('에러:', error);
                });
        }

        function goToHomepage() {
            window.location.href = '/us/list';
        }


        //댓글쓰기
        const replyContainer = document.getElementById('replyContainer');

        function btnInsert() {
            const loggedInUserId = $(".member").val(); // 사용자의 ID를 가져와야 함
            const replyContent = document.getElementById('reply-form').value;
            const us_num = $("#us_num").val();

            if (loggedInUserId != "") {
                if (replyContent != "") {
                    const data = {
                        us_num: us_num,
                        writer: loggedInUserId,
                        content: replyContent
                    };

                    $.ajax({
                        url: "/comment/insertComment",
                        type: 'POST',
                        contentType: "application/json; charset=UTF-8",
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function(data) {
                            alert(data.message);
                            if (data.status) {
                                var commentList = data.commentList;
                                var commentArea = $(".commnet_area");
                                commentArea.empty();
                                var commentLength = data.commentList.length;
                                $("#replycnt").text(commentLength);

                                commentList.forEach(function(e) {
                                    var div = document.createElement("div");
                                    $(div).addClass("comment_area_inner");

                                    var member_id = document.createElement("div");
                                    var member_img = document.createElement("img");
                                    $(member_img).attr("src", "/assets/img/userReview.png");
                                    $(member_img).css({
                                        "width": "30px"
                                    })
                                    var member_id_p = document.createElement("p");
                                    $(member_id_p).text(e.writer);
                                    $(member_id).addClass("member_id_div");
                                    $(member_id_p).addClass("member_id");

                                    $(member_id).append(member_img);
                                    $(member_id).append(member_id_p);


                                    var content = document.createElement("div");
                                    $(content).addClass("content_area");
                                    $(content).text(e.content);

                                    $(div).append(member_id);
                                    $(div).append(content);

                                    if (e.writer == loggedInUserId) {

                                        var btnarea = document.createElement("div");
                                        $(btnarea).addClass("btnarea");
                                        var btn1 = document.createElement("button");
                                        $(btn1).addClass("modifyBtn");
                                        $(btn1).text("수정하기");
                                        var btn2 = document.createElement("button");
                                        $(btn2).addClass("deleteBtn");
                                        $(btn2).text("삭제하기");
                                        $(btnarea).append(btn1);
                                        $(btnarea).append(btn2);

                                        $(div).append(btnarea);
                                    }
                                    $(commentArea).append(div);

                                });

                                const title = document.getElementById('title');
                                const content = document.getElementById('contentText');

                                title.style.border = "none";
                                content.style.border = "none";
                            }
                        }
                    })
                } else {
                    alert("댓글 내용을 입력해주세요");
                }
            } else {
                alert("로그인 후 이용해주세요")
            }
        }
    </script>
</body>

</html>