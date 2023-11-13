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

.editer_div {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	
}

</style>

</head>
<body>
 	<div class="inquiry_container">
 		<div class="nav_img_div">
 			<img src="/assets/img/frame.jpg" id="nav_img">
 			<div class="inquiry_title">
 				<div class="title">1:1문의하기</div>
 				<div class="title_right">고객센터  >  문의하기 > 글쓰기</div>
 			</div>
 		</div>
 		<div class="editer_div">
 				<table class="inquiry_table">
				<caption class="table_header">1:1 문의사항 글쓰기
				</caption>
 					<tr class="tb_tr">
 						<th class="inquiry_menu">번호</th>
 						<th class="inquiry_menu">유형</th>
 						<th class="inquiry_menu">제목</th>
 						<th class="inquiry_menu">작성자</th>
 						<th class="inquiry_menu">등록일</th>
 						<th class="inquiry_menu">답변유무</th>
 					</tr>
					<c:forEach items="${result.inquiryList}" var="item">
					    <tr class="tb_tr">
					        <td class="inquiry_input" id="inquiry_num">${item.inquiry_num}</td>
					        <td class="inquiry_input">${item.category}</td>
					        <td class="inquiry_input_title"><a class="inq_title">${item.title}</a></td>
					        <td class="inquiry_input">${item.member_id}</td>
					        <td class="inquiry_input">${item.regdate}</td>
					        <td class="inquiry_input">${item.answer_yn}</td>
					    </tr>
					</c:forEach>
 				</table>
 		</div>
	</div>
 	<script type="text/javascript">
 

 	</script>
</body>
</html>