<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal" var="principal"/>
</sec:authorize>
    
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <title>동행작성</title>
    <meta charset="utf-8">
    
      <style>
      
     .dropdown_container {
      width: 70px;
       position: relative;
       text-align: left;
       font-family: 'Pretendard-Regular' !important;
       margin-left: 10px; /* 한국과의 간격을 조정합니다. */
       display: flex;
       align-items: center; /* 세로 중앙 정렬을 위해 추가 */
   }

    
cursor: pointer;
    height: 40px;
    margin-right: 5px; /* 버튼과 메뉴 사이의 간격을 조정합니다. */
  }
  
.dropdown_btn {
    font-family: 'Pretendard-Regular' !important;
    border: none;
    border-radius: 5px;
    color: white;
    background-color: #0d6efd;
    cursor: pointer;
    height: 40px;
    margin-right: 2px; /* 버튼과 메뉴 사이의 간격을 조정합니다. */
}

/* 드롭다운 메뉴 스타일 */
.dropdown_btn + .dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    z-index: 1;
    padding: 10px;
    display: flex;
    flex-wrap: wrap;
}

.dropdown-menu ul li {
    margin: 5px 0;
    cursor: pointer;
    color: #333;
    height: 25px;
    font-family: 'Pretendard-Regular' !important;
    padding: 5px;
    border-radius: 5px;
    transition: background-color 0.3s;
}

/* 마우스를 가져다 대면 배경색 변경 */
.dropdown-menu ul li:hover {
    background-color: aliceblue;
}

      
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        /* 페이지 전체 container */
        .us_write_container {
            padding: 3%;
            margin-left: 200px;
        }

        /* 드랍다운 container */
        .dropdown_container {
            position: relative;
            display: inline-block;
            width: max-content; /* 너비를 최대 내용에 맞게 설정 */
            text-align: left;
            font-family: 'Pretendard-Regular' !important;
            margin-left: 100px;
        }

        .dropdown_btn_container {

            width: 100%;

        }

        .dropdown_btn {
            font-family: 'Pretendard-Regular' !important;
            width: 100px;
            border: none;
            border-radius: 5px;
            color: white;
            background-color: #0d6efd;
            cursor: pointer;
            height: 50px;
        }

        .dropdown_btn:hover {
            cursor: pointer;
        }

        /* 드롭다운 메뉴 스타일 */
        .dropdown_btn + .dropdown-menu {
            position: absolute;
            top: 0;
            left: 120%;
            border: 1px solid #ccc;
            border-radius: 3px;
            z-index: 1;
            width: max-content; /* 너비를 최대 내용에 맞게 설정 */
            padding: 5px;
            display: flex;  /* 리스트 항목을 가로로 나열하도록 설정 */
            flex-wrap: wrap;  /* 내용이 너무 많으면 줄 바꿈하도록 설정 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .dropdown_btn:focus + .dropdown-menu {
            display: block; 
        }

        /* 드롭다운 메뉴 내용 스타일 */
        .dropdown-menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;  /* 리스트 항목을 가로로 나열하도록 설정 */
            flex-wrap: wrap;  /* 내용이 너무 많으면 줄 바꿈하도록 설정 */
        }

        .dropdown-menu ul li {
            margin-right: 10px; /* 각 항목 간격을 설정하세요. */
            margin-bottom: 10px; /* 각 줄 간격을 설정하세요. */
            cursor: pointer;
            color: #333;
            height: 25px;
            font-family: 'Pretendard-Regular' !important;
            padding: 5px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        /* 마우스를 가져다 대면 배경색 변경 */
        .dropdown-menu ul li:hover {
            background-color: aliceblue;
        }

        .container-fluid {
            margin: 30px auto 0; /* 페이지 위쪽 여백 30px */
            max-width: 1200px; /* 최대 너비 1200px */
        }

        .recruitment-section {
            display: flex;
            justify-content: space-between; /* 모집인원 설정들 간 간격 유지 */
            margin-bottom: 20px; /* 하단 여백 20px */
        }

        .recruitment-section label,
        .recruitment-section input,
        .recruitment-section p {
            margin-bottom: 10px; /* 각 요소별 하단 여백 10px */
        }

        .form-group {
            margin-bottom: 20px; /* 폼 그룹 간 여백 20px */
        }

        #root {
            margin-top: 30px; /* 상단 여백 30px */
            padding: 20px; /* 안쪽 여백 20px */
            border: 1px solid #ccc; /* 테두리 설정 */
            border-radius: 8px; /* 테두리 둥글게 처리 */
            width: 100%;
            margin: 0 auto;
            max-width: 800px;
            display: flex;
            margin-bottom: 30px;
        }

        .contents {
            display: flex;
            justify-content: space-between; /* 콘텐츠 간 여백 유지 */
        }

        .contents .upload-box {
            flex: 1; /* 내용 콘텐츠를 공간을 가득 채우도록 설정 */
            margin-right: 20px; /* 우측 여백 20px */
        }

        .contents .upload-box .drag-file {
            height: 300px; /* 파일 드래그영역 높이 300px */
        }

        .text-center {
            margin-top: 30px; /* 상단 여백 30px */
        }

        /* 모집 지역 */
        .us_city_div {
            display: flex;
            margin: 0 auto;
            align-content: center;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }

        .us_city_value_div {
            margin-left: 30px;
            height: 50px;
        }

        #us_city_input {
            height: 50x;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            height: calc(1.5em + 0.75rem + 2px);
            padding: 0.375rem 0.75rem;
            border-radius: 0.25rem;
            background-color: #e9ecef;
            width: 150px;
        }

        /*  글씨체 변경 */
        .col-md-3 > input, label, .title, .col-md-4 > label, .text-center>input, .dropdown > button {
            font-family: 'Pretendard-Regular' !important;
        }

        /*  드립앤 드롭 박스 구역 */
        .root_inner {
            margin: 0 auto;
            width: 100%;
        }

        .title {
            text-align: center;
            font-size: 30px;  
        }

        .contents {
            display: flex;
            flex-direction: row;
            margin-top: 30px;
        }

        .contents .upload-box {
            width: 100%;
            margin-right: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .contents .upload-box .drag-file {
            position: relative;
            width: 100%;
            height: 360px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border: 3px dashed #dbdbdb;
        }

        .contents .upload-box .drag-file.highlight {
            border: 3px dashed red;
        }

        .contents .upload-box .drag-file .image {
            width: 40px;
        }

        .contents .upload-box .drag-file .message {
            margin-bottom: 0;
        }

        .contents .upload-box .drag-file .preview {
            display: none;
            position: absolute;
            left: 0;
            height: 0;
            width: 100%;
            height: 100%;
        }

        .contents .upload-box .file-label {
            font-family: 'Pretendard-Regular' !important;
            margin-top: 30px;
            background-color: #0d6efd;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            width: 65%;
            border-radius: 6px;
            cursor: pointer;
        }

        .contents .upload-box .file {
            display: none;
        }

        @media (max-width: 700px) {
            .contents {
                display: flex;
                flex-direction: column;
                margin-top: 30px;
            }

            .contents .upload-box {
                width: 100%;
                box-sizing: border-box;
                margin-right: 0;
            }

            .contents .upload-box .drag-file {
                height: 150px;
            }

            .contents .files {
                width: 100%;
                box-sizing: border-box;
                margin-right: 0;
                overflow: initial;
            }
        }

        #koreaMenu {
            position: absolute;
            top: 0;
            left: 100%;
            display: none;
        }

        #koreaBtn:hover #koreaMenu {
            display: block;
        }
    </style>
</head>
<body>

<div class="us_write_container">
    <div class="dropdown_container">
        <button class="dropdown_btn">
            한국
        </button>
        <div class="dropdown-menu">
            <ul class="nav-ul">
                <li class="nav-li" onclick="select_area(this.innerText)">서울</li>
                <li class="nav-li" onclick="select_area(this.innerText)">부산</li>
                <li class="nav-li" onclick="select_area(this.innerText)">대구</li>
                <li class="nav-li" onclick="select_area(this.innerText)">인천</li>

            <li class="nav-li" onclick="select_area(this.innerText)">광주</li>

				<li class="nav-li" onclick="select_area(this.innerText)">광주</li>

                <li class="nav-li" onclick="select_area(this.innerText)">대전</li>
                <li class="nav-li" onclick="select_area(this.innerText)">울산</li>
                <li class="nav-li" onclick="select_area(this.innerText)">세종</li>
                <li class="nav-li" onclick="select_area(this.innerText)">경기</li>
                <li class="nav-li" onclick="select_area(this.innerText)">강원</li>
                <li class="nav-li" onclick="select_area(this.innerText)">충북</li>
                <li class="nav-li" onclick="select_area(this.innerText)">충남</li>
                <li class="nav-li" onclick="select_area(this.innerText)">전북</li>
                <li class="nav-li" onclick="select_area(this.innerText)">전남</li>
                <li class="nav-li" onclick="select_area(this.innerText)">경북</li>

            <li class="nav-li" onclick="select_area(this.innerText)">경남</li>

				<li class="nav-li" onclick="select_area(this.innerText)">경남</li>

                <li class="nav-li" onclick="select_area(this.innerText)">제주</li>
            </ul>
        </div>
        </div>
        </div>
       
  

    <form id="us_wirte_form"  enctype="multipart/form-data">
   <div class="container-fluid mt-5">
       <div class="row justify-content-center">
           <div class="col-md-8">
              <div class="us_city_div">
                     <div class="us_city_title">
                          <label for="us_city">모집 지역:</label>
                      </div>
                      <div class="us_city_value_div">
                         <input type="text" readonly="readonly" id="us_city_input" name="doe_Name">
                      </div>
              </div>

                   <div class="row mb-4">
                       <div class="col-md-4 text-end">
                           <label for="recruitment">모집인원:</label>
                       </div>
                       <div class="col-md-2">
                           <input type="text" class="form-control" id="recruitmentText" readonly>
                       </div>
                       <div class="col-md-4">
                           <input type="range" min="1" max="10" class="form-range" id="recruitmentSlider" name="us_cnt">
                       </div>
                   </div>
                   <div class="row mb-4">
                       <div class="col-md-3 text-end">
                           <label for="date_start">시작 날짜:</label>
                       </div>
                       <div class="col-md-3">
                           <input type="date" class="form-control" id="date_start" name="start_Date">
                       </div>
                       <div class="col-md-3 text-end">
                           <label for="date_end">종료 날짜:</label>
                       </div>
                       <div class="col-md-3">
                           <input type="date" class="form-control" id="date_end" name="end_Date">
                       </div>
                   </div>
           </div>
       </div>
   </div>
      <input type="hidden" value="${principal.user.member_id}" id="writer" name="writer">
                
           <div id="root">
              <div class="root_inner">
              <h2 class="title">파일 업로드하기</h2>
                  <div class="contents">
                <div class="upload-box">
                  <div id="drop-file" class="drag-file">
                    <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
                    <p class="message">Drag files to upload</p>
                    <img src="" alt="미리보기 이미지" class="preview">
                  </div>
                  <label class="file-label" for="chooseFile">사진 선택하기</label>
                  <input class="file" id="chooseFile" name ="file" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif">
                </div>
              </div>
              </div>
           <hr>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="title">제목:</label>
                                <input type="text" id="title" name="title" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="content">내용:</label>
                                <textarea id="content" name="content" class="form-control" rows="11"></textarea>
                            </div>
                            <div class="text-center my-4">
                                <input type="button" value="취소" class="btn btn-secondary mx-2" onclick="window.location.href='/us/list'">
                                <input type="button" value="작성완료" class="btn btn-primary mx-2" id="submitbtn">
                            </div>
                        </div>
                    </div>
      </form>


   <script src="/assets/js/uswrite.js"></script>

    
</body>
</html>