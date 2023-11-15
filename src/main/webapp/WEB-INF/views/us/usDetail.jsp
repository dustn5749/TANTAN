<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 상세 정보</title>

 <style>
      body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
            margin-bottom: 10px;
        }

        button:hover {
            background-color: #45a049;
        }

        .button-group {
            text-align: center;
            margin-top: 20px;
        }

        .button-group button {
            padding: 10px 20px;
            margin: 0 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: auto;
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
        }

        .orange-btn:hover {
            background-color: #0088dd;
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

        /* 프로필 세부 정보 스타일 */
        .profile-details {
            text-align: left;
            margin-bottom: 20px;
        }

        .profile-details h2 {
            margin: 10px 0;
        }

        .profile-image img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #ccc;
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
        
        
    </style>
</head>

<body>


<div id="reportSubmissionMessage" style="text-align: center; color: green; margin-top: 10px;"></div>
 
 
    <div class="container">
        <!-- 프로필 세부 정보 -->
        <div class="profile-details">
            <div class="profile-image">
                <img src="images/profile-image.jpg" alt="프로필 이미지">
            </div>
            <h2 id="writer">${us.writer}</h2>
            <p id="title">제목: <span>${us.title}</span></p>
            <p id="content">내용: <span>${us.content}</span></p>
            <p>이메일: <span>${writer.email}</span></p>
            <p>전화번호: <span>${writer.phone}</span></p>
            <p>시작 날짜: <input type="date" id="start_Date" value="${us.start_Date}" readonly="readonly"></p>
            <p>시작 날짜: <input type="date" id="start_Date" value="${us.start_Date}"readonly="readonly"></p>
            <p>종료 날짜: <input type="date" id="end_Date" value="${us.end_Date}" readonly="readonly"></p>
            <p>게시글 번호: <span id="us_num">${us.us_num}</span></p>
            <p>동행 수: <span id="us_cnt">${us.us_cnt}</span></p>
        </div>

        <!-- 버튼 그룹 -->
        <div class="button-group">
            <button class="report-button" onclick="openModal()">신고하기</button>
            <button class="orange-btn" onclick="editEntry()">수정하기</button>
            <button class="orange-btn saveButton" onclick="saveEntry()">저장하기</button>
            <button class="orange-btn" onclick="deleteEntry()">삭제하기</button>
        </div>
        
        <!-- 댓글 섹션 -->
        <div class="reply-section">
            <div id="replyContainer">
                <textarea class="form-control" id="reply-form" placeholder="댓글을 입력하세요"></textarea>
                <div class="reply-form-button-wrapper">
                    <button class="orange-btn" onclick="btnInsert()">댓글쓰기</button>
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

    <script>
    
   		 document.addEventListener("DOMContentLoaded", function () {
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


        <!-- 수정된 submitReport 함수 -->
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
    const content = document.getElementById('content');
    const dateStart = document.getElementById('start_Date'); 
    const dateEnd = document.getElementById('end_Date'); 

    title.contentEditable = true;
    content.contentEditable = true;
    dateStart.readOnly = false;
    dateEnd.readOnly = false;
}
//수정한거 저장버튼
function saveEntry() {
    const title = document.getElementById('title').innerText;
    const content = document.getElementById('content').innerText;
    const start_Date = document.getElementById('start_Date').value;
    const end_Date = document.getElementById('end_Date').value;
    const us_num = document.getElementById('us_num').textContent;

    const data = {
        us_num: us_num,
        city_name: "수원시",
        title: title,
        content: content,
        start_Date: start_Date,
        end_Date: end_Date
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
            // 여기에서 수정이 완료된 후 수행할 작업을 추가할 수 있습니다.
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
    const us_num = document.getElementById('us_num').textContent;

    fetch('/us/delete', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({ us_num: parseInt(us_num) }),
    })
    .then(response => response.json())
    .then(data => {
        alert(data.message);
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
    const loggedInUserId = "사용자의 ID"; // 사용자의 ID를 가져와야 함
    const replyContent = document.getElementById('reply-form').value;

    const data = {
        userId: loggedInUserId,
        content: replyContent
    };

    fetch('/comments/insertComment', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(result => {
        const newReply = document.createElement('div');
        newReply.classList.add('reply');
        newReply.textContent = replyContent;

        const replyContainer = document.getElementById('replyContainer');
        replyContainer.appendChild(newReply);

        document.getElementById('reply-form').value = '';
    })
    .catch(error => {
        console.error("댓글 추가 중 오류 발생:", error);
    });
}

    </script>
</body>
</html>