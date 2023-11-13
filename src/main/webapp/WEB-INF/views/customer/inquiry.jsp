<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의사항</title>
<style type="text/css">

	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	/* 전체 컨테이너 */
	.result.inquiry_container {
		width: 80%;
		margin: 0 auto;
	}
	
	/* 이미지 컨테이너  */
	.nav_img_div{
		width: 100%;
		height: 450px;
	}
	#nav_img{
		width: 100%;
		height: 400px;
		opacity : 0.8;
	}
	.result.inquiry_title {
		width: 100%;
		background-color:  rgb(87, 87, 87);
		color : white;
		padding-right: 30px;
		height: 50px;
		display: flex;
		align-content: center;
		align-items: center;

	}
	.title {
		font-family: 'Pretendard-Regular';
		font-size: 30px !important;
		width: 80%;
		padding-left: 30px;
		text-align: left;
	}
	.title_right {
		width: 20%;
		font-family: 'Pretendard-Regular';
		font-size: 20px !important;
		padding-right: 20px;
		text-align: right;
	}
	
	/* 리스트 컨테이너 */
	.result.inquiry_container_inner{
		margin: 0 atuo;
	}
	
	/* 검색창 div */
	.search_area {
		display: flex;
		width: 100%;
		height: 50px;
	}
	
	.search_menu_div {
		width: 70%;
		text-align: right;
		margin-top: 5px;
	}
	#search_menu_selects{
		height: 30px;
	}
	.search_input_div{
		width: 30%;
		margin-top: 5px;
	}
	#search_input {
		width: 70%;
		height: 30px;
		
	}
	#search_btn{
		border: none;
		background: white;
		cursor: pointer;
	}
	#search_btn:hover {
		background: grey;
	}

	/* 리스트 테이블 */
	.result.inquiry_table {
		margin:  0 auto;
		margin-top: 50px;
		margin-bottom: 50px;
	
	}
	/* 테이블 caption */
	.result.inquiry_table  >caption {
		caption-side: top;
		text-align: left;
		font-size: 35px;
		font-weight: bold;
	}
	.result.inquiry_table >tr, td, input, a, span, caption , th{
		font-family: 'Pretendard-Regular';
	}
	
	table, tr, td {
		border-collapse: collapse;
	}
	
	.result.inquiry_menu {
		padding: 20px;
		text-align: center;
		font-size: 20px !important;	
  		border-top: 2px solid black;		
  		border-bottom: 2px solid black;		
  		border-left: 1px solid grey;		
  		border-right:  1px solid grey;
  		padding-right:40px !important;
  		padding-left: 40px !important;
	}
	/* 첫 번째 컬럼에는 왼쪽 border를 적용하지 않음 */
	.result.inquiry_menu:first-child {
    border-left: none;
	}

	/* 마지막 컬럼에는 오른쪽 border를 적용하지 않음 */
	.result.inquiry_menu:last-child {
    border-right: none;
	}
	
	.result.inquiry_input {
		text-align: center;
		margin-left:10px;
		margin-right:10px;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	.result.inquiry_input_title {
		width: 400px;
	}
	.tb_tr {
		border-bottom:  1px solid grey;
	}
	.tb_tr:last-child{
		border-bottom: 2px solid black;
	}
	/* 각 문의글 제목 */
	.inq_title {
		background: none;
		color:black;
		padding-left: 20px;
		cursor: pointer !important;
		text-align: left !important;
		padding-left: 20px;
	}
	.inq_title:hover {
		color:  #0069d9;
	}
</style>
</head>
<body>
 	<div class="result.inquiry_container">
 		<div class="nav_img_div">
 			<img src="/assets/img/frame.jpg" id="nav_img">
 			<div class="result.inquiry_title">
 				<div class="title">1:1문의하기</div>
 				<div class="title_right">고객센터  >  문의하기</div>
 			</div>
 		</div>
 		<div class="result.inquiry_container_inner">
 				<!-- 검색창 div -->
 				<form action="pageForm" id="pageForm" action="/customer/result.inquiryList" method="post">
	 				<input type="hidden" name="pageNo" id="pageNo1" value="${result.inquiry.pageNo}" />
					<input type="hidden" name="searchTitle" id="searchTitle" value="${result.inquiry.searchTitle}" >
 				</form>
 				<form name="searchForm" id="searchForm" action="/customer/result.inquiryList" method="post">
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
 				
 				<table class="result.inquiry_table">
				<caption class="table_header">1:1 문의하기</caption>
 					<tr class="tb_tr">
 						<th class="result.inquiry_menu">번호</th>
 						<th class="result.inquiry_menu">유형</th>
 						<th class="result.inquiry_menu">제목</th>
 						<th class="result.inquiry_menu">작성자</th>
 						<th class="result.inquiry_menu">등록일</th>
 						<th class="result.inquiry_menu">답변유무</th>
 					</tr>
					<c:forEach items="${result.inquiryList}" var="item">
					    <tr class="tb_tr">
					        <td class="result.inquiry_input">${item.inquiry_num}</td>
					        <td class="result.inquiry_input">${item.category}</td>
					        <td class="result.inquiry_input_title"><a class="inq_title">${item.title}</a></td>
					        <td class="result.inquiry_input">${item.member_id}</td>
					        <td class="result.inquiry_input">${item.regdate}</td>
					        <td class="result.inquiry_input">${item.answer_yn}</td>
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
		           		<strong style="font-size:1.3rem">${item}</strong>   
		           	</c:otherwise>
	 			</c:choose> 			
 			</c:forEach>
 			<c:if test="${result.inquiry.navEnd != result.inquiry.totalPageSize}">
		        <a href="#" onclick="jsPageNo(${result.inquiry.navEnd+1})" class="pageArrow"> &gt; </a> 
		     </c:if>

 		</div>
 	</div>
 	<script type="text/javascript">
 	//검색시 pageNo를 1페이지로 전환
 	document.querySelector("#searchForm").addEventListener("submit", e => {
 		console.log(document.querySelector("#search_input").value);
 		document.querySelector("#searchForm > #pageNo2").value = "1";
 		return true;
 	});	
 	
 	//페이지 이동
 	function jsPageNo(pageNo) {
 		console.log("페이지 이동" + pageNo);
 		document.querySelector("#pageNo1").value = pageNo;
 		document.querySelector("#pageForm").submit(); 
 		 return false;
 	}
 	
 	</script>
</body>
</html>