<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의사항</title>
<link rel="stylesheet" href="/assets/css/inquiry.css">
</head>
<body>
 	<div class="inquiry_container">
 		<div class="nav_img_div">
 			<img src="/assets/img/frame.jpg" id="nav_img">
 			<div class="inquiry_title">
 				<div class="title">1:1문의하기</div>
 				<div class="title_right">고객센터  >  문의하기</div>
 			</div>
 		</div>
 		<div class="inquiry_container_inner">
 				<!-- 검색창 div -->
 				<div class="search_area">
 					<div class="search_menu_div">
 						<select id="search_menu_selects">
 							<option>제목</option>
 							<option>유형</option>
 							<option>작성일</option>
 							<option>작성자</option>
 							<option>진행상태</option>
 						</select>
 					</div>
 					<div class="search_input_div">
 						<input type="text" id="search_input" name="searchTitle">
 						<button id="search_btn"><img src="/assets/img/search.png" width="30px"></button>
 					</div>
 				</div>
 				

 	</div>
 	<script src="/assets/js/inquiry.js"></script>
</body>
</html>