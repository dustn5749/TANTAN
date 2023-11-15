<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의사항</title>
<link rel="stylesheet" href="/assets/css/inquiry.css">
<style type="text/css">
	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	
	
/* 문의 세부 영역 */
.inquiry_detail_area {
	width: 100%;
}
.inquiry_detail_area > hr {
	width: 100%;
}
.inquiry_detail_div {
	display: flex;
	width: 100%;
}

.inquiry_input_title {
	width: 70%;
	text-align: left;
	justify-content: center;
	align-content: center;
	align-items: center;
	border-bottom: 1px solid rgb(238, 238, 238);
}
.inquiry_input_title > input {
	border: none;
	padding-left: 20px;
	width: 100%;
	height: 50px;
}
/* 문의 메뉴 */
.inquiry_menu_div {
	font-family: 'Pretendard-Regular';
	width: 30%;
	height: 50px;
	text-align: center;
	background-color: rgb(242, 251, 255);
	border: 1px solid white;
	justify-content: center;
	align-content: center;
	align-items: center;
	padding-top: 10px;
	border-bottom: 1px solid rgb(238, 238, 238);
}
.inquiry_input_div {
	width: 750px;
	text-align: left;
	border-bottom: 1px solid white;
}
.inquiry_input_div > input, select {
	padding-left: 20px;
	font-family: 'Pretendard-Regular';	
}
.inquiry_input_div > input {
	width: 100%;
	border: 1px solid rgb(239, 239, 239);
	border-radius: 5px;
	height: 95%;
}
.inquiry_input_div > select {
	width: 200px;
	text-align: left;
	padding-left: 5px;
	height: 95%;
	
}
/* smart에디터 div  */
.editer_div {
	width: 80%;
	margin: 0 auto;
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}
.editer_title_div{
	text-align: left;
	font-size: 35px !important;
	font-weight: bold;
	margin-bottom: 20px;
}
.editer_inner_div {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}
.content_div{
	width: 100%;
	height: 500px;
	background-color: white;
	padding: 30px;
	border: 1px solid rgb(238, 238, 238);
}
#content{
	width: 100%;
	border: none;
	background-color: none;
}
/* 버튼 */
.btn_div{
	margin:0 auto;
	text-align: center;
	height: 50px;
	justify-content: center;
	align-content: center;
	align-items: center; 
}
.btn_div > button{
	width: 200px;
	height: 42px;
	background: rgb(5, 118, 243);
	color: white;
	border-radius: 6px;
	border: none;
	box-shadow: 1px 1px 1px rgb(4, 109, 225);
	cursor: pointer;
	margin-top: 20px;
}
.btn_div > button:hover{
	background: rgb(173, 211, 254);
	color: black;
}
</style>

</head>
<body>
 	<div class="inquiry_container">
 		<div class="nav_img_div">
 			<img src="/assets/img/frame.jpg" id="nav_img">
 			<div class="inquiry_title">
 				<div class="title"><a href="/customer/inquiryList" class="title">1:1문의하기</a></div>
 				<div class="title_right">고객센터  >  문의하기 > 상세보기</div>
 			</div>
 		</div>
 		<div class="editer_div">
			<div class="editer_title_div">상세보기</div>
			<div class="editer_inner_div">
				<div class="inquiry_detail_area">
					<hr>
					<!-- 문의글 상세 사항 -->
					<div class="inquiry_detail_div">
						<div class="inquiry_menu_div">글번호</div>
						<div class="inquiry_input_div">
								<input type="text" readonly="readonly" id="inquiry_num" value="${inquiry.inquiry_num}">													
						</div>
						<div class="inquiry_menu_div">작성자</div>
						<div class="inquiry_input_div">
								<input type="text" readonly="readonly" id="member_id" value="${inquiry.member_id}">													
						</div>
						<div class="inquiry_menu_div">작성일</div>
						<div class="inquiry_input_div">
								<input type="text" readonly="readonly" id="regdate" value="${inquiry.regdate}">													
						</div>
					</div>
					
					<!-- 글제목 -->
					<div class="inquiry_detail_div">
						<div class="inquiry_menu_div">글제목</div>
						<div class="inquiry_input_title">							
							<input type="text"  id="title" name="title" value="${inquiry.title}">						
						</div>
					</div>
					

				</div>
				<div class="content_div">
				 <input type="text" id="content" value="${inquiry.content}" readonly="readonly">
				 	<c:if test="${!empty inquiry.file_id }">
				 		<img src="/files/${inquiry.file_id}" id="inquiryImg">				 	
				 	</c:if>
				</div>
				
				<!-- 버튼  -->
				<div class="btn_div">
					<button class="backbtn">뒤로가기</button>
				</div>
			</div>
			
 		</div>
 	</div>

	<script>
	
	
</script>
</body>
</html>