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


      /* 버튼 아이콘의 크기 조절 */
      .nav-icon i {
        font-size: 30px; 
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
              <a class="nav-link" href="/customer/inquiryList">고객센터</a>
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
                <button class="nav-icon position-relative text-decoration-none" onclick="openFriendModal()">
                  <i class="fa-solid fa-user-group"></i>
                  <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill text-dark">
						        <!-- 이미지 파일 경로를 아래 src 속성에 입력 -->
						        <span class="red-circle"></span>
						        </span>
                </button>
                <button class="nav-icon position-relative text-decoration-none" onclick="openChatModal()">
                  <i class="fa-regular fa-message"></i>
<!--                   <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span> -->
                </button>
                <button id = 'alarm-count-button' class="nav-icon position-relative text-decoration-none" onclick="openAlimModal()">
                  <i class="fa-regular fa-bell"></i>

                </button>
                <button class="nav-icon position-relative text-decoration-none" onclick="openUserProfile()">
                  <i class="fa-regular fa-user"></i>
                </button>
                <c:if test="${fn:endsWith(principal.user.member_id, 'admin')}">
                  <a class="admin_btn" href="/admin">
                    <img src="/assets/img/key.png" width="25px" alt="">관리자
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

</div>
<!-- END 친구 목록 / 친구 요청 모달 팝업창 -->




<!--  1. 알림 모달 -->
<div id="alarm-modal" class="modal-wrapper">

</div>
<!-- END  1. 알림 모달 -->


<!--  2-1. 채팅목록 + 채팅창 모달 -->
<div id="chat-modal" class="modal-wrapper">

</div>
<!-- END  2-1. 채팅목록 + 채팅창 모달 -->

<!--  2-3. 채팅창 나가기 모달 -->
<div id="chat-exit-confirm-modal" class="modal-wrapper" >

</div>
<!-- END  2-3. 채팅창 나가기 모달 -->

<!-- 2. 채팅 초대 모달 팝업창 -->
<div id="chat-invite-modal" class="modal-wrapper" >

</div>
<!-- END 2. 채팅 초대 모달 팝업창 -->
<!--  2-4. 그룹채팅방 이름설정 모달 -->
<div id="chat-name-setting-modal" class="modal-wrapper">

</div>
<!-- END  2-4. 그룹채팅방 이름설정 모달 -->



<script>
  // Modal 열기
  function openModal(id) {
    $('#' + id).addClass('active');
  }

  // Modal 닫기
  function closeModal(id) {
    $('#' + id).removeClass('active');

  }

  //마이페이지로 이동
  function openUserProfile(){
    location.href="/member/mypage.do";
  }

  function openInviteModal() {
    $('#chat-invite-modal').load("/page/chat/invite", () => {
      $('#chat-invite-modal').addClass('active');
    });
  }

  function openChatModal(callback) {
    $('#chat-modal').load("/page/chat/modal", () => {
      $('#chat-modal').addClass('active');
      if(callback) callback();
    });
  }

  function chatRegister(roomName, selectedValues){
    let array = [];
    if(!Array.isArray(selectedValues)){
      array.push(selectedValues);
    } else {
      array = selectedValues;
    }
    $.ajax({
      url: '/chat/room',
      method: 'POST',
      contentType: 'application/json',  // C
      data: JSON.stringify({
        roomType: array.length > 1 ? 'group' : 'oneOn1',
        memberIds: array,
        roomName: roomName
      }),
      success : function (data){
        closeModal('chat-name-setting-modal');
        closeModal('chat-invite-modal');


        openChatModal(function(){
          console.log(data);
          openChatDetailModal(data);
        });
      }
    });
  }


  function openFriendModal() {
    $('#friend-list-modal').load("/page/friend/modal", () => {
      $('#friend-list-modal').addClass('active');
    });
  }

  function openAlimModal() {
    $('#alarm-modal').load("/page/alim", () => {
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
            console.log(data);

            if(!data || data <= 0){
              if($(id).length !== 0){
                $(id).remove();
              }
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
        // if(recv.content === )
        callAlim();
        // console.log(z);
      }

      closeModal = function (id) {
        $('#' + id).removeClass('active');
        callAlim();
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
</script>

</body>
</html>