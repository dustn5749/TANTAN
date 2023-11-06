<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 상세 정보</title>

   <style>
  
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
        }

        .report-button {
            background-color: #ff4444;
            color: white;
        }

        .report-button:hover {
            background-color: #dd3333;
        }

        .report-button,
        .report-button + button {
            margin-right: 5px;
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
            text-align: right;
        }

        .reply-form-button-wrapper button {
            padding: 10px 20px;
            margin: 0 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="profile-details">
            <div class="profile-image">
                <img src="images/profile-image.jpg" alt="프로필 이미지">
            </div>
            <h2 id="writer">킹킹</h2>
            <p id="title">제목: 점메추요</p>
            <p id="content">내용: 점심머먹지.</p>
            <p>이메일: example@example.com</p>
            <p>전화번호: 123-456-7890</p>
            <p>시작 날짜: <input type="date" id="start_Date"></p>
            <p>종료 날짜: <input type="date" id="end_Date"></p>
            <p>게시글 번호: <span id="us_num">108</span></p>
            <p>동행 수: <span id="us_cnt">5</span></p>
        </div>

        <div class="button-group">
            <button class="report-button" onclick="report()">신고하기</button>
            <button class="orange-btn" onclick="editEntry()">수정하기</button>
            <button class="orange-btn saveButton" onclick="saveEntry()">저장하기</button>
            <button class="orange-btn" onclick="deleteEntry()">삭제하기</button>
        </div>

        <div class="reply-section">
    <div id="replyContainer">
        <textarea class="form-control" id="reply-form" placeholder="댓글을 입력하세요"></textarea>
        <div class="reply-form-button-wrapper">
            <button class="orange-btn" onclick="btnInsert()">댓글쓰기</button>
            <button class="orange-btn" onclick="goToHomepage()">뒤로가기</button>
        </div>
    </div>
</div>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById('deleteBtn').addEventListener('click', deleteEntry);
        document.getElementById('saveButton').addEventListener('click', saveEntry);
    });

    
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

function report() {
    alert("신고가 완료되었습니다.");
}

document.getElementById('deleteBtn').addEventListener('click', deleteEntry);
document.getElementById('saveButton').addEventListener('click', saveEntry);

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
