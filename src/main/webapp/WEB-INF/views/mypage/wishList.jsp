<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 위시리스트</title>
<style type="text/css">

	
	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
	
	*{
	font-family: 'Pretendard-Regular';
	}
	/* 마이페이지 전체 container */
	.mypage_container {
		margin: 0 auto;
		align-content: center;
		align-items: center;
		justify-content: center;
		width: 70%;
		position: relative;
		padding: 3%;
	}
	.mypage_container_inner {
		display: flex;
	}
	/* 마이페이지 내용 div */
	.mypage_content_div {
		margin: 0 auto;
		align-content: center;
		align-items: center;
		justify-content: center;
		width: 100%;
		padding: 3%;
	}
	
	/* 마이페이지 메뉴 div */
	.mypage_title_div {
		margin: 0 auto;
		align-content: center;
		align-items: center;
		justify-content: center;
		width: 30%;
		border: 2px solid rgb(201, 201, 201);
		border-radius: 25px;
		height: 500px;
		text-align: left;
		padding: 5%;
		text-align: center;
		
	}
	.content_div {
		font-family: 'Pretendard-Regular' !important;	
	}
	/* 메뉴 div */
	.menu_div_inner {
		display: flex;
		/* justify-content: center; */
		align-content: center;
		align-items: center;
		margin-bottom: 40px;
	}

	/*  */
	#member_setting{
		font-family: 'Pretendard-Regular';
		margin-bottom: 20px;
		font-size: 25px !important;
		color : rgb(0, 50, 136);
		font-weight: bold;
		display: flex;
		align-items: center;
	}
	.menu_div_inner > img {
		margin-right: 10px;
	}
	.menu_a_class {
		font-size: 20px !important;
		font-family: 'Pretendard-Regular';
		 font-weight: bold !important;
	}
	
	.menu_a_class:hover {
		color : rgb(58, 122, 249);
	} 
	/* 내용 div inner  */
	.content_div_inner {
		width: 70%;
		text-align: left;
		font-size: 20px !important;
		padding: 2%;
		font-family: 'Pretendard-Regular';
	}
	/* 회원정보 메뉴 div */
	.content_member_menu {
		display: flex;
		font-family: 'Pretendard-Regular';
		height: 55px;
	}
	/* 회원 정보 메뉴 div  */
	.member_menu {
		margin-right: 20px;
		font-family: 'Pretendard-Regular';
		width: 120px;
		text-align: right;
		font-size: 18px !important;
		color : rgb(83, 83, 83);
	}
	.member_value {
		width: 60%;
	}
	.member_value > input, #pwd,#profile_img {
		width: 350px;
		font-family: 'Pretendard-Regular';
		padding: 1%;
		padding-right: 20x;
		border-radius: 5px;
		background-color:rgb(238, 244, 255);
		font-size: 15px !important;
	}
	/* 버튼 div */
	.btn_area {
		width: 100%;
		align-items: flex-end;
		text-align: right;
	}
	#modify_btn {
		width: 120px;
		height: 35px;
		border: none;
		background-color:rgb(100, 157, 255);
		color : white;
		box-shadow: 1px 1px 1px 1px rgb(79, 141, 248);
		font-family: 'Pretendard-Regular';
		border-radius: 8px;
	}
	
	#modify_btn:hover{
		background-color: rgb(212, 228, 255);
		color: black;
	}

/* 회원 탈퇴 div */
.delete_member_div {
	display: flex;
	font-family: 'Pretendard-Regular';
}
#deleteMember{
	font-family: 'Pretendard-Regular';
	color : grey;
	font-size: 15px !important;
	border: none;
	border-radius: 7px;
	background: rgb(0, 0, 0);
	color : white;
	height: 30px;
}
#deleteMember:hover {
	color : black;
	background: rgb(151, 151, 151);
}
</style>
</head>
<body>
	<div class="mypage_container">
		<div class="content_div">
			<p id="member_setting" >
			<img src="/assets/img/friend.png" width="60px">
			일정 위시리스트</p>
		</div>
		<div class="mypage_container_inner">
			<div class="content_div_inner">
				<%@ include file="/WEB-INF/views/schedule/wishList.jsp"%>	
			</div>
			<div class="mypage_title_div">
				<div class="menu_div">
					<div class="menu_div_inner">
						<img src="/assets/img/user.png" width="40px">
						<p class="menu_a_class">${principal.user.member_id}</p>
					</div>
					<div class="menu_div_inner">
						<img src="/assets/img/setting.png" width="40px">
						<a class="menu_a_class" href="/member/mypage.do"  style="color: grey">회원정보 설정</a>
					</div>
					<div class="menu_div_inner">
						<img src="/assets/img/calendar.png" width="40px">
						<a class="menu_a_class" href="/member/mySchedule.do" id="mySchedule" style="color: grey">내 일정</a>
					</div>
					<div class="menu_div_inner">
						<img src="/assets/img/friend.png" width="40px">
						<a class="menu_a_class" href="#" id="likeScheduleList">일정 위시리스트</a>
						<input type="hidden" value="${principal.user.member_id}" class="memberId"> 
					</div>
				</div>
			</div>
		</div>
	</div>
						<input type="hidden" value="${principal.user.member_id}" class="memberId"> 
	
	<script >
	
	/* 일정 위시리스트 */
	$("#likeScheduleList").on("click", function(){
		var member_id = $(".memberId").val();
		location.href="/schedule/likeScheduleList?member_id="+member_id;
	})
	</script>
</body>
</html>