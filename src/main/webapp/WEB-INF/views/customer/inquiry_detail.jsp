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
	padding: 0  !important;
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
	background-color: white;
	padding: 30px;
	border: 1px solid rgb(238, 238, 238);
}
#content{
	width: 100%;
	border: none;
	background-color: none;
}
/* 답변 div */
.commentDiv{
	margin: 0 auto;
	margin-top: 10px;
	margin-bottom: 30px;
}
.commentDiv_inner {
	display: flex;
	background-color: white;
	height: 100px;
	padding-top: 30px;
	
}

.commentTitle {
	text-align: left;
	padding-left: 30px;
	margin-right: 20px;
	font-size: 20px !important;
	font-weight: bold;
}
.comment_content > input {
	border: none;
	width: 600px;
	overflow: auto;
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
.backbtn{
	width: 200px;
	height: 42px;
	background: rgb(5, 118, 243) !important;
	color: white;
	border-radius: 6px;
	border: none;
	box-shadow: 1px 1px 1px rgb(4, 109, 225);
	cursor: pointer;
	margin-top: 20px;
}
.backbtn:hover{
	background: rgb(173, 211, 254) !important;
	color: black;
}

/* 출력 이미지 */
.imgArea_inner {
	margin-bottom: 20px;

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
				 	<c:if test="${!empty inquiry.file_id}">
				 		<img src="/files/${inquiry.file_id}" id="inquiryImg">				 	
				 	</c:if>
				 	
				 	<c:if test="${!empty file}">
				 		<div  class="imgArea">
				 			<c:forEach  items="${file}" var="fileNo">
					 			<div class="imgArea_inner">
					 				<img src="/files/${fileNo}" width="50%">
					 			</div>
				 			</c:forEach>
				 		</div>
				 	</c:if>
				</div>
				
				<!-- 답변 div  -->
				<div class="commentDiv">
					<hr>
					<div class="commentDiv_inner">
						<div class="commentTitle">답변 : </div>
						<div class="comment_content">
							<c:choose>
								<c:when test="${inquiry.answer_yn=='Y'}">
									<input type="text" value="네 고객님 불편하게 해드려 죄송합니다. 자세한 답변 사항은 이메일을 확인해주세요." readonly="readonly" style="color: red">
								</c:when>
								<c:otherwise>
									<input type="text" value="답변이 아직 작성되지 않았습니다." readonly="readonly" style="color: grey">
								
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<!-- 버튼  -->
				<div class="btn_div">
					<button class="backbtn">뒤로가기</button>
				</div>
			</div>
			
 		</div>
 	</div>

	<script>
	/* 뒤로 가기 */
	$(".backbtn").on("click", function(){
		location.href="/customer/inquiryList"
	})
	
</script>
</body>
</html>