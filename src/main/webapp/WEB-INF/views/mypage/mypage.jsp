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
<title>Insert title here</title>
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
		display: flex;
		padding: 3%;
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
		width: 35%;
		border: 2px solid rgb(201, 201, 201);
		border-radius: 25px;
		height: 500px;
		text-align: left;
		padding: 5%;
		
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
		width: 80%;
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
		<div class="mypage_content_div">
	
			<div class="content_div">
				<p id="member_setting">
				<img src="/assets/img/setting.png" width="60px">
				회원정보 설정</p>
				<div class="content_div_inner">
					<div class="content_member_menu">
						<div class="member_menu">회원 아이디</div>
						<div class="member_value" ><input type="text" value="${principal.user.member_id}" readonly="readonly" disabled="disabled" id="member_id"></div>
					</div>
					<div class="content_member_menu">
						<div class="member_menu">이름</div>
						<div class="member_value"><input type="text" value="${principal.user.name}" readonly="readonly" disabled="disabled" id="name"> </div>
					</div>
					<div class="content_member_menu">
						<div class="member_menu">비밀번호</div>
						<div class="member_value">
							<c:choose>
							<c:when test="${principal.user.oauth == 'kakao'}">
								<input type="text" value="카카오 로그인" readonly="readonly" disabled="disabled" id="pwd"> 
							</c:when>
							<c:otherwise>
								<input type="text" value="${principal.user.pwd}" readonly="readonly" disabled="disabled" id="pwd"> 
							</c:otherwise>
						</c:choose>
						</div>
					</div>
					<div class="content_member_menu">
						<div class="member_menu">전화번호</div>
						<div class="member_value"><input type="text" value="${principal.user.phone}" readonly="readonly" disabled="disabled" id="phone"> </div>
					</div>
					<div class="content_member_menu">
						<div class="member_menu">이메일</div>
						<div class="member_value"><input type="text" value="${principal.user.email}" readonly="readonly" disabled="disabled" id="email"> </div>
					</div>
					<div class="content_member_menu">
						<div class="member_menu">닉네임</div>
						<div class="member_value"><input type="text" value="${principal.user.nickname}" readonly="readonly" disabled="disabled" id="nickname"> </div>
					</div>
					<div class="content_member_menu">
						<div class="member_menu">계정정보</div>
						<div class="member_value">
						<c:choose>
							<c:when test="${principal.user.oauth == 'kakao'}">
								<input type="text" value="${principal.user.oauth}" readonly="readonly" disabled="disabled" id="oauth"> </div>
							</c:when>
							<c:otherwise>
								<input type="text" value="일반" readonly="readonly" disabled="disabled" id="oauth"> </div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="content_member_menu">
						<div class="member_menu">프로필 이미지</div>
						<div class="member_value"><a href="${principal.user.profile_img}"id="profile_img">프로필 이미지</a> </div>
					</div>
					<div class="delete_member_div">
						<div class="member_menu">계정탈퇴</div> 
						<div class="member_value"><button id="deleteMember">회원 탈퇴하기</button> </div>
					</div>
					
					<div class="content_member_menu">
						<div class="btn_area">
							<button id="modify_btn">수정하기</button>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="mypage_title_div">
			<div class="menu_div">
				<div class="menu_div_inner">
					<img src="/assets/img/user.png" width="40px">
					<p class="menu_a_class">${principal.user.member_id}</p>
				</div>
				<div class="menu_div_inner">
					<img src="/assets/img/setting.png" width="40px">
					<a class="menu_a_class" href="/member/mypage.do">회원정보 설정</a>
				</div>
				<div class="menu_div_inner">
					<img src="/assets/img/calendar.png" width="40px">
					<a class="menu_a_class" href="/member/mySchedule.do" id="mySchedule">내 일정</a>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
	/* 수정하기  */
		$("#modify_btn").on("click", function(){
		    var btn_html = ($("#modify_btn").html() === "수정하기");
		    var oauth = $("#oauth").val();
		
		    if (btn_html) {
		        if (oauth !== "kakao") {
		            $("#name, #gender, #email, #pwd, #nickname, #phone").prop("readonly", false);
		            $("#name, #gender, #email, #pwd, #nickname, #phone").prop("disabled", false);
		            $("#modify_btn").html("수정완료");
		        } else {
		            alert("카카오 로그인은 수정이 불가능합니다.");
		        }
		    } else {
		    	var send = {
		    			member_id: $("#member_id").val(),
		    			name : $("#name").val(),
		    			pwd : $("#pwd").val(),
		    			phone: $("#phone").val(),
		    			email: $("#email").val(),
		    			nickname : $("#nickname").val()	
		    	}
		    	$.ajax({
		    		url : "/member/modify.do",
		    	    type: 'POST',
		    	    contentType:   "application/json; charset=UTF-8",
		    	    data: JSON.stringify(send),
		    	    dataType: "json",
		    	    success: function (data) {
		    			if(data.result){
		    				alert("회원정보를 수정했습니다");
		    		        $("#name, #gender, #email, #pwd, #nickname, #phone").prop("readonly", true);
		    	            $("#name, #gender, #email, #pwd, #nickname, #phone").prop("disabled", true);
							$("#name").val(data.member.name);
							$("#gender").val(data.member.gender);
							$("#email").val(data.member.email);
							$("#pwd").val(data.member.pwd);
							$("#nickname").val(data.member.nickname);
							
		    		        $("#modify_btn").html("수정하기");
		    			}
		    		}
		    	})

		    }
		});
	
	
	/* 회원 탈퇴하기 */
	$("#deleteMember").on("click", function(){
		var password = prompt("정말 탈퇴하시겠습니까? 탈퇴하시려면 비밀번호를 입력해주세요")
		send={ 
			member_id: $("#member_id").val(),
			pwd : password }
		
    	$.ajax({
    		url : "/member/deleteMember",
    	    type: 'POST',
    	    contentType:   "application/json; charset=UTF-8",
    	    data: JSON.stringify(send),
    	    dataType: "json",
    	    success: function (data) {
    			if(data.result){
    				alert("성공적으로 회원 탈퇴에 성공하였습니다.");
    		     	location.href="/main";
    			}
    		}
    	})
	})
	</script>
</body>
</html>