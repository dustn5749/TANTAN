<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

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

.inquiry_detail_div {
	display: flex;
	width: 100%;
}

/* 문의 메뉴 */
.inquiry_menu_div {
	font-family: 'Pretendard-Regular';
	width: 20%;
	height: 50px;
	text-align: center;
	background-color: rgb(235, 252, 254);
	border: 1px solid white;
	justify-content: center;
	align-content: center;
	align-items: center;
	padding-top: 7px;
}
.inquiry_input_div {
	width: 750px;
	text-align: left;
	padding-left: 10px;
	border-bottom: 1px solid white;
}
.inquiry_input_div > input, select {
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
.editer_inner_div > textarea{
	width: 100%;
	height: 700px;
	
}
/* 작성 완료 버튼 div */
.eidter_btn_div {
	margin:0 auto;
	text-align: center;
	height: 50px;
	padding-top: 15px; 
}

#submit_btn{
	width: 200px;
	height: 42px;
	background: rgb(5, 118, 243);
	color: white;
	border-radius: 6px;
	border: none;
	box-shadow: 1px 1px 1px rgb(4, 109, 225);
	cursor: pointer;
}

#submit_btn:hover {
	background: rgb(173, 211, 254);
	color: black;
}
</style>
<script src="/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body>
 	<div class="inquiry_container">
 		<div class="nav_img_div">
 			<img src="/assets/img/frame.jpg" id="nav_img">
 			<div class="inquiry_title">
 				<div class="title"><a href="/customer/inquiryList" class="title">1:1문의하기</a></div>
 				<div class="title_right">고객센터  >  문의하기 > 글쓰기</div>
 			</div>
 		</div>
 		<div class="editer_div">
			<div class="editer_title_div">글 작성하기</div>
			<div class="editer_inner_div">
				<div class="inquiry_detail_area">
				<!-- 작성자  -->
					<div class="inquiry_detail_div">
						<div class="inquiry_menu_div">작성자</div>
						<div class="inquiry_input_div">
							<c:choose>
								<c:when test="${!empty principal}">
									<input type="text" readonly="readonly" id="member_id" value="${principal.user.member_id}">														
								</c:when>
							<c:otherwise>
								<input type="text" readonly="readonly" id="member_id" value="">													
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					<!-- 글제목 -->
					<div class="inquiry_detail_div">
						<div class="inquiry_menu_div">글제목</div>
						<div class="inquiry_input_div">							
							<input type="text"  id="title" >						
						</div>
					</div>
					
					<!-- 문의유형 -->
					<div class="inquiry_detail_div">
						<div class="inquiry_menu_div">문의 유형</div>
						<div class="inquiry_input_div">							
							<select id="inquiry_category">
								<option value="1">동행 문의</option>
								<option value="2">일정 문의</option>
								<option value="3">SNS 문의</option>
								<option value="4">게시글 작성 문의</option>
								<option value="5">홈페이지 이용 문의</option>
								<option value="6">기타 문의</option>
							</select>					
						</div>
					</div>
				</div>
				 <textarea rows="20" name="form-control" id="form-control"></textarea>
			</div>
			<div class="eidter_btn_div">
				<button id="submit_btn">작성완료</button>
			</div>
 		</div>
 	</div>

	<script>
	
	//스마트 에디터 열기
	$(document).ready(function () {
		
		<!-- SmartEditor2 텍스트편집기 -->
		var oEditors = [];
		function smartEditorIFrame() {
			
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "form-control",
				sSkinURI : "/smarteditor2/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
	      }
		smartEditorIFrame();
	});
	
	
</script>
</body>
</html>