<%@page import="com.team1.project.dto.MemberDTO"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<html  lang="en" >

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
  <link rel="stylesheet" href="/assets/sns/css/profileReset.css">
  <link rel="stylesheet" href="/assets/sns/css/proflieStyle.css">
<<<<<<< HEAD

  <script src="/assets/js/jquery-3.6.1.min.js"></script>
=======
  <link rel="stylesheet" href="/assets/sns/css/modal.css">
  
  <script src="assets/js/jquery-3.6.1.min.js"></script>
>>>>>>> branch 'main' of https://github.com/dustn5749/TANTAN.git
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
    
              <img src="/assets/sns/images/profile-img.jpeg" alt="">            
   
       
            </figure>

            <div class="profile-info">
              <div class="name">
                <h2>
                  <span><c:if test="${empty principal}">${principal.user}</c:if></span>
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
                  <dd>대구</dd>
                </dl>
                <dl>
                  <dt>나이</dt>
                  <dd>24세</dd>
                </dl>
                <dl>
                  <dt>성별</dt>
                  <dd>남자</dd>
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
<!--           <div class="btn-wrap"> -->
<!--             <button type="button" class="btn txt-btn blue-btn">+ 새 컬렉션</button> -->
<!--           </div> -->
		<div class="btn-wrap">
		<button type="button" class="btn txt-btn blue-btn" onclick="openModal('upload-modal')">+ 새 컬렉션</button>
		</div>
		<!--게시물 목록 영역 -->
          <div class="grid-wrapper">
            <div class="grid">
            <!-- 각 이미지 카드를 클릭시 JS함수와 연결 -->
              <figure class="feed-item-card" onclick="openModal('feed-modal')">
                <img src="/assets/sns/images/cat03.png" alt="" class="thumbnail-img">
                <!-- 마우스 오버시 하트와 메시지 아이콘 표시 -->
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-heart-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-message-circle-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card" onclick="openModal('feed-modal')">
                <img src="/assets/sns/images/cat01.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-heart-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-message-circle-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card" onclick="openModal('feed-modal')">
                <img src="/assets/sns/images/cat02.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-heart-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-message-circle-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card" onclick="openModal('feed-modal')">
                <img src="/assets/sns/images/cat03.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-heart-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-message-circle-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <!-- 1 line -->
            <div class="grid">
              <figure class="feed-item-card" onclick="openModal('feed-modal')">
                <img src="/assets/sns/images/cat01.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-heart-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-message-circle-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card" onclick="openModal('feed-modal')">
                <img src="/assets/sns/images/cat02.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-heart-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-message-circle-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card" onclick="openModal('feed-modal')">
                <img src="/assets/sns/images/cat03.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-heart-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-message-circle-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card" onclick="openModal('feed-modal')">
                <img src="/assets/sns/images/cat01.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-heart-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-message-circle-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <!-- 1 line -->
            <div class="grid">
              <figure class="feed-item-card" onclick="openModal('feed-modal')">
                <img src="/assets/sns/images/cat02.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-heart-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-message-circle-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card" onclick="openModal('feed-modal')">
                <img src="a/assets/sns/images/cat03.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-heart-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <img src="/assets/sns/images/icon-message-circle-filled-white.svg" alt="" class="icon">
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
          </div>
        </div>
      </div>
    </div>
	
	<!--게시글 상세보기 -->
    <div id="feed-modal" class="modal-wrapper">
    <!-- 모달 오버레이 -->
      <div class="modal-overlay" onclick="closeModal('feed-modal')"></div>
	<!-- 모달 닫기 버튼 -->
      <button type="button" class="icon-btn close-btn" onclick="closeModal('feed-modal')">
        <img src="/assets/sns/images/icon-close-white.svg" alt="">
      </button>
	<!-- 이전 항목으로 이동하는 버튼 -->
      <button type="button" class="feed-ctrl-btn prev">
        <img src="/assets/sns/images/icon-chevron-left.svg" alt="" class="icon">
      </button>
	<!-- 모달 내용 -->
      <div class="common-modal feed-modal">
      <!-- 큰 이미지 컨테이너 -->
        <div class="lg-thumbnail-container">
          <!--큰 이미지-->
          <div class="lg-thumbnail">
            <div class="thumnail-img-box">
              <img src="/assets/sns/images/cat03.png" alt="">
            </div>
		 <!--저장하기 버튼 -->
            <div class="thumnail-ctrl-bar">
              <button type="button" class="icon-btn toggle-icon-btn">
                <span class="txt-hidden">저장하기</span>
                <img src="/assets/sns/images/icon-bookmark.svg" alt="" class="icon icon-inactive">
                <img src="/assets/sns/images/icon-bookmark-filled.svg" alt="" class="icon icon-active">
              </button>
            </div>
          </div>
        </div>
        <!--우측 댓글 영역 -->
        <div class="content-container">
        	<!--컨테이너 상단의 게시물 작성자의 프로필 이미지와 닉네임, 뱃지 -->
          <div class="content-container-top">
            <div class="name-wrap">
              <figure class="mini-thumnail">
                <img src="/assets/sns/images/profile-img.jpeg" alt="">
              </figure>
              <h4>choi_seung_hyun_tttop</h4>
              <img src="/assets/sns/images/badge-certify.svg" alt="" class="badge-certify">
            </div>

            <button type="button" class="btn icon-btn" onclick="openModal('feed-ctrl-modal')">
              <span class="txt-hidden">더보기</span>
              <img src="/assets/sns/images/icon-dots.svg" class="icon" alt="">
            </button>
          </div>
		<!--댓글 영역-->
          <div class="content-container-middle-bottom">
          <!--댓글 목록 영역-->
            <div class="content-container-middle">
              <!-- 댓글이 없을 경우 -->
              <div class="nothing" style="display: none;">
                <h5>아직 댓글이 없습니다.</h5>
                <p>댓글을 남겨보세요</p>
              </div>

              <!-- 댓글이 있을 경우 -->
              <div>
                <ul class="comment-list-grp">
                  <!-- 댓글 들 -->
                  <li class="comment-list">
                    <div class="comment-item-container">
                      <div class="comment-item">
                        <figure class="mini-thumnail">
                          <img src="/assets/sns/images/profile-img.jpeg" alt="">
                        </figure>
                        <div class="comment-content">
                          <div class="name-content-wrap">
                            <div class="name-wrap">
                              <h6 class="name">choi_seung_hyun_tttop</h6>
                              <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                            </div>
                            <p>내용입니다.</p>
                          </div>
                          <p class="status-wrap">
                            <span class="gray-txt">1주</span>
                            <span class="gray-txt">좋아요 1개</span>
                            <button type="button" class="gray-txt txt-btn">답글 달기</button>
                          </p>
                        </div>
                        <div class="heart-wrap">
                          <button type="button" class="icon-btn toggle-icon-btn">
                            <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon icon-inactive">
                            <img src="/assets/sns/images/icon-heart-filled-red.svg" alt="" class="icon icon-active">
                          </button>
                        </div>
                      </div>
                      <div class="recomment-wrap">
                        <!-- open 클래스 달리면 답댓글들 다 보임 -->
                        <div class="recomment-top open">
                          <button type="button" data-count="299" class="toggle-recomment-btn gray-txt txt-btn">답글
                            보기(299개)</button>
                        </div>

                        <div class="recomment-bottom">
                          <ul class="recomment-list-grp">
                            <!-- 답댓글 -->
                            <li class="recomment-list">
                              <div class="comment-item">
                                <figure class="mini-thumnail">
                                  <img src="/assets/sns/images/profile-img.jpeg" alt="">
                                </figure>
                                <div class="comment-content">
                                  <div class="name-content-wrap">
                                    <div class="name-wrap">
                                      <h6 class="name">choi_seung_hyun_tttop</h6>
                                      <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                                    </div>
                                    <p>내용입니다.</p>
                                  </div>
                                  <p class="status-wrap">
                                    <span class="gray-txt">1주</span>
                                    <span class="gray-txt">좋아요 1개</span>
                                    <button type="button" class="gray-txt txt-btn">답글 달기</button>
                                  </p>
                                </div>
                                <div class="heart-wrap">
                                  <button type="button" class="icon-btn toggle-icon-btn">
                                    <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon icon-inactive">
                                    <img src="/assets/sns/images/icon-heart-filled-red.svg" alt="" class="icon icon-active">
                                  </button>
                                </div>
                              </div>
                            </li>
                            <!-- 답댓글 -->
                            <li class="recomment-list">
                              <div class="comment-item">
                                <figure class="mini-thumnail">
                                  <img src="/assets/sns/images/profile-img.jpeg" alt="">
                                </figure>
                                <div class="comment-content">
                                  <div class="name-content-wrap">
                                    <div class="name-wrap">
                                      <h6 class="name">choi_seung_hyun_tttop</h6>
                                      <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                                    </div>
                                    <p>내용입니다.</p>
                                  </div>
                                  <p class="status-wrap">
                                    <span class="gray-txt">1주</span>
                                    <span class="gray-txt">좋아요 1개</span>
                                    <button type="button" class="gray-txt txt-btn">답글 달기</button>
                                  </p>
                                </div>
                                <div class="heart-wrap">
                                  <button type="button" class="icon-btn toggle-icon-btn">
                                    <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon icon-inactive">
                                    <img src="/assets/sns/images/icon-heart-filled-red.svg" alt="" class="icon icon-active">
                                  </button>
                                </div>
                              </div>
                            </li>
                            <!-- 답댓글 -->
                            <li class="recomment-list">
                              <div class="comment-item">
                                <figure class="mini-thumnail">
                                  <img src="/assets/sns/images/profile-img-default.png" alt="">
                                </figure>
                                <div class="comment-content">
                                  <div class="name-content-wrap">
                                    <div class="name-wrap">
                                      <h6 class="name">userhonggildong</h6>
                                    </div>
                                    <p>홍길동 유저의 댓글 내용입니다 홍길동 유저의 댓글 내용입니다 홍길동 유저의 댓글 내용입니다 홍길동 유저의 댓글 내용입니다</p>
                                  </div>
                                  <p class="status-wrap">
                                    <span class="gray-txt">1주</span>
                                    <span class="gray-txt">좋아요 1개</span>
                                    <button type="button" class="gray-txt txt-btn">답글 달기</button>
                                  </p>
                                </div>
                                <div class="heart-wrap">
                                  <button type="button" class="icon-btn toggle-icon-btn">
                                    <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon icon-inactive">
                                    <img src="/assets/sns/images/icon-heart-filled-red.svg" alt="" class="icon icon-active">
                                  </button>
                                </div>
                              </div>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </li>
                  <!-- 댓글 -->
                  <li class="comment-list">
                    <div class="comment-item-container">
                      <div class="comment-item">
                        <figure class="mini-thumnail">
                          <img src="/assets/sns/images/profile-img-default.png" alt="">
                        </figure>
                        <div class="comment-content">
                          <div class="name-content-wrap">
                            <div class="name-wrap">
                              <h6 class="name">user03</h6>
                            </div>
                            <p>장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다.
                              장문의 내용입니다.</p>
                          </div>
                          <p class="status-wrap">
                            <span class="gray-txt">1주</span>
                            <span class="gray-txt">좋아요 1개</span>
                            <button type="button" class="gray-txt txt-btn">답글 달기</button>
                          </p>
                        </div>
                        <div class="heart-wrap">
                          <button type="button" class="icon-btn toggle-icon-btn">
                            <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon icon-inactive">
                            <img src="/assets/sns/images/icon-heart-filled-red.svg" alt="" class="icon icon-active">
                          </button>
                        </div>
                      </div>
                    </div>
                  </li>                  
                  
                  <!-- 댓글 -->
                  <li class="comment-list">
                    <div class="comment-item-container">
                      <div class="comment-item">
                        <figure class="mini-thumnail">
                          <img src="/assets/sns/images/profile-img.jpeg" alt="">
                        </figure>
                        <div class="comment-content">
                          <div class="name-content-wrap">
                            <div class="name-wrap">
                              <h6 class="name">choi_seung_hyun_tttop</h6>
                              <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                            </div>
                            <p>내용입니다.</p>
                          </div>
                          <p class="status-wrap">
                            <span class="gray-txt">1주</span>
                            <span class="gray-txt">좋아요 1개</span>
                            <button type="button" class="gray-txt txt-btn">답글 달기</button>
                          </p>
                        </div>
                        <div class="heart-wrap">
                          <button type="button" class="icon-btn toggle-icon-btn">
                            <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon icon-inactive">
                            <img src="/assets/sns/images/icon-heart-filled-red.svg" alt="" class="icon icon-active">
                          </button>
                        </div>
                      </div>
                      <div class="recomment-wrap">
                        <!-- open 클래스 달리면 답댓글들 다~보임 -->
                        <div class="recomment-top">
                          <button type="button" data-count="4" class="toggle-recomment-btn gray-txt txt-btn">답글 보기(4개)</button>
                        </div>

                        <div class="recomment-bottom">
                          <ul class="recomment-list-grp">
                            <!-- 답댓글 -->
                            <li class="recomment-list">
                              <div class="comment-item">
                                <figure class="mini-thumnail">
                                  <img src="/assets/sns/images/profile-img.jpeg" alt="">
                                </figure>
                                <div class="comment-content">
                                  <div class="name-content-wrap">
                                    <div class="name-wrap">
                                      <h6 class="name">choi_seung_hyun_tttop</h6>
                                      <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                                    </div>
                                    <p>내용입니다.</p>
                                  </div>
                                  <p class="status-wrap">
                                    <span class="gray-txt">1주</span>
                                    <span class="gray-txt">좋아요 1개</span>
                                    <button type="button" class="gray-txt txt-btn">답글 달기</button>
                                  </p>
                                </div>
                                <div class="heart-wrap">
                                  <button type="button" class="icon-btn toggle-icon-btn">
                                    <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon icon-inactive">
                                    <img src="/assets/sns/images/icon-heart-filled-red.svg" alt="" class="icon icon-active">
                                  </button>
                                </div>
                              </div>
                            </li>
                            <!-- 답댓글 -->
                            <li class="recomment-list">
                              <div class="comment-item">
                                <figure class="mini-thumnail">
                                  <img src="/assets/sns/images/profile-img.jpeg" alt="">
                                </figure>
                                <div class="comment-content">
                                  <div class="name-content-wrap">
                                    <div class="name-wrap">
                                      <h6 class="name">choi_seung_hyun_tttop</h6>
                                      <img src="/assets/sns/images/badge-certify.svg" class="badge-certify" alt="">
                                    </div>
                                    <p>내용입니다.</p>
                                  </div>
                                  <p class="status-wrap">
                                    <span class="gray-txt">1주</span>
                                    <span class="gray-txt">좋아요 1개</span>
                                    <button type="button" class="gray-txt txt-btn">답글 달기</button>
                                  </p>
                                </div>
                                <div class="heart-wrap">
                                  <button type="button" class="icon-btn toggle-icon-btn">
                                    <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon icon-inactive">
                                    <img src="/assets/sns/images/icon-heart-filled-red.svg" alt="" class="icon icon-active">
                                  </button>
                                </div>
                              </div>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </li>                               
                  <!-- 댓글 -->
                  <li class="comment-list">
                    <div class="comment-item-container">
                      <div class="comment-item">
                        <figure class="mini-thumnail">
                          <img src="/assets/sns/images/profile-img-default.png" alt="">
                        </figure>
                        <div class="comment-content">
                          <div class="name-content-wrap">
                            <div class="name-wrap">
                              <h6 class="name">user03</h6>
                            </div>
                            <p>장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다.
                              장문의 내용입니다.</p>
                          </div>
                          <p class="status-wrap">
                            <span class="gray-txt">1주</span>
                            <span class="gray-txt">좋아요 1개</span>
                            <button type="button" class="gray-txt txt-btn">답글 달기</button>
                          </p>
                        </div>
                        <div class="heart-wrap">
                          <button type="button" class="icon-btn toggle-icon-btn">
                            <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon icon-inactive">
                            <img src="/assets/sns/images/icon-heart-filled-red.svg" alt="" class="icon icon-active">
                          </button>
                        </div>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>

            <div class="content-container-bottom">
              <div class="comment-opt-bar display-flex f-space-between gap-20">
                <div class="display-flex gap-15">
                  <!-- 눌렀을 시 active 클래스 토글 -->
                  <button type="button" class="btn icon-btn toggle-icon-btn">
                    <span class="txt-hidden">좋아요</span>
                    <img src="/assets/sns/images/icon-heart.svg" class="icon icon-inactive" alt="">
                    <img src="/assets/sns/images/icon-heart-filled.svg" class="icon icon-active" alt="">
                  </button>
                  <button type="button" class="btn icon-btn">
                    <span class="txt-hidden">댓글</span>
                    <img src="/assets/sns/images/icon-message-circle.svg" class="icon icon-inactive" alt="">
                  </button>
<!--                   <button type="button" class="btn icon-btn"> -->
<!--                     <span class="txt-hidden">메세지</span> -->
<!--                     <img src="/assets/sns/images/icon-send.svg" class="icon icon-inactive" alt=""> -->
<!--                   </button> -->
                </div>
                <div class="display-flex gap-15">
                  <!-- 눌렀을 시 active 클래스 토글 -->
                  <button type="button" class="btn icon-btn toggle-icon-btn">
                    <span class="txt-hidden">저장됨</span>
                    <img src="/assets/sns/images/icon-bookmark.svg" class="icon icon-inactive" alt="">
                    <img src="/assets/sns/images/icon-bookmark-filled.svg" class="icon icon-active" alt="">
                  </button>
                </div>
              </div>
              <!-- 좋아요 있을 경우 -->
              <!-- <div class="comment-status-bar">
                <p class="txt"><b>좋아요 200개</b></p>
                <p class="sm-txt gray-txt">3시간 전</p>
              </div> -->
              <!-- 좋아요 없을 경우 -->
              <div class="comment-status-bar">
                <p class="txt">가장 먼저 <b>좋아요</b>를 눌러보세요</p>
                <p class="sm-txt gray-txt">3시간 전</p>
              </div>
              <div class="create-comment-bar">
                <figure class="mini-thumnail">
                  <img src="/assets/sns/images/profile-img.jpeg" alt="">
                </figure>
                <textarea data-autoresize placeholder="댓글 달기..." rows="1" class="txtarea"></textarea>
                <button type="button" class="btn txt-btn">게시</button>
              </div>
            </div>
          </div>
        </div>
      </div>
		<!-- 우측상단 게시물 상세 편집 버튼 -->
      <button type="button" class="feed-ctrl-btn next">
        <img src="/assets/sns/images/icon-chevron-right.svg" alt="" class="icon">
      </button>
    </div>

    <div id="feed-ctrl-modal" class="modal-wrapper">
      <div class="modal-overlay" onclick="closeModal('feed-ctrl-modal')"></div>

      <div class="common-modal ctrl-modal">
        <button type="button" class="btn red-txt bold-txt">삭제</button>
        <button type="button" class="btn">수정</button>
        <button type="button" class="btn" onclick="closeModal('feed-ctrl-modal')">취소</button>
      </div>
    </div>
  </div>

  
  <!-- 이미지 업로드 팝업창 -->
    <div id="upload-modal" class="modal-wrapper">
      <div class="modal-overlay" onclick="closeModal('upload-modal')"></div>

      <div class="common-modal narrow-modal">
        <!-- 닫기버튼 -->
        <button type="button" class="icon-btn close-btn" onclick="closeModal('upload-modal')">
          <img src="/assets/sns/images/icon-close.svg" alt="">
        </button>
        <!-- END 닫기버튼 -->

                <!-- 메세지 보내기 & 삭제 버튼 -->
                <div class="btn-wrap">
                  <button type="button" class="btn blue-btn">파일 업로드</button>
                </div>
      	</div>
    </div>
    <!-- END 친구 목록 / 친구 요청 모달 팝업창 -->
    
  <script>
  <!-- 특정속성을 가진 모든 텍스트영역을 내용이 잘리지 않기 위한 텍스트 영역을 자동으로 크기 조절해줌 -->
    $('textarea[data-autoresize]').each(function () {
      var offset = this.offsetHeight - this.clientHeight;

      var resizeTextarea = function (el) {
        $(el).css('height', 'auto').css('height', el.scrollHeight + offset);
      };

      $(this).on('keyup input', function () { resizeTextarea(this); }).removeAttr('data-autoresize');
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
      $('#' + id).addClass('active');
    }

    function closeModal(id) {
      $('#' + id).removeClass('active');
    }
  </script>
</body>

</html>