<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" as="style" crossorigin
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css"/>
    <link rel="stylesheet" href="/assets/sns/css/profileReset.css">
    <link rel="stylesheet" href="/assets/sns/css/proflieStyle.css">

    <script src="/assets/js/jquery-1.11.0.min.js"></script>
</head>

<body>
<div id="app">
    <!--     <header class="header"> -->
    <!--       <div class="header-inner"> -->
    <!--         <h1 class="logo"> -->
    <!--           <a href="#"> -->
    <!--             <img src="/assets/sns/images/logo.png" alt=""> -->
    <!--           </a> -->
    <!--         </h1> -->

    <!--         <div class="header-menu"> -->
    <!--           <button type="button" class="hd-btn"> -->
    <!--             <span class="txt-hidden">친구</span> -->
    <!--             <img src="/assets/sns/images/icon-users.svg" alt="" class="icon"> -->
    <!--           </button> -->

    <!--           <button type="button" class="hd-btn"> -->
    <!--             <span class="txt-hidden">메세지</span> -->
    <!--             <img src="/assets/sns/images/icon-mail.svg" alt="" class="icon"> -->
    <!--           </button> -->

    <!--           <button type="button" class="hd-btn"> -->
    <!--             <span class="txt-hidden">알림</span> -->
    <!--             <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon"> -->
    <!--           </button> -->

    <!--           <button type="button" class="hd-btn hd-mypage-btn"> -->
    <!--             <span class="txt-hidden">마이페이지</span> -->
    <!--             <img src="/assets/sns/images/icon-user-filled.svg" alt="" class="icon"> -->
    <!--           </button> -->
    <!--         </div> -->
    <!--       </div> -->
    <!--     </header> -->
    <!--좌측의 사이드바 -->
    <div class="sidebar-wrapper">
        <div class="sidebar">
            <div class="sidebar-inner">
                <div class="sidebar-menu">
                    <!--사이드바 버튼들 -->
                    <button type="button" class="sidebar-btn active">
                        <img src="/assets/sns/images/icon-home.svg" alt="" class="icon">
                        <span class="txt">홈</span>
                    </button>
                    <button type="button" class="sidebar-btn active">
                        <img src="/assets/sns/images/icon-brand-safari.svg" alt="" class="icon">
                        <span class="txt">일정</span>
                    </button>
                    <button type="button" class="sidebar-btn active">
                        <img src="/assets/sns/images/icon-send.svg" alt="" class="icon">
                        <span class="txt">메세지</span>
                    </button>
                    <button type="button" class="sidebar-btn active">
                        <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon">
                        <span class="txt">알림</span>
                    </button>
                    <button type="button" class="sidebar-btn active">
                        <img src="/assets/sns/images/icon-bookmark-filled.svg" alt="" class="icon">
                        <span class="txt">저장됨</span>
                    </button>
                    <button type="button" class="sidebar-btn active">
                        <img src="/assets/sns/images/icon-activity.svg" alt="" class="icon">
                        <span class="txt">내 활동</span>
                    </button>
                    <button type="button" class="sidebar-btn active">
                        <figure class="mini-thumnail">
                            <img src="/assets/sns/images/profile-img.jpeg" alt="">
                        </figure>
                        <span class="txt">프로필</span>
                    </button>
                </div>

                <div class="sidebar-menu">
                    <!--             <button type="button" class="sidebar-btn active"> -->
                    <!--               <img src="/assets/sns/images/icon-list.svg" alt="" class="icon"> -->
                    <!--               <span class="txt">더보기</span> -->
                    <!--             </button> -->
                </div>
            </div>
        </div>
    </div>
    <!-- 메인 컨텐츠 영역 -->
    <div class="page-wrapper">
        <!--상단 프로필 영역 -->
        <div class="page-container profile-page">
            <div class="profile-top">
                <!--상단 프로필 영역 중 왼쪽 부분 -->
                <div class="profile-top-left">
                    <figure class="thumbnail">
                     <c:choose>
                       <c:when test="${empty principal.user.profile_img}">
                          <img alt="" src="/assets/sns/images/profile-img-default.png">
                       </c:when>
                       <c:otherwise>
                          <img src="<c:out value='${principal.user.profile_img}'/>" alt="">                      
                       </c:otherwise>
                 </c:choose>
                    </figure>

                    <div class="profile-info">
                        <div class="name">
                            <h2>
                                <span>${principal.user.nickname}</span>
                                <img src="/assets/sns/images/badge-certify.svg" alt="" class="badge-certify">
                            </h2>
                            <button type="button" class="btn solid-btn blue-btn">메세지 보내기</button>
                        </div>
                        <div class="info01">
                            <dl>
                                <dt>게시물</dt>
                                <dd>88</dd>
                            </dl>
                            <dl>
                                <dt>친구수</dt>
                                <dd>105</dd>
                            </dl>
                            <dl>
                                <dt>팔로우</dt>
                                <dd>1</dd>
                            </dl>
                        </div>
                        <div class="info02">
                            <p>안녕하세요~</p>
                        </div>
                        <div class="btn-wrap">
                            <button type="button" class="btn solid-btn blue-btn">친구 추가</button>
                            <button type="button" class="btn solid-btn gray-btn">프로필 편집</button>
                        </div>
                    </div>
                </div>
                <!--상단 프로필 영역 중 오른쪽 부분 -->
                <div class="profile-top-right">
                    <div class="profile-info">
                        <div class="info03">
                            <dl>
                                <dt>지역</dt>
                                <dd>${principal.user.address}</dd>
                            </dl>
                            <dl>
                                <dt>나이</dt>
                                <dd>${principal.user.age}세</dd>
                            </dl>
                            <dl>
                                <dt>성별</dt>
                                 <dd>${principal.user.gender}</dd>
                            </dl>
                            <dl>
                                <dt>소개글</dt>
                                <dd>안녕하세요~</dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 프로필 영역 아래 부분 -->
            <div class="profile-bottom">
                <div class="btn-wrap">
                    <button type="button" class="btn txt-btn blue-btn">+ 새 컬렉션</button>
                </div>

                <!--게시물 목록 영역 -->
                <div class="grid-wrapper">
                    <c:forEach items="${boardList}" var="board">
                        <div class="grid">
                            <!-- 각 이미지 카드를 클릭시 JS함수와 연결 -->
                            <figure class="feed-item-card" onclick="openModal(${board.boardNum})">
                                <img src="" alt="" class="thumbnail-img">
                                <!-- 마우스 오버시 하트와 메시지 아이콘 표시 -->
                                <div class="overlay">
                                    <div class="overlay-content">
                                        <dl class="icon-heart-txt">
                                            <dt>
                                                <img src="/assets/sns/images/icon-heart-filled-white.svg" alt=""
                                                     class="icon">
                                            </dt>
                                            <dd>200</dd>
                                        </dl>

                                        <dl class="icon-msg-txt">
                                            <dt>
                                                <img src="/assets/sns/images/icon-message-circle-filled-white.svg"
                                                     alt=""
                                                     class="icon">
                                            </dt>
                                            <dd>200</dd>
                                        </dl>
                                    </div>
                                </div>
                            </figure>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div id="feed-modal" class="modal-wrapper"></div>

    <div id="feed-ctrl-modal" class="modal-wrapper">
        <div class="modal-overlay" onclick="closeModal('feed-ctrl-modal')"></div>

        <div class="common-modal ctrl-modal">
            <button type="button" class="btn red-txt bold-txt">삭제</button>
            <button type="button" class="btn">수정</button>
            <button type="button" class="btn" onclick="closeModal('feed-ctrl-modal')">취소</button>
        </div>
    </div>
</div>

<script>

    $('textarea[data-autoresize]').each(function () {
        var offset = this.offsetHeight - this.clientHeight;

        var resizeTextarea = function (el) {
            $(el).css('height', 'auto').css('height', el.scrollHeight + offset);
        };

        $(this).on('keyup input', function () {
            resizeTextarea(this);
        }).removeAttr('data-autoresize');
    })

    <!-- 특정 클래스(toggle-icon-btn)를 가진 요소를 클릭할 때, 해당 요소의 활성/비활성 상태를 전환함. active 클래스를 토글하여 아이콘의 모양이 변경될 수 있음. -->
    $('.toggle-icon-btn').on('click', function () {
        $(this).toggleClass('active');
    })
    <!--댓글의 답글을 펼치고 접기,  -->
    $('.toggle-recomment-btn').each(function () {
        if ($(this).parent().hasClass('open')) {
            $(this).html('답글 모두 숨기기');
        } else {
            $(this).html('답글 보기(' + $(this).attr('data-count') + '개)');
        }

        $(this).on('click', function () {
            $(this).parent().toggleClass('open');
            if ($(this).parent().hasClass('open')) {
                $(this).html('답글 모두 숨기기');
            } else {
                $(this).html('답글 보기(' + $(this).attr('data-count') + '개)');
            }
        })
    })

    function openModal(id) {
        $('#feed-modal').load("/sns/board/detail/" + id, "", () => {
            $('#feed-modal').addClass('active');
        });
    }

    function closeModal(id) {
        $('#' + id).removeClass('active');
    }
</script>
</body>

</html>