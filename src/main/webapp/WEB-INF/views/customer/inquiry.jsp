<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의사항</title>
<style>

	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	/* 전체 컨테이너 */
	.inquiry_container {
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
	.inquiry_title {
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
	.inquiry_container_inner{
		margin: 0 atuo;
	}
	
	/* 검색창 div */
	.search_area {
		display: flex;
		
	}
	

	.content_contanier{
		
	}
	
	/* 리스트 테이블 */
	.inquiry_table > tr,td{
		margin:  0 auto;
		border-collapse: collapse;
	}
	
</style>
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
 						<input type="text" id="search_input">
 						<button id="search_btn"><img src="/assets/img/search.png" width="30px"></button>
 					</div>
 				</div>
 				<table class="inquiry_table">
 					<tr class="tb_tr">
 						<td></td>
 					</tr>
 				</table>
 		</div>
 	
 	</div>
</body>
</html>