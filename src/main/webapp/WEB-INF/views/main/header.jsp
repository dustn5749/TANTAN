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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="/assets/sns/css/profileReset.css">
<link rel="stylesheet" href="/assets/sns/css/proflieStyle.css">
<link rel="stylesheet" href="/assets/sns/css/modal.css">
<link rel="stylesheet" href="/assets/sns/css/message.css">

<script src="/assets/js/jquery-3.6.1.min.js"></script>

<style type="text/css">

@font-face {
    font-family: 'NPSfontBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

	@font-face {
	    font-family: 'Pretendard-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	    font-weight: 400;
	    font-style: normal;
	}
/* header 메뉴바  */
ul, li {
	margin: 0;
	padding: 0;
	justify-content: center;
	text-align: center;
}
.nav > li {
	position: relative;
	font-family: 'NPSfontBold';
	list-style: none;
	width: 100px;
	text-align: center;
/* 	display: flex; */

}
.nav > li > a {
	display: block;
	text-decoration: none;
	font-family: 'NPSfontBold';
	text-align: center;
	
}
.nav > li > ul{
     font-family: 'NPSfontBold';
	font-size: 20px !important;
	position: absolute;
	text-align: center;
	
	
	 /* 버튼 아이콘의 크기를 조절 */
    .nav-icon i {
        font-size: 30px; /* 원하는 크기로 조절합니다. */
    }
    
   
    
    .navbar .align-self-center .d-flex {
/*     	width: 200px !important;
 */    }
}
.nav > li:hover > ul {
	display: block;
	width: 160px; 
	opacity : 0.9;
	text-align: center;
	
}

.nav > li > ul > li:hover {
	background-color : rgb(233, 254, 255);
}

.nav > li > ul > li> a:hover {
	color : blue;
}

.nav > li > ul > li  {
	list-style: none;
	height: 50px;
	text-align: center;
	

}
.nav > li > ul > li> a  {
	text-decoration: none;
	font-family: 'NPSfontBold';	
	text-align: center;
	justify-content: center;	
	display: flex;
}
.under_menu{
	display: none;
	position: absolute; 
 	z-index: 99; 
 	background-color: white;
 	
}
a {
	cursor: pointer !important;
}
.under_menu_inner {
	justify-content: center;
}
 /* 관리자 페이지 버튼 */
 .admin_btn {
 	font-size: 14px !important;
 	font-family: 'Pretendard-Regular' !important;
 	width: 100px;
 	height: 20px;
 	align-content: center;
 	align-items: center;
 	display: flex;

 
 }
</style>
</head>
<body>
   <!-- Header -->
    <header>
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="/main.do">
               <img src="/assets/img/logo.png" width="150px">
            </a>
            
           

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link">커뮤니티
                            	<ul class="under_menu">
                            		<li class="under_menu_inner"><a  href="/review/main">리뷰 및 추천</a></li>
                            	</ul>
                            </a>

                        </li>
                        <li class="nav-item">
                            <a class="nav-link">동행
                            	<ul class="under_menu">
                            		<li class="under_menu_inner"><a  href="/us/list">동행 모집</a></li>
                            		<li class="under_menu_inner"><a class="nav-link" href="/schedule/list">일정 공유</a></li>
                            	</ul>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.html">고객센터</a>
                        </li>
                        <!-- 로그인 유무 -->
	                    <li class="nav-item">
                        <c:choose>
                        	  <c:when test="${empty principal}">
                            <a class="nav-link" href="/member/loginForm.do">로그인 </a>
                        	</c:when>
                        	 <c:otherwise>
                        	 <a class="nav-link" href="/logout.do">로그아웃</a>
                        	</c:otherwise>
                        </c:choose>
                       </li>

                    </ul>
                </div>
                <div class="navbar align-self-center d-flex" style="width: 200px">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
					

					
					<!-- 버튼 영역에 대한 div  -->
					<c:choose>
					<c:when test="${!empty principal}">
						<div class="btn_div">
						<button class="nav-icon position-relative text-decoration-none" onclick="openModal('friend-list-modal')">
						    <i class="fa-solid fa-user-group"></i>
						</button>
						<button class="nav-icon position-relative text-decoration-none" onclick="openModal('message-modal')">
						    <i class="fa-regular fa-message"></i>
						    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
						</button>
						<button class="nav-icon position-relative text-decoration-none" onclick="openBell()">
						    <i class="fa-regular fa-bell"></i>
						    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+20</span>
						</button>
						<button class="nav-icon position-relative text-decoration-none" onclick="openUserProfile()">
						    <i class="fa-regular fa-user"></i>    
					</button>
					<c:if test="${principal.user.roles=='Admin'}">
						<a class="admin_btn" href="/admin">	
							<img src="/assets/img/key.png" width="25px">관리자
						</a>
					</c:if>
					</div>
					</c:when>
					 <c:otherwise>
						<div class="btn_div"></div>
					</c:otherwise>
					</c:choose>

            </div>
        </div>
        </div>
    </nav>
    </header>
    <!-- Close Header -->
    

    <!-- page-wrapper 가 닫히는 div 밑에 놔두면 됨 -->
    <!-- START 친구 목록 / 친구 요청 모달 팝업창 -->
    <div id="friend-list-modal" class="modal-wrapper">
      <div class="modal-overlay" onclick="closeModal('friend-list-modal')"></div>

      <div class="common-modal narrow-modal">
        <!-- 닫기버튼 -->
        <button type="button" class="icon-btn close-btn" onclick="closeModal('friend-list-modal')">
          <img src="/assets/sns/images/icon-close.svg" alt="">
        </button>
        <!-- END 닫기버튼 -->

        <!-- 친구이름 검색 & 채팅초대 버튼 -->
        <div class="friend-modal-hd">
          <input type="text" class="search-inp" placeholder="이름을 검색하세요.." />
          <button class="btn" onclick="openModal('chat-invite-modal')">
            <img src="/assets/sns/images/message-circle-plus.svg" alt="" class="icon">
          </button>
        </div>
        <!-- END 친구이름 검색 & 채팅초대 버튼 -->

        <!-- 친구 목록과 / 친구 요청 탭 버튼 -->
        <div class="friend-modal-tabs">
          <!-- ↓ 활성화된 탭은 active 달면 됨 -->
          <div class="friend-modal-tab active" data-show="tab-friend-list">
            <p>친구 <span>200</span>명</p>
          </div>
          <div class="friend-modal-tab" data-show="tab-friend-invite">
            친구요청
          </div>
        </div>
        <!-- END 친구 목록과 / 친구 요청 탭 버튼 -->

        <!-- 친구 목록과 / 친구 요청 탭 컨텐츠 -->
        <div class="friend-modal-contents">
          <!-- 01) 친구목록 -->
          <div id="tab-friend-list" class="friend-modal-content active">
            <div class="friend-list-grp">
              <!-- 친구 -->
              <!-- ↓ 만약에 활동중이면 status-active 클래스 달면 됨. status-active 클래스 달을 경우 좌측에 초록 동그라미가 뜸. -->
              <div class="friend-list status-active">
                <!-- 친구 프사 & 이름 -->
                <div class="person-item">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img.jpeg" alt="">
                  </figure>
                  <div class="person-profile">
                    <div class="name-wrap">
                      <h6 class="name">choi_seung_hyun_tttop</h6>
                      <!-- 블루뱃지 -->
                      <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                    </div>
                    <p class="intro-txt">소개글입니다.</p>
                  </div>
                </div>
                <!-- END 친구 프사 & 이름 -->

                <!-- 메세지 보내기 & 삭제 버튼 -->
                <div class="btn-wrap">
                  <button type="button" class="btn blue-btn">메세지 보내기</button>
                  <button type="button" class="btn gray-btn">삭제</button>
                </div>
                <!-- END 메세지 보내기 & 삭제 버튼 -->
              </div>

              <!-- 친구 -->
              <!-- ↓ 만약에 활동중이면 status-active 클래스 달면 됨. status-active 클래스 달을 경우 좌측에 초록 동그라미가 뜸. -->
              <div class="friend-list status-active">
                <!-- 친구 프사 & 이름 -->
                <div class="person-item">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img.jpeg" alt="">
                  </figure>
                  <div class="person-profile">
                    <div class="name-wrap">
                      <h6 class="name">choi_seung_hyun_tttop</h6>
                      <!-- 블루뱃지 -->
                      <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                    </div>
                    <p class="intro-txt">소개글입니다.</p>
                  </div>
                </div>
                <!-- END 친구 프사 & 이름 -->

                <!-- 메세지 보내기 & 삭제 버튼 -->
                <div class="btn-wrap">
                  <button type="button" class="btn blue-btn">메세지 보내기</button>
                  <button type="button" class="btn gray-btn">삭제</button>
                </div>
                <!-- END 메세지 보내기 & 삭제 버튼 -->
              </div>
              
              <!-- ↓ 만약에 활동중이면 status-active 클래스 달면 됨. status-active 클래스 달을 경우 좌측에 초록 동그라미가 뜸. -->
              <div class="friend-list status-active">
              <!-- 친구 프사 & 이름 -->
                <div class="person-item">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/mouse.jpg" alt="">
                  </figure>
                  <div class="person-profile">
                    <div class="name-wrap">
                      <h6 class="name">쥐</h6>
                      <!-- 블루뱃지 -->
                      <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                    </div>
                    <p class="intro-txt">나는 쥐</p>
                  </div>
                </div>
                <!-- END 친구 프사 & 이름 -->

                <!-- 메세지 보내기 & 삭제 버튼 -->
                <div class="btn-wrap">
                  <button type="button" class="btn blue-btn">메세지 보내기</button>
                  <button type="button" class="btn gray-btn">삭제</button>
                </div>
                <!-- END 메세지 보내기 & 삭제 버튼 -->
              </div>
            </div>
          </div>
          <!-- END 01) 친구목록 -->

          <!-- 02) 친구요청 탭 -->
          <div id="tab-friend-invite" class="friend-modal-content">
            <div class="friend-list-grp">
              <!-- 친구 -->
              <div class="friend-list">
                <!-- 친구 프사 & 이름 -->
                <div class="person-item">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img-jessica.png" alt="">
                  </figure>
                  <div class="person-profile">
                    <div class="name-wrap">
                      <h6 class="name">jessica</h6>
                      <!-- 블루뱃지 -->
                      <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                    </div>
                    <p class="intro-txt">제시카입니다</p>
                  </div>
                </div>
                <!-- END 친구 프사 & 이름 -->

                <!-- 확인 & 요청 삭제 버튼 -->
                <div class="btn-wrap">
                  <button type="button" class="btn blue-btn">확인</button>
                  <button type="button" class="btn gray-btn">요청 삭제</button>
                </div>
                <!-- END 확인 & 요청 삭제 버튼 -->
              </div>

              <!-- 친구 -->
              <div class="friend-list">
                <!-- 친구 프사 & 이름 -->
                <div class="person-item">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img-default.png" alt="">
                  </figure>
                  <div class="person-profile">
                    <div class="name-wrap">
                      <h6 class="name">minisooni</h6>
                      <!-- 블루뱃지 -->
                      <!-- <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt=""> -->
                    </div>
                    <p class="intro-txt">미니수니</p>
                  </div>
                </div>
                <!-- END 친구 프사 & 이름 -->

                <!-- 확인 & 요청 삭제 버튼 -->
                <div class="btn-wrap">
                  <button type="button" class="btn blue-btn">확인</button>
                  <button type="button" class="btn gray-btn">요청 삭제</button>
                </div>
                <!-- END 확인 & 요청 삭제 버튼 -->
              </div>
            </div>
          </div>
          <!-- END 02) 친구요청 -->
        </div>
        <!-- END 친구 목록과 / 친구 요청 탭 컨텐츠 -->
      </div>
    </div>
    <!-- END 친구 목록 / 친구 요청 모달 팝업창 -->

    <!-- 2. 채팅 초대 모달 팝업창 -->
    <div id="chat-invite-modal" class="modal-wrapper">
      <div class="modal-overlay" onclick="closeChatModal('chat-invite-modal')"></div>

      <div class="common-modal narrow-modal">
        <!-- 닫기버튼 -->
        <button type="button" class="icon-btn close-btn" onclick="closeChatModal('chat-invite-modal')">
          <img src="/assets/sns/images/icon-close.svg" alt="">
        </button>
        <!-- END 닫기버튼 -->

        <!-- 팝업 제목 -->
        <div class="common-modal-ttl">
          <h3>대화상대 선택</h3>
        </div>
        <!-- END 팝업 제목 -->

        <!-- 스크롤 영역 -->
        <div class="chat-modal-content">
          <!-- 친구이름 검색 -->
          <div class="friend-modal-hd">
            <input type="text" class="search-inp" placeholder="이름을 검색하세요.." />
          </div>
          <!-- END 친구이름 검색 -->

          <div class="gray-txt-wrap">
            <h6 class="gray-txt">친구 <span>3</span>명</h6>
          </div>

          <!-- 친구 목록 -->
          <div class="friend-list-grp">
            <!-- 친구 -->
            <!-- * 중요 * 아래의 checkbox input과 바로 뒤의 label 태그 friend-list는 세트 -->
            <input type="checkbox" name="chat-friend" id="friend01" class="friend-list-checkbox">
            <label class="friend-list" for="friend01">
              <!-- 친구 프사 & 이름 -->
              <span class="person-item">
                <span class="mini-thumnail">
                  <img src="/assets/sns/images/profile-img.jpeg" alt="">
                </span>
                <span class="person-profile">
                  <span class="name-wrap">
                    <span class="name">choi_seung_hyun_tttop</span>
                    <!-- 블루뱃지 있을 경우 하단 주석을 푸세요 -->
                    <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                  </span>
                </span>
              </span>
              <!-- END 친구 프사 & 이름 -->

              <!-- 체크박스 -->
              <span class="checkbox"></span>
              <!-- END 체크박스 -->
            </label>

            <!-- 친구 -->
            <!-- * 중요 * 아래의 checkbox input과 바로 뒤의 label 태그 friend-list는 세트 -->
            <input type="checkbox" name="chat-friend" id="friend02" class="friend-list-checkbox">
            <label class="friend-list" for="friend02">
              <!-- 친구 프사 , 이름 -->
              <span class="person-item">
                <span class="mini-thumnail">
                  <img src="/assets/sns/images/profile-img-jessica.png" alt="">
                </span>
                <span class="person-profile">
                  <span class="name-wrap">
                    <span class="name">jessica</span>
                    <!-- 블루뱃지 -->
                    <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                  </span>
                </span>
              </span>
              <!-- END 친구 프사 & 이름 -->

              <!-- 체크박스 -->
              <span class="checkbox"></span>
              <!-- END 체크박스 -->
            </label>

            <!-- 친구 -->
            <!-- * 중요 * 아래의 checkbox input과 바로 뒤의 label 태그 friend-list는 세트 -->
            <input type="checkbox" name="chat-friend" id="friend03" class="friend-list-checkbox">
            <label class="friend-list" for="friend03">
              <!-- 친구 프사 & 이름 -->
              <span class="person-item">
                <span class="mini-thumnail">
                  <img src="/assets/sns/images/profile-img-default.png" alt="">
                </span>
                <span class="person-profile">
                  <span class="name-wrap">
                    <span class="name">minisooni</span>
                    <!-- 블루뱃지 -->
                    <!-- <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt=""> -->
                  </span>
                </span>
              </span>
              <!-- END 친구 프사 & 이름 -->

              <!-- 체크박스 -->
              <span class="checkbox"></span>
              <!-- END 체크박스 -->
            </label>
          </div>
          <!-- END 친구 목록 -->
        </div>
        <!-- END 스크롤 영역 -->

        <div class="chat-modal-bottom">
          <!-- 선택한 친구가 2명 이상이면 active 클래스가 추가됩니다. -->
          <button id="chat-modal-confirm-btn" type="button" disabled class="btn confirm-btn">확인</button>
          <button type="button" class="btn" onclick="closeChatModal('chat-invite-modal')">취소</button>
        </div>
      </div>
    </div>
    <!-- END 2. 채팅 초대 모달 팝업창 -->
	
	<!-- 메시지 모달 팝업창 -->
<!-- 	<div id="message-modal" class="popCont">
  	모달 오버레이
    <div class="modal-overlay" onclick="cloaseModal('message-modal')"></div>
      		  	
	  	<button type="button" class="popClose" onclick="closeModal('message-modal')">
        <img src="assets/sns/images/xBtn.png" alt="">
      	</button>
	  	
		<div class="messageWrap">			
			<section class="left">
				<section class="messageArea">
					<div class="top">
						<span class="tit">Messages</span>
						<button class="btn" onclick="openModal('chat-invite-modal')">
				          <img src="assets/sns/images/message-circle-plus.svg" alt="초대 아이콘" class="icon">
				        </button>						
					</div>
					<div class="searchWrap1">
						<input type="text" placeholder="닉네임 검색" class="inputTxt">
					</div>
					<div class="messageList">
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv on">
							<div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
					</div>
				</section>
				<section class="friendsList">
					<div class="tab">
						<button type="button" class="friend">
						    <span class="friendIcon">
						      <img src="assets/sns/images/friendBtn.png" alt="친구 아이콘" class="icon2">
						    </span>
						</button>
					</div>
					<div class="searchWrap2">
						<input type="text" placeholder="닉네임 검색" class="inputTxt">
					</div>
					<div class="friendBox">
						<div class="friendDiv">
		
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="friendInfo">
								<p class="nick">Gee</p>
								<p class="txt">Toni Kroos</p>
								<button type="button" class="folBtn">
								    <span class="friendSendMsgBtn">
								      <img src="assets/sns/images/sendMessageBtn.png" alt="전송 아이콘" class="icon">
								    </span>
								</button>
							</div>
						</div>
						<div class="friendDiv">
							
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="friendInfo">
								<p class="nick">Gee</p>
								<p class="txt">Toni Kroos</p>
								<button type="button" class="folBtn">
								    <span class="friendSendMsgBtn">
								      <img src="assets/sns/images/sendMessageBtn.png" alt="전송 아이콘" class="icon">
								    </span>
								</button>
							</div>
						</div>
						
						<div class="friendDiv">
							
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="friendInfo">
								<p class="nick">Gee</p>
								<p class="txt">Toni Kroos</p>
								<button type="button" class="folBtn">
								    <span class="friendSendMsgBtn">
								      <img src="assets/sns/images/sendMessageBtn.png" alt="전송 아이콘" class="icon">
								    </span>
								</button>
							</div>
						</div>
						<div class="friendDiv">
							
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="friendInfo">
								<p class="nick">Gee</p>
								<p class="txt">Toni Kroos</p>
								<button type="button" class="folBtn">
								    <span class="friendSendMsgBtn">
								      <img src="assets/sns/images/sendMessageBtn.png" alt="전송 아이콘" class="icon">
								    </span>
								</button>
							</div>
						</div>
					</div>
				</section>
			</section>
			
			<section class="chatArea">
				<div class="top">
					
					<h3>쥐</h3>
					
				</div>
				<div class="chatWrap">
					<div class="userinfo">
						<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
						<p class="nick">쥐</p>				
					
					</div>
					<div class="chat">
						<div class="rtm"><span>ㅎㅇ</span></div>
						<div class="rtTime"><span>4:43 PMㆍSent</span></div>
						<div class="rtm"><span>머해?</span></div>
						<div class="rtTime"><span>4:44 PMㆍSent</span></div>
						<div class="ltm"><span>그냥있어</span></div>
						<div class="ltTime"><span>4:46 PMㆍreceived</span></div>
					</div>
				</div>

			 	<div class="message-container">
				  <button type="button" class="imgBtn">
				    <span class="addImg">
				      <img src="assets/sns/images/sendMessageBtn.png" alt="이미지 아이콘" class="icon">
				    </span>
				  </button>
				  <div class="message-content">
				    <div class="input_area">
				      <textarea id="message_content" name="message_content" placeholder="내용을 입력하세요"></textarea>		
				    </div>
				  </div>
				  <button type="button" class="sendMessageBtn">
				    <span class="sendIco">
				      <img src="assets/sns/images/sendMessageBtn.png" alt="전송 아이콘" class="icon">
				    </span>
				  </button>
				</div>

				
			</section>
			
		</div>
  	</div> -->
  	<!--END 메시지 모달 팝업창 -->
  	
	
	
	
  <script>
    // 1. 친구 목록에서 탭버튼 활성화
    $(".friend-modal-tab").on('click', function () {
      var showTabContent = $(this).attr('data-show');

      $('.friend-modal-tab').removeClass('active');
      $(this).addClass('active');

      $('.friend-modal-content').removeClass('active');
      $('#' + showTabContent).addClass('active');
    })

    // Modal 열기
    function openModal(id) {
      $('#' + id).addClass('active');
    }

    // Modal 닫기
    function closeModal(id) {
      $('#' + id).removeClass('active');
    }

    // 채팅 초대 친구목록 2명 이상일 시 버튼 활성화
    $('input[name="chat-friend"]').change(function () {
      if ($('input:checkbox[name="chat-friend"]:checked').length >= 2) {
        $('#chat-modal-confirm-btn').addClass('active');
        $('#chat-modal-confirm-btn').attr('disabled', false);
      } else {
        $('#chat-modal-confirm-btn').removeClass('active');
        $('#chat-modal-confirm-btn').attr('disabled', true);
      }
    })

    // 채팅 초대 모달 닫을 때 
    function closeChatModal(id) {
      $('#' + id).removeClass('active');

      // 선택했던 친구목록 초기화
      $('input[name="chat-friend"]').each(function () {
        $(this).prop('checked', false);
      })

      // 검색 입력창 초기화
      $('.chat-modal-content .search-inp').val('');
    }
    
    //마이페이지로 이동
    
    function openUserProfile(){
    	location.href="/member/mypage.do"
    }
  </script>

</body>
</html>