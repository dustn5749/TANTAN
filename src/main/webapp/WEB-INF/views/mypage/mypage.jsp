<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.team1.project.dto.ScheduleDTO"%>


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
   font-family: 'Pretendard-Regular' !important;
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
   
</style>

<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

</head>

<body>
   <div class="mypage_container">
      <div class="mypage_content_div">

<<<<<<< HEAD
         <div class="content_div">
            <p id="member_setting">
            <img src="/assets/img/calendar.png" width="60px">
            내 일정</p>
            <div class="content_div_inner">
               <div id='calendar'></div>
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
            <div class="menu_div_inner">
               <img src="/assets/img/friend.png" width="40px">
               <a class="menu_a_class" href="/member/friend.do" id="friendList">친구 관리</a>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
=======
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
>>>>>>> branch 'main' of https://github.com/dustn5749/TANTAN.git

      
   /* 캘린더 설정 */
      document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
         initialView : 'dayGridMonth',
         locale : 'ko', // 한국어 설정
         headerToolbar : {
              start : "",
               center : "prev title next",
               end : 'dayGridMonth,dayGridWeek,dayGridDay'
               },
      selectable : true,
      droppable : true,
      editable : true,
      events : [ 
              <%List<ScheduleDTO> scheduleList = (List<ScheduleDTO>) request.getAttribute("scheduleList");%>
               <%if (scheduleList != null) {%>
               <%for (ScheduleDTO vo : scheduleList) {%>
               {
                  
                  title : '<%=vo.getTitle()%>',
                   start : '<%=vo.getStart_Num()%>',
                   end : '<%=vo.getEnd_Date()%>',
                   color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
                },
      <%}
   }%>
               ]
               
            });
            calendar.render();
         });
      
   </script>
</body>
</html>