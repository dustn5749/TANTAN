<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri= "http://java.sun.com/jsp/jstl/functions" %>

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
<link rel="stylesheet" href="/assets/sns/css/Modal.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js" integrity="sha512-5yJ548VSnLflcRxWNqVWYeQZnby8D8fJTmYRLyvs445j1XmzR8cnWi85lcHx3CUEeAX+GrK3TqTfzOO6LKDpdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.2.0/stomp.min.js" integrity="sha512-8gcNcTAF0ZFd2LC6OUiO6UMEOhJ5Zejj1CU8XfCsjk2rDdcDudpn013YuTRWQAugs0nh1ixye6c0przHz3oFRw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


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
                            <a class="nav-link" href="/customer/inquiry">고객센터</a>
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
						<button class="nav-icon position-relative text-decoration-none" onclick="openModal('chat-modal')">
						    <i class="fa-regular fa-message"></i>
						    <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
						</button>
						<button id = 'alarm-count-button' class="nav-icon position-relative text-decoration-none" onclick="openAlimModal()">
						    <i class="fa-regular fa-bell"></i>

<%--						    <span id='alarm-count' class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+20</span>--%>
						</button>
						<button class="nav-icon position-relative text-decoration-none" onclick="openUserProfile()">
						    <i class="fa-regular fa-user"></i>    
					</button>
					<c:if test="${fn:endsWith(principal.user.roles, 'Admin')}">
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
                    <p class="intro-txt">소개글</p>
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
                    <p class="intro-txt">소개글</p>
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
          <button id="" type="button" disabled class="btn confirm-btn chat-modal-confirm-btn">확인</button>
          <button type="button" class="btn" onclick="closeChatModal('chat-invite-modal')">취소</button>
        </div>
      </div>
    </div>
    <!-- END 2. 채팅 초대 모달 팝업창 -->
	
	
  	<!--  1. 알림 모달 -->
    <div id="alarm-modal" class="modal-wrapper">

    </div>
    <!-- END  1. 알림 모달 -->

    <!--  2-1. 채팅목록 + 채팅창 모달 -->
    <div id="chat-modal" class="modal-wrapper">
      <div class="modal-overlay" onclick="closeModal('chat-modal')"></div>

      <div class="common-modal narrow-modal chat-modal-container">
        <!-- 채팅목록 -->
        <div id="chat-list" class="chat-list-wrapper">
          <div class="container">
            <div class="container-hd">
              <!-- 제목 + 닫기버튼 -->
              <div class="common-modal-top">
                <h2 class="ttl">대화목록</h2>
                <div class="btn-wrap">
                  <!-- 닫기버튼 -->
                  <button type="button" class="icon-btn" onclick="closeModal('chat-modal')">
                    <img src="/assets/sns/images/icon-close.svg" alt="">
                  </button>
                  <!-- END 닫기버튼 -->
                </div>
              </div>
              <!-- END 제목 + 닫기버튼 -->

              <!-- 친구이름 검색 & 채팅초대 버튼 -->
              <div class="common-search-inp-grp">
                <input type="text" class="search-inp" placeholder="이름을 검색하세요.." />
                <button class="btn" onclick="openModal('chat-invite-modal02')">
                  <img src="/assets/sns/images/message-circle-plus.svg" alt="" class="icon">
                </button>
              </div>
              <!-- END 친구이름 검색 & 채팅초대 버튼 -->

              <!-- 그룹 대화 / 1:1 대화 탭 버튼 -->
              <div class="common-tabs">
                <!-- ↓ 활성화된 탭은 active 달면 돼요 -->
                <div class="tab active" data-show="tab-chat-group">
                  <span class="txt-badge">그룹대화</span>
                </div>
                <div class="tab" data-show="tab-chat-private">
                  <span class="txt-badge">1:1 대화</span>
                </div>
              </div>
              <!-- END 그룹 대화 / 1:1 대화 탭 버튼 -->
            </div>

            <div class="container-content">
              <!-- 탭/그룹대화) 그룹대화시 보이는 내용 -->
              <div id="tab-chat-group" class="common-tab-content chat-list-grp active">
                <!-- 대화 목록 -->
                <div class="chat-list" onclick="chatView('open')">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img-default.png" alt="">
                  </figure>

                  <!-- 대화 목록에서 볼 수 있는 정보들 -->
                  <div class="chat-info-grp">
                    <div class="chat-ttl-wrap">
                      <p>[후쿠오카] 유저1, 유저2, 유저3, 유저4, 유저가 많아질 수록 말줄임 표시</p>
                      <span class="num">13</span>
                    </div>
                    <p class="chat-txt">죄송해요 잘못 보냈습니다.</p>
                    <div class="chat-date">
                      <span class="txt">13일전</span>
                    </div>
                  </div>
                  <!-- END 대화 목록에서 볼 수 있는 정보들 -->
                </div>
                <!-- END 대화 목록 -->

                <!-- 대화 목록 -->
                <div class="chat-list">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img-jessica.png" alt="">
                  </figure>

                  <!-- 대화 목록에서 볼 수 있는 정보들 -->
                  <div class="chat-info-grp">
                    <div class="chat-ttl-wrap">
                      <p>[제주도] favor_list, minisooni</p>
                      <span class="num">2</span>
                    </div>
                    <p class="chat-txt">떠나요 제주로~~</p>
                    <div class="chat-date">
                      <span class="txt">5일전</span>
                    </div>
                  </div>
                  <!-- END 대화 목록에서 볼 수 있는 정보들 -->
                </div>
                <!-- END 대화 목록 -->

                <!-- 대화 목록 -->
                <div class="chat-list">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img.jpeg" alt="">
                  </figure>

                  <!-- 대화 목록에서 볼 수 있는 정보들 -->
                  <div class="chat-info-grp">
                    <div class="chat-ttl-wrap">
                      <p>[유럽] 유럽이조아, 유럽사랑, 유럽낭만</p>
                      <span class="num">3</span>
                    </div>
                    <p class="chat-txt">유럽여행은 요새 어떤가요?</p>
                    <div class="chat-date">
                      <span class="txt">13일전</span>
                    </div>
                  </div>
                  <!-- END 대화 목록에서 볼 수 있는 정보들 -->
                </div>
                <!-- END 대화 목록 -->
              </div>

              <!-- 탭/1:1대화) 1:1 대화시 보이는 내용 -->
              <div id="tab-chat-private" class="common-tab-content chat-list-grp">
                <!-- 대화 목록 -->
                <div class="chat-list">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img-jessica.png" alt="">
                  </figure>

                  <!-- 대화 목록에서 볼 수 있는 정보들 -->
                  <div class="chat-info-grp">
                    <div class="chat-ttl-wrap">
                      <p>choi_seung_hyun_tttop - jessica</p>
                      <span class="num">2</span>
                    </div>
                    <p class="chat-txt">시카야 안녕?</p>
                    <div class="chat-date">
                      <span class="txt">1일전</span>
                    </div>
                  </div>
                  <!-- END 대화 목록에서 볼 수 있는 정보들 -->
                </div>
                <!-- END 대화 목록 -->

                <!-- 대화 목록 -->
                <div class="chat-list">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img-default.png" alt="">
                  </figure>

                  <!-- 대화 목록에서 볼 수 있는 정보들 -->
                  <div class="chat-info-grp">
                    <div class="chat-ttl-wrap">
                      <p>choi_seung_hyun_tttop - 유럽이조아</p>
                      <span class="num">2</span>
                    </div>
                    <p class="chat-txt">유럽 여행하기 좀 예산이 부족한데.... 얼마정도가 괜찮을까요? 길게 보내면 말줄임표가 뜨구.. 2줄 이상 안보입니다.</p>
                    <div class="chat-date">
                      <span class="txt">5일전</span>
                    </div>
                  </div>
                  <!-- END 대화 목록에서 볼 수 있는 정보들 -->
                </div>
                <!-- END 대화 목록 -->

                <!-- 대화 목록 -->
                <div class="chat-list">
                  <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img-default.png" alt="">
                  </figure>

                  <!-- 대화 목록에서 볼 수 있는 정보들 -->
                  <div class="chat-info-grp">
                    <div class="chat-ttl-wrap">
                      <p>choi_seung_hyun_tttop - mini-thumnail</p>
                      <span class="num">2</span>
                    </div>
                    <p class="chat-txt">제주도보다 유럽이 괜찮지않나요?</p>
                    <div class="chat-date">
                      <span class="txt">13일전</span>
                    </div>
                  </div>
                  <!-- END 대화 목록에서 볼 수 있는 정보들 -->
                </div>
                <!-- END 대화 목록 -->
              </div>
            </div>
          </div>
        </div>
        <!-- END 채팅목록 -->

        <!-- 채팅창 -->
        <div id="chat-view" class="chat-view-wrapper">
          <div class="container">
            <div class="container-hd">
              <!-- 뒤로가기버튼 + 제목 + 목록버튼 -->
              <div class="common-modal-top">
                <div class="left-ttl-wrap">
                  <!-- 뒤로가기버튼 -->
                  <button type="button" class="icon-btn" onclick="chatView('close')">
                    <img src="/assets/sns/images/icon-chevron-left.svg" alt="">
                  </button>
                  <!-- END 뒤로가기버튼 -->

                  <div class="ttl">
                    <p>[동행] 유저1, 유저2, 유저3, 유저4</p>
                    <span class="num">2</span>
                  </div>
                </div>
                <div class="btn-wrap">
                  <!-- 목록버튼 -->
                  <button type="button" class="icon-btn" onclick="chatParticipants('open');">
                    <img src="/assets/sns/images/icon-list-black.svg" alt="">
                  </button>
                  <!-- END 목록버튼 -->
                </div>
              </div>
              <!-- END 뒤로가기버튼 + 제목 + 목록버튼 -->
            </div>

            <div class="container-content">
              <!-- 채팅화면 -->
              <div id="chat-view-scroll" class="chat-view">
                <!-- 상태 텍스트 (날짜나 들어올 때 / 나갈 때) -->
                <div class="status-txt">
                  2023년 10월 24일
                </div>
                <!-- END 상태 텍스트 (날짜나 들어올 때 / 나갈 때) -->
                <!-- 상태 텍스트 (날짜나 들어올 때 / 나갈 때) -->
                <div class="status-txt">
                  choi_seung_hyun_tttop님이 들어왔습니다.
                </div>
                <!-- END 상태 텍스트 (날짜나 들어올 때 / 나갈 때) -->

                <!-- 대화 말풍선 -->
                <div class="chat-bubble-wrapper">
                  <div class="chat-bubble-grp">
                    <!-- 상대방 프사 (본인일 때는 안보임) -->
                    <figure class="mini-thumnail">
                      <img src="/assets/sns/images/profile-img-default.png" alt="">
                    </figure>
                    <!-- END 상대방 프사 (본인일 때는 안보임) -->

                    <!-- 말풍선 & 보낸시간 -->
                    <div class="chat-bubble">
                      <!-- 닉네임 (본인일 때는 안보임) -->
                      <div class="name-wrap">
                        <h6 class="name">minisooni</h6>
                        <!-- 블루뱃지 -->
                        <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                      </div>
                      <!-- END 닉네임 (본인일 때는 안보임) -->

                      <div class="bubble-wrap">
                        <div class="bubble">안녕하세요! 여행 일정이 어떻게 되실까요?</div>
                        <span class="date">오후 6:46</span>
                      </div>
                    </div>
                    <!-- END 말풍선 & 보낸시간 -->
                  </div>
                </div>
                <!-- END 대화 말풍선 -->

                <!-- 대화 말풍선 -->
                <!-- *** 보내는 사람일 때는 send 클래스가 붙음. -->
                <div class="chat-bubble-wrapper send">
                  <div class="chat-bubble-grp">
                    <!-- 상대방 프사 (본인일 때는 안보임) -->
                    <!-- <figure class="mini-thumnail">
                      <img src="/assets/sns/images/profile-img-default.png" alt="">
                    </figure> -->
                    <!-- END 상대방 프사 (본인일 때는 안보임) -->

                    <!-- 말풍선 & 보낸시간 -->
                    <div class="chat-bubble">
                      <!-- 닉네임 (본인일 때는 안보임) -->
                      <!-- <div class="name-wrap">
                        <h6 class="name">minisooni</h6>
                      </div> -->
                      <!-- END 닉네임 (본인일 때는 안보임) -->

                      <div class="bubble-wrap">
                        <div class="bubble">죄송하지만...</div>
                        <span class="date">오후 6:47</span>
                      </div>
                    </div>
                    <!-- END 말풍선 & 보낸시간 -->
                  </div>
                </div>
                <!-- *** 보내는 사람일 때는 send 클래스가 붙음. -->
                <!-- END 대화 말풍선 -->

                <!-- 대화 말풍선 -->
                <!-- *** 보내는 사람일 때는 send 클래스가 붙음. -->
                <div class="chat-bubble-wrapper send">
                  <div class="chat-bubble-grp">
                    <!-- 상대방 프사 (본인일 때는 안보임) -->
                    <!-- <figure class="mini-thumnail">
                      <img src="/assets/sns/images/profile-img-default.png" alt="">
                    </figure> -->
                    <!-- END 상대방 프사 (본인일 때는 안보임) -->

                    <!-- 말풍선 & 보낸시간 -->
                    <div class="chat-bubble">
                      <!-- 닉네임 (본인일 때는 안보임) -->
                      <!-- <div class="name-wrap">
                        <h6 class="name">minisooni</h6>
                      </div> -->
                      <!-- END 닉네임 (본인일 때는 안보임) -->

                      <div class="bubble-wrap">
                        <div class="bubble">아직 여행일정을 짜지 못했습니다 ㅠㅠ</div>
                        <span class="date">오후 6:48</span>
                      </div>
                    </div>
                    <!-- END 말풍선 & 보낸시간 -->
                  </div>
                </div>
                <!-- *** 보내는 사람일 때는 send 클래스가 붙음. -->
                <!-- END 대화 말풍선 -->

                <!-- 대화 말풍선 -->
                <div class="chat-bubble-wrapper">
                  <div class="chat-bubble-grp">
                    <!-- 상대방 프사 (본인일 때는 안보임) -->
                    <figure class="mini-thumnail">
                      <img src="/assets/sns/images/profile-img-default.png" alt="">
                    </figure>
                    <!-- END 상대방 프사 (본인일 때는 안보임) -->

                    <!-- 말풍선 & 보낸시간 -->
                    <div class="chat-bubble">
                      <!-- 닉네임 (본인일 때는 안보임) -->
                      <div class="name-wrap">
                        <h6 class="name">minisooni</h6>
                        <!-- 블루뱃지 -->
                        <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                      </div>
                      <!-- END 닉네임 (본인일 때는 안보임) -->

                      <div class="bubble-wrap">
                        <div class="bubble">그러시군요 ㅠㅠ</div>
                        <span class="date">오후 6:50</span>
                      </div>
                    </div>
                    <!-- END 말풍선 & 보낸시간 -->
                  </div>
                </div>
                <!-- END 대화 말풍선 -->                
              </div>
              <!-- END 채팅화면 -->

              <!-- 채팅 입력 -->
              <div class="chat-create">
                <button type="button" class="btn file-btn">
                  <img src="/assets/sns/images/icon-file-blue.svg" alt="">
                </button>

                <div class="create-wrap">
                  <textarea id="chat-textarea" rows="1" data-autoresize placeholder="대화를 입력하세요..."
                    class="textarea"></textarea>
                  <button type="button" class="btn send-btn" disabled>
                    <img src="/assets/sns/images/icon-send-before.svg" alt="" class="icon icon-before">
                    <img src="/assets/sns/images/icon-send-after.svg" alt="" class="icon icon-after">
                  </button>
                </div>
              </div>
              <!-- END 채팅 입력 -->
            </div>
          </div>
        </div>
        <!-- END 채팅창 -->

        <!-- 채팅참여자 목록 -->
        <div id="chat-participants" class="chat-participants-wrapper">
          <div class="overlay" onclick="chatParticipants('close');"></div>

          <div class="container">
            <div class="container-hd">
              <!-- 제목 + 닫기버튼 -->
              <div class="common-modal-top">
                <div class="left-ttl-wrap">
                  <div class="ttl">
                    <p>[동행] 유저1, 유저2, 유저3, 유저4</p>
                    <span class="num">2</span>
                  </div>
                </div>
                <div class="btn-wrap">
                  <!-- 닫기버튼  -->
                  <button type="button" class="icon-btn" onclick="chatParticipants('close');">
                    <img src="/assets/sns/images/icon-close.svg" alt="">
                  </button>
                  <!-- END 닫기버튼  -->
                </div>
              </div>
              <!-- END 제목 + 닫기버튼  -->
            </div>

            <div class="container-content">
              <div class="ptc-count-view">
                <span class="txt">현재 대화 참여자 2명</span>
              </div>
              <div class="ptc-list-view">
                <div class="friend-list-grp">
                  <!-- 친구 -->
                  <!-- ↓ 만약에 활동중이면 status-active 클래스 달면 돼요! status-active 클래스 달을 경우 좌측에 초록 동그라미 뜹니다. -->
                  <div class="friend-list status-active">
                    <!-- 친구 프사 & 이름 -->
                    <div class="person-item">
                      <figure class="mini-thumnail">
                        <img src="/assets/sns/images/profile-img.jpeg" alt="">
                      </figure>
                      <div class="person-profile">
                        <div class="name-wrap">
                          <h6 class="name">choi_seung_hyun_tttop</h6>
                          <!-- 블루뱃지 있을 경우 하단 주석을 푸세요 -->
                          <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                        </div>
                      </div>
                    </div>
                    <!-- END 친구 프사 & 이름 -->

                    <!-- 버튼 -->
                    <div class="btn-wrap">
                      <button type="button" class="btn blue-btn" onclick="openModal('chat-exit-confirm-modal')">나가기</button>
                    </div>
                    <!-- END 버튼 -->
                  </div>

                  <!-- 친구 -->
                  <!-- ↓ 만약에 활동중이면 status-active 클래스 달면 돼요! status-active 클래스 달을 경우 좌측에 초록 동그라미 뜹니다. -->
                  <div class="friend-list status-active">
                    <!-- 친구 프사 & 이름 -->
                    <div class="person-item">
                      <figure class="mini-thumnail">
                        <img src="/assets/sns/images/profile-img-default.png" alt="">
                      </figure>
                      <div class="person-profile">
                        <div class="name-wrap">
                          <h6 class="name">minisooni</h6>
                          <!-- 블루뱃지 있을 경우 하단 주석을 푸세요 -->
                          <!-- <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt=""> -->
                        </div>
                      </div>
                    </div>
                    <!-- END 친구 프사 & 이름 -->

                    <!-- 버튼 -->
                    <div class="btn-wrap">
                      <button type="button" class="btn blue-btn">1:1 대화</button>
                    </div>
                    <!-- END 버튼 -->
                  </div>
                </div>
              </div>
              <div class="ptc-btn-view">
                <button type="button" class="btn go-list-btn" onclick="chatParticipants('go-list')">목록으로</button>
              </div>
            </div>
          </div>
        </div>
        <!-- END 채팅참여자 목록 -->
      </div>
    </div>
    <!-- END  2-1. 채팅목록 + 채팅창 모달 -->

    <!--  2-2. 채팅 초대 모달 -->
    <div id="chat-invite-modal02" class="modal-wrapper">
      <div class="modal-overlay" onclick="closeChatModal('chat-invite-modal02')"></div>

      <div class="common-modal narrow-modal">
        <!-- 닫기버튼 -->
        <button type="button" class="icon-btn close-btn" onclick="closeChatModal('chat-invite-modal02')">
          <img src="/assets/sns/images/icon-close.svg" alt="">
        </button>
        <!-- END 닫기버튼 -->

        <!-- 팝업 제목 -->
        <div class="common-modal-ttl">
          <h3>그룹대화 상대 선택</h3>
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
            <input type="checkbox" name="chat-friend" id="chatfriend01" class="friend-list-checkbox">
            <label class="friend-list" for="chatfriend01">
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
            <input type="checkbox" name="chat-friend" id="chatfriend02" class="friend-list-checkbox">
            <label class="friend-list" for="chatfriend02">
              <!-- 친구 프사 & 이름 -->
              <span class="person-item">
                <span class="mini-thumnail">
                  <img src="/assets/sns/images/profile-img-jessica.png" alt="">
                </span>
                <span class="person-profile">
                  <span class="name-wrap">
                    <span class="name">jessica</span>
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
            <!-- * 중요 * 아래의 checkbox input과 바로 뒤의 label 태그 friend-list는 세트-->
            <input type="checkbox" name="chat-friend" id="chatfriend03" class="friend-list-checkbox">
            <label class="friend-list" for="chatfriend03">
              <!-- 친구 프사 & 이름 -->
              <span class="person-item">
                <span class="mini-thumnail">
                  <img src="/assets/sns/images/profile-img-default.png" alt="">
                </span>
                <span class="person-profile">
                  <span class="name-wrap">
                    <span class="name">minisooni</span>
                    <!-- 블루뱃지 있을 경우 하단 주석을 푸세요 -->
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
          <button id="" type="button" disabled class="btn confirm-btn chat-modal-confirm-btn">확인</button>
          <button type="button" class="btn" onclick="closeChatModal('chat-invite-modal02')">취소</button>
        </div>
      </div>
    </div>
    <!-- END  2-2. 채팅 초대 모달 -->

    <!--  2-3. 채팅창 나가기 모달 -->
    <div id="chat-exit-confirm-modal" class="modal-wrapper">
      <div class="modal-overlay" onclick="closeChatModal('chat-exit-confirm-modal')"></div>

      <div class="common-modal system-modal">
        <h6 class="system-modal-hd">채팅방 나가기</h6>
        <div class="system-modal-content">
          <p class="txt">[동행] 후쿠오카 10.28-10.31 동행모집에서 나가시겠습니까?</p>
        </div>
        <div class="system-modal-btn-wrap">
          <button type="button" class="btn gray-btn" onclick="closeChatModal('chat-exit-confirm-modal')">취소</button>
          <button type="button" class="btn blue-btn">확인</button>
        </div>
      </div>
    </div>
    <!-- END  2-3. 채팅창 나가기 모달 -->
	
	
	
  <script>
    // 친구 목록에서 탭버튼 활성화
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
        $('.chat-modal-confirm-btn').addClass('active');
        $('.chat-modal-confirm-btn').attr('disabled', false);
      } else {
        $('.chat-modal-confirm-btn').removeClass('active');
        $('.chat-modal-confirm-btn').attr('disabled', true);
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
    
 	// 대화 그룹대화 / 1:1대화 목록에서 탭버튼 활성화
    $(".common-tabs .tab").on('click', function () {
      var showTabContent = $(this).attr('data-show');

      $('.common-tabs .tab').removeClass('active');
      $(this).addClass('active');

      $('.common-tab-content').removeClass('active');
      $('#' + showTabContent).addClass('active');
    })

    // 채팅창에서 입력할 때 높이 높아지는거
    $('#chat-textarea').on('input', function () {
      if ($(this).val()) {
        $(this).siblings('.send-btn').addClass('active');
        $(this).siblings('.send-btn').attr('disabled', false);
      } else {
        $(this).siblings('.send-btn').removeClass('active');
        $(this).siblings('.send-btn').attr('disabled', true);
      }
    })

    // 채팅참여자 목록 모달 열고닫기 기능
    function chatParticipants(status) {
      var view = $('#chat-participants');
      if (status === 'open') {
        if (view.hasClass('inactive')) {
          view.removeClass('inactive');
        }

        view.addClass('active');
      }

      if (status === 'close') {
        view.addClass('inactive');
      }

      if (status === 'go-list') {
        view.addClass('inactive');
        chatView('close');
      }
    }

    // 채팅창 열고닫기 기능
    function chatView(status) {
      var view = $('#chat-view');

      if (status === 'open') {
        view.addClass('active');
      }

      if (status === 'close') {
        view.removeClass('active');
      }
    }
    
 	//textarea resize 기능
    $('textarea[data-autoresize]').each(function () {
      var offset = this.offsetHeight - this.clientHeight;

      var resizeTextarea = function (el) {
        $(el).css('height', 'auto').css('height', el.scrollHeight + offset);
      };

      $(this).on('keyup input', function () { resizeTextarea(this); }).removeAttr('data-autoresize');
    })
    
    
    
    
    //마이페이지로 이동
    
    function openUserProfile(){
    	location.href="/member/mypage.do"
    }

    function openAlimModal() {
      $('#alarm-modal').load("/page/alim", "", () => {
        $('#alarm-modal').addClass('active');
      });
    }

    $(function(){
      <c:if test="${not empty principal}">
      let memberId = '${principal.user.member_id}';
      if(memberId !== ''){

        const callAlim = () => {
          let url = '/alim/count';
          let id = '#alarm-count';
          $.ajax({
            url : url,
            success : function (data){
              if(!data || data <= 0){
                return false;
              }

              if($(id).length === 0){
                $('<span>').attr({
                  'id' : 'alarm-count',
                  'class' : 'position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark'
                }).text('+'+data).data({ 'value' : data}).appendTo($('#alarm-count-button'));
              } else {
                $(id).text('+'+data).data({ 'value' : data});
              }
            }
          });
        };

        callAlim();


        // websocket & stomp 초기화
        const sock = new SockJS("<c:url value='/ws-stomp'/>");
        const ws = Stomp.over(sock);

        //메시지 수신 이벤트 핸들러 등록
        //구독을 등록한다
        const subscribe = () => {
          subscription = ws.subscribe("<c:url value='/sub/alim/'/>"+memberId
                  , message => {
                    const recv = JSON.parse(message.body);
                    recvMessage(recv);
                  }, {}
          );
        }

        const recvMessage = recv =>  {
          callAlim();
          console.log(recv);
        }


        //메시지 수신를 해제 한다
        //구독을 해제한다
        const unsubscribe = () => {
          console.log("subscription", subscription);

          if(subscription != null) {
            subscription.unsubscribe();
            subscription = null;
          }
        }

        let subscription = null;

        console.log("ws", ws);
        // pub/sub 이벤트 설정
        ws.connect({}, function(frame) {
          //메시지 수신 이벤트 핸들러 등록
          subscribe();
        }, error => {
          // alert("error " + error);
        });

      }
      </c:if>

    });
  </script>

</body>
</html>