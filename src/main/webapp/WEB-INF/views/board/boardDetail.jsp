<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Zay Shop - Contact</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

    <!-- Load map styles -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
</head>

<body>
    <!-- Start Top Nav -->

    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
          
        </div>
    </div>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Form</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            /* Add custom styles here if needed */
        </style>
    </head>
    <body>
        <!-- Start Contact -->
        <div class="container py-5">
            <div class="row py-5">
                <form class="col-md-9 m-auto" method="post" role="form">
                    <div class="form-group">
                        <label for="location">지역 선택:</label>
                        <select id="location" name="location" class="form-control">
                            <option value="서울">서울</option>
                            <option value="강원도">강원도</option>
                            <option value="제주">제주</option>
                            <option value="부산">부산</option>
                            <option value="경기도">경기도</option>
                            <option value="인천">인천</option>
                            <option value="충청도">충청도</option>
                            <option value="경상도">경상도</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="recruitment">모집인원 설정:</label>
                        <input type="range" id="recruitment" name="recruitment" min="1" max="50" step="1" class="form-control-range">
                        <span id="recruitmentValue">1</span>
                    </div>
                
         <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="departureDate">출발 날짜:</label>
                <input type="date" id="departureDate" name="departureDate" class="form-control">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="returnDate">도착 날짜:</label>
                <input type="date" id="returnDate" name="returnDate" class="form-control">
            </div>
        </div>
    </div>
    
    	<div class="section">
 	   <div class="section-header">
        <div class="image-wrapper">
<%--             <img src="${pageContext.request.contextPath}/resources/image/noImage.png" id="currImg"/> --%>
        </div>
        <input type="file" class="hidden" id="file" accept="image/*" style="width: 200px;"/>
        

        <div class="image-container">

        </div>

        <div class="button-wrapper">
        <button class="btn" id="upload">이미지추가하기</button>
        </div>

    </div>

                    <div class="form-group">
                        <label for="title">제목:</label>
                        <input type="text" id="title" name="title" class="form-control">
                    </div>
                    
                    <div class="form-group">
                        <label for="content">내용:</label>
                        <textarea id="content" name="content" class="form-control" rows="4"></textarea>
                    </div>
                    
         <div style="text-align: center;">
    	<input type="button" value="취소" class="btn btn-primary" onclick="window.location.href='/board/list'">
    	<input type="submit" value="작성완료" class="btn btn-primary" onclick="showConfirmation()">
    	</div>
                </form>
            </div>
        </div>
        
 <script>
        function showConfirmation() {
            alert('작성이 완료되었습니다.');
        }
    </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
