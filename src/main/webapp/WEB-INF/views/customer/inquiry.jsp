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
 				<form name="pageForm" id="pageForm" action="/customer/inquiryList" method="post">
	 				<input type="hidden" name="pageNo" id="pageNo1" value="${result.inquiry.pageNo}" />
					<input type="hidden" name="searchTitle" id="searchTitle" value="${result.inquiry.searchTitle}" >
 				</form>
 				<form name="searchForm" id="searchForm" action="/customer/inquiryList" method="post">
 				<input type="hidden" id="pageNo2" name="pageNo" value="${result.inquiry.pageNo}">
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
 				</form>
 				
				<div class="writeBtn_div"><button class="writeBtn">글쓰기</button></div>
 				<table class="inquiry_table">
				<caption class="table_header">1:1 문의하기
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
 		<div class="nav_div">
 			<c:if test="${result.inquiry.navStart != 1}">
 				<a href="#" onclick="jsPageNo(${result.inquiry.navStart-1})" class="pageArrow"> &lt; </a> 
 			</c:if>
 			<c:forEach var="item"  begin="${result.inquiry.navStart}" end="${result.inquiry.navEnd}">
	 			<c:choose>
	 				<c:when test="${result.inquiry.pageNo != item }">
	 					<a href="#" onclick="jsPageNo(${item})" class="pageNum">${item}</a>  
	 				</c:when>
	 				<c:otherwise>
		           		<strong  >${item}</strong>   
		           	</c:otherwise>
	 			</c:choose> 			
 			</c:forEach>
 			<c:if test="${result.inquiry.navEnd != result.inquiry.totalPageSize}">
		        <a href="#" onclick="jsPageNo(${result.inquiry.navEnd+1})" class="pageArrow"> &gt; </a> 
		     </c:if>
 		</div>
 	</div>
 	<script src="/assets/js/inquiry.js"></script>
</body>
</html>