<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
  <link rel="stylesheet" href="assets/css/profileReset.css">
  <link rel="stylesheet" href="assets/css/proflieStyle.css">
</head>

<body>
  <div id="app">
<!--     <header class="header"> -->
<!--       <div class="header-inner"> -->
<!--         <h1 class="logo"> -->
<!--           <a href="#"> -->
<!--             <img src="assets/img/logo2.png" alt=""> -->
<!--           </a> -->
<!--         </h1> -->

<!--         <div class="header-menu"> -->
<!--           <button type="button" class="hd-btn"> -->
<!--             <span class="txt-hidden">친구</span><svg xmlns="http://www.w3.org/2000/svg" -->
<!--               class="icon icon-tabler icon-tabler-users" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" -->
<!--               stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"> -->
<!--               <path stroke="none" d="M0 0h24v24H0z" fill="none"></path> -->
<!--               <path d="M9 7m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0"></path> -->
<!--               <path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path> -->
<!--               <path d="M16 3.13a4 4 0 0 1 0 7.75"></path> -->
<!--               <path d="M21 21v-2a4 4 0 0 0 -3 -3.85"></path> -->
<!--             </svg> -->
<!--           </button> -->

<!--           <button type="button" class="hd-btn"> -->
<!--             <span class="txt-hidden">메세지</span> -->
<!--             <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-mail" width="24" height="24" -->
<!--               viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" -->
<!--               stroke-linejoin="round"> -->
<!--               <path stroke="none" d="M0 0h24v24H0z" fill="none"></path> -->
<!--               <path d="M3 7a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v10a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2v-10z"></path> -->
<!--               <path d="M3 7l9 6l9 -6"></path> -->
<!--             </svg> -->
<!--           </button> -->

<!--           <button type="button" class="hd-btn"> -->
<!--             <span class="txt-hidden">알림</span> -->
<!--             <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart" width="24" height="24" -->
<!--               viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" -->
<!--               stroke-linejoin="round"> -->
<!--               <path stroke="none" d="M0 0h24v24H0z" fill="none"></path> -->
<!--               <path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572"></path> -->
<!--             </svg> -->
<!--           </button> -->

<!--           <button type="button" class="hd-btn hd-mypage-btn"> -->
<!--             <span class="txt-hidden">마이페이지</span> -->
<!--             <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user-filled" width="24" -->
<!--               height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" -->
<!--               stroke-linejoin="round"> -->
<!--               <path stroke="none" d="M0 0h24v24H0z" fill="none"></path> -->
<!--               <path d="M12 2a5 5 0 1 1 -5 5l.005 -.217a5 5 0 0 1 4.995 -4.783z" stroke-width="0" fill="currentColor"> -->
<!--               </path> -->
<!--               <path d="M14 14a5 5 0 0 1 5 5v1a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2v-1a5 5 0 0 1 5 -5h4z" stroke-width="0" -->
<!--                 fill="currentColor"></path> -->
<!--             </svg> -->
<!--           </button> -->
<!--         </div> -->
<!--       </div> -->
<!--     </header> -->

    <div class="sidebar-wrapper">
      <div class="sidebar">
        <div class="sidebar-inner">
          <div class="sidebar-menu">
            <button type="button" class="sidebar-btn">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-home-2" width="24" height="24"
                viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                <path d="M5 12l-2 0l9 -9l9 9l-2 0"></path>
                <path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path>
                <path d="M10 12h4v4h-4z"></path>
              </svg>
              <span class="txt">홈</span>
            </button>
            <button type="button" class="sidebar-btn">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-brand-safari" width="24"
                height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                <path d="M8 16l2 -6l6 -2l-2 6l-6 2"></path>
                <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"></path>
              </svg>
              <span class="txt">일정</span>
            </button>
            <button type="button" class="sidebar-btn">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-send" width="24" height="24"
                viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                <path d="M10 14l11 -11"></path>
                <path d="M21 3l-6.5 18a.55 .55 0 0 1 -1 0l-3.5 -7l-7 -3.5a.55 .55 0 0 1 0 -1l18 -6.5"></path>
              </svg>
              <span class="txt">메세지</span>
            </button>
            <button type="button" class="sidebar-btn">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart" width="24" height="24"
                viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                <path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572"></path>
              </svg>
              <span class="txt">알림</span>
            </button>
            <button type="button" class="sidebar-btn">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-bookmark-filled" width="24"
                height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                <path
                  d="M14 2a5 5 0 0 1 5 5v14a1 1 0 0 1 -1.555 .832l-5.445 -3.63l-5.444 3.63a1 1 0 0 1 -1.55 -.72l-.006 -.112v-14a5 5 0 0 1 5 -5h4z"
                  stroke-width="0" fill="currentColor"></path>
              </svg>
              <span class="txt">저장됨</span>
            </button>
            <button type="button" class="sidebar-btn">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-activity" width="24"
                height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                <path d="M3 12h4l3 8l4 -16l3 8h4"></path>
              </svg>
              <span class="txt">내 활동</span>
            </button>
            <button type="button" class="sidebar-btn">
              <figure class="mini-thumnail">
                <img src="assets/img/profile-img.jpeg" alt="">
              </figure>
              <span class="txt">프로필</span>
            </button>
          </div>

          <div class="sidebar-menu">
            <button type="button" class="sidebar-btn">
              <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-menu-2" width="24" height="24"
                viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                <path d="M4 6l16 0"></path>
                <path d="M4 12l16 0"></path>
                <path d="M4 18l16 0"></path>
              </svg>
              <span class="txt">더보기</span>
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="page-wrapper">
      <div class="page-container profile-page">
        <div class="profile-top">
          <div class="profile-top-left">
            <figure class="thumbnail">
              <img src="assets/img/profile-img.jpeg" alt="">
            </figure>

            <div class="profile-info">
              <div class="name">
                <h2>
                  <span>choi_seung_hyun_tttop</span>
                  <svg aria-label="인증됨" class="x1lliihq x1n2onr6" fill="rgb(0, 149, 246)" height="18" role="img"
                    viewBox="0 0 40 40" width="18">
                    <title>인증됨</title>
                    <path
                      d="M19.998 3.094 14.638 0l-2.972 5.15H5.432v6.354L0 14.64 3.094 20 0 25.359l5.432 3.137v5.905h5.975L14.638 40l5.36-3.094L25.358 40l3.232-5.6h6.162v-6.01L40 25.359 36.905 20 40 14.641l-5.248-3.03v-6.46h-6.419L25.358 0l-5.36 3.094Zm7.415 11.225 2.254 2.287-11.43 11.5-6.835-6.93 2.244-2.258 4.587 4.581 9.18-9.18Z"
                      fill-rule="evenodd"></path>
                  </svg>
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
                <p>user입니다.</p>
              </div>
              <div class="btn-wrap">
                <button type="button" class="btn solid-btn blue-btn">친구 추가</button>
                <button type="button" class="btn solid-btn gray-btn">프로필 편집</button>
              </div>
            </div>
          </div>
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

        <div class="profile-bottom">
          <div class="btn-wrap">
            <button type="button" class="btn txt-btn blue-btn">+ 새 컬렉션</button>
          </div>

          <div class="grid-wrapper">
            <div class="grid">
              <figure class="feed-item-card">
                <img src="assets/img/cat03.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart-filled"
                          width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                          stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M6.979 3.074a6 6 0 0 1 4.988 1.425l.037 .033l.034 -.03a6 6 0 0 1 4.733 -1.44l.246 .036a6 6 0 0 1 3.364 10.008l-.18 .185l-.048 .041l-7.45 7.379a1 1 0 0 1 -1.313 .082l-.094 -.082l-7.493 -7.422a6 6 0 0 1 3.176 -10.215z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg"
                          class="icon icon-tabler icon-tabler-message-circle-2-filled" width="24" height="24"
                          viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                          stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M5.821 4.91c3.898 -2.765 9.469 -2.539 13.073 .536c3.667 3.127 4.168 8.238 1.152 11.897c-2.842 3.447 -7.965 4.583 -12.231 2.805l-.232 -.101l-4.375 .931l-.075 .013l-.11 .009l-.113 -.004l-.044 -.005l-.11 -.02l-.105 -.034l-.1 -.044l-.076 -.042l-.108 -.077l-.081 -.074l-.073 -.083l-.053 -.075l-.065 -.115l-.042 -.106l-.031 -.113l-.013 -.075l-.009 -.11l.004 -.113l.005 -.044l.02 -.11l.022 -.072l1.15 -3.451l-.022 -.036c-2.21 -3.747 -1.209 -8.392 2.411 -11.118l.23 -.168z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card">
                <img src="assets/img/cat01.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart-filled"
                          width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                          stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M6.979 3.074a6 6 0 0 1 4.988 1.425l.037 .033l.034 -.03a6 6 0 0 1 4.733 -1.44l.246 .036a6 6 0 0 1 3.364 10.008l-.18 .185l-.048 .041l-7.45 7.379a1 1 0 0 1 -1.313 .082l-.094 -.082l-7.493 -7.422a6 6 0 0 1 3.176 -10.215z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg"
                          class="icon icon-tabler icon-tabler-message-circle-2-filled" width="24" height="24"
                          viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                          stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M5.821 4.91c3.898 -2.765 9.469 -2.539 13.073 .536c3.667 3.127 4.168 8.238 1.152 11.897c-2.842 3.447 -7.965 4.583 -12.231 2.805l-.232 -.101l-4.375 .931l-.075 .013l-.11 .009l-.113 -.004l-.044 -.005l-.11 -.02l-.105 -.034l-.1 -.044l-.076 -.042l-.108 -.077l-.081 -.074l-.073 -.083l-.053 -.075l-.065 -.115l-.042 -.106l-.031 -.113l-.013 -.075l-.009 -.11l.004 -.113l.005 -.044l.02 -.11l.022 -.072l1.15 -3.451l-.022 -.036c-2.21 -3.747 -1.209 -8.392 2.411 -11.118l.23 -.168z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card">
                <img src="assets/img/cat02.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart-filled"
                          width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                          stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M6.979 3.074a6 6 0 0 1 4.988 1.425l.037 .033l.034 -.03a6 6 0 0 1 4.733 -1.44l.246 .036a6 6 0 0 1 3.364 10.008l-.18 .185l-.048 .041l-7.45 7.379a1 1 0 0 1 -1.313 .082l-.094 -.082l-7.493 -7.422a6 6 0 0 1 3.176 -10.215z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg"
                          class="icon icon-tabler icon-tabler-message-circle-2-filled" width="24" height="24"
                          viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                          stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M5.821 4.91c3.898 -2.765 9.469 -2.539 13.073 .536c3.667 3.127 4.168 8.238 1.152 11.897c-2.842 3.447 -7.965 4.583 -12.231 2.805l-.232 -.101l-4.375 .931l-.075 .013l-.11 .009l-.113 -.004l-.044 -.005l-.11 -.02l-.105 -.034l-.1 -.044l-.076 -.042l-.108 -.077l-.081 -.074l-.073 -.083l-.053 -.075l-.065 -.115l-.042 -.106l-.031 -.113l-.013 -.075l-.009 -.11l.004 -.113l.005 -.044l.02 -.11l.022 -.072l1.15 -3.451l-.022 -.036c-2.21 -3.747 -1.209 -8.392 2.411 -11.118l.23 -.168z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card">
                <img src="assets/img/cat03.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart-filled"
                          width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                          stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M6.979 3.074a6 6 0 0 1 4.988 1.425l.037 .033l.034 -.03a6 6 0 0 1 4.733 -1.44l.246 .036a6 6 0 0 1 3.364 10.008l-.18 .185l-.048 .041l-7.45 7.379a1 1 0 0 1 -1.313 .082l-.094 -.082l-7.493 -7.422a6 6 0 0 1 3.176 -10.215z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg"
                          class="icon icon-tabler icon-tabler-message-circle-2-filled" width="24" height="24"
                          viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                          stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M5.821 4.91c3.898 -2.765 9.469 -2.539 13.073 .536c3.667 3.127 4.168 8.238 1.152 11.897c-2.842 3.447 -7.965 4.583 -12.231 2.805l-.232 -.101l-4.375 .931l-.075 .013l-.11 .009l-.113 -.004l-.044 -.005l-.11 -.02l-.105 -.034l-.1 -.044l-.076 -.042l-.108 -.077l-.081 -.074l-.073 -.083l-.053 -.075l-.065 -.115l-.042 -.106l-.031 -.113l-.013 -.075l-.009 -.11l.004 -.113l.005 -.044l.02 -.11l.022 -.072l1.15 -3.451l-.022 -.036c-2.21 -3.747 -1.209 -8.392 2.411 -11.118l.23 -.168z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <!-- 1 line -->
            <div class="grid">
              <figure class="feed-item-card">
                <img src="assets/img/cat03.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart-filled"
                          width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                          stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M6.979 3.074a6 6 0 0 1 4.988 1.425l.037 .033l.034 -.03a6 6 0 0 1 4.733 -1.44l.246 .036a6 6 0 0 1 3.364 10.008l-.18 .185l-.048 .041l-7.45 7.379a1 1 0 0 1 -1.313 .082l-.094 -.082l-7.493 -7.422a6 6 0 0 1 3.176 -10.215z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg"
                          class="icon icon-tabler icon-tabler-message-circle-2-filled" width="24" height="24"
                          viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                          stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M5.821 4.91c3.898 -2.765 9.469 -2.539 13.073 .536c3.667 3.127 4.168 8.238 1.152 11.897c-2.842 3.447 -7.965 4.583 -12.231 2.805l-.232 -.101l-4.375 .931l-.075 .013l-.11 .009l-.113 -.004l-.044 -.005l-.11 -.02l-.105 -.034l-.1 -.044l-.076 -.042l-.108 -.077l-.081 -.074l-.073 -.083l-.053 -.075l-.065 -.115l-.042 -.106l-.031 -.113l-.013 -.075l-.009 -.11l.004 -.113l.005 -.044l.02 -.11l.022 -.072l1.15 -3.451l-.022 -.036c-2.21 -3.747 -1.209 -8.392 2.411 -11.118l.23 -.168z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card">
                <img src="assets/img/cat01.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart-filled"
                          width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                          stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M6.979 3.074a6 6 0 0 1 4.988 1.425l.037 .033l.034 -.03a6 6 0 0 1 4.733 -1.44l.246 .036a6 6 0 0 1 3.364 10.008l-.18 .185l-.048 .041l-7.45 7.379a1 1 0 0 1 -1.313 .082l-.094 -.082l-7.493 -7.422a6 6 0 0 1 3.176 -10.215z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg"
                          class="icon icon-tabler icon-tabler-message-circle-2-filled" width="24" height="24"
                          viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                          stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M5.821 4.91c3.898 -2.765 9.469 -2.539 13.073 .536c3.667 3.127 4.168 8.238 1.152 11.897c-2.842 3.447 -7.965 4.583 -12.231 2.805l-.232 -.101l-4.375 .931l-.075 .013l-.11 .009l-.113 -.004l-.044 -.005l-.11 -.02l-.105 -.034l-.1 -.044l-.076 -.042l-.108 -.077l-.081 -.074l-.073 -.083l-.053 -.075l-.065 -.115l-.042 -.106l-.031 -.113l-.013 -.075l-.009 -.11l.004 -.113l.005 -.044l.02 -.11l.022 -.072l1.15 -3.451l-.022 -.036c-2.21 -3.747 -1.209 -8.392 2.411 -11.118l.23 -.168z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card">
                <img src="assets/img/cat02.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart-filled"
                          width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                          stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M6.979 3.074a6 6 0 0 1 4.988 1.425l.037 .033l.034 -.03a6 6 0 0 1 4.733 -1.44l.246 .036a6 6 0 0 1 3.364 10.008l-.18 .185l-.048 .041l-7.45 7.379a1 1 0 0 1 -1.313 .082l-.094 -.082l-7.493 -7.422a6 6 0 0 1 3.176 -10.215z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg"
                          class="icon icon-tabler icon-tabler-message-circle-2-filled" width="24" height="24"
                          viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                          stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M5.821 4.91c3.898 -2.765 9.469 -2.539 13.073 .536c3.667 3.127 4.168 8.238 1.152 11.897c-2.842 3.447 -7.965 4.583 -12.231 2.805l-.232 -.101l-4.375 .931l-.075 .013l-.11 .009l-.113 -.004l-.044 -.005l-.11 -.02l-.105 -.034l-.1 -.044l-.076 -.042l-.108 -.077l-.081 -.074l-.073 -.083l-.053 -.075l-.065 -.115l-.042 -.106l-.031 -.113l-.013 -.075l-.009 -.11l.004 -.113l.005 -.044l.02 -.11l.022 -.072l1.15 -3.451l-.022 -.036c-2.21 -3.747 -1.209 -8.392 2.411 -11.118l.23 -.168z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card">
                <img src="assets/img/cat03.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart-filled"
                          width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                          stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M6.979 3.074a6 6 0 0 1 4.988 1.425l.037 .033l.034 -.03a6 6 0 0 1 4.733 -1.44l.246 .036a6 6 0 0 1 3.364 10.008l-.18 .185l-.048 .041l-7.45 7.379a1 1 0 0 1 -1.313 .082l-.094 -.082l-7.493 -7.422a6 6 0 0 1 3.176 -10.215z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg"
                          class="icon icon-tabler icon-tabler-message-circle-2-filled" width="24" height="24"
                          viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                          stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M5.821 4.91c3.898 -2.765 9.469 -2.539 13.073 .536c3.667 3.127 4.168 8.238 1.152 11.897c-2.842 3.447 -7.965 4.583 -12.231 2.805l-.232 -.101l-4.375 .931l-.075 .013l-.11 .009l-.113 -.004l-.044 -.005l-.11 -.02l-.105 -.034l-.1 -.044l-.076 -.042l-.108 -.077l-.081 -.074l-.073 -.083l-.053 -.075l-.065 -.115l-.042 -.106l-.031 -.113l-.013 -.075l-.009 -.11l.004 -.113l.005 -.044l.02 -.11l.022 -.072l1.15 -3.451l-.022 -.036c-2.21 -3.747 -1.209 -8.392 2.411 -11.118l.23 -.168z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <!-- 1 line -->
            <div class="grid">
              <figure class="feed-item-card">
                <img src="assets/img/cat03.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart-filled"
                          width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                          stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M6.979 3.074a6 6 0 0 1 4.988 1.425l.037 .033l.034 -.03a6 6 0 0 1 4.733 -1.44l.246 .036a6 6 0 0 1 3.364 10.008l-.18 .185l-.048 .041l-7.45 7.379a1 1 0 0 1 -1.313 .082l-.094 -.082l-7.493 -7.422a6 6 0 0 1 3.176 -10.215z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg"
                          class="icon icon-tabler icon-tabler-message-circle-2-filled" width="24" height="24"
                          viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                          stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M5.821 4.91c3.898 -2.765 9.469 -2.539 13.073 .536c3.667 3.127 4.168 8.238 1.152 11.897c-2.842 3.447 -7.965 4.583 -12.231 2.805l-.232 -.101l-4.375 .931l-.075 .013l-.11 .009l-.113 -.004l-.044 -.005l-.11 -.02l-.105 -.034l-.1 -.044l-.076 -.042l-.108 -.077l-.081 -.074l-.073 -.083l-.053 -.075l-.065 -.115l-.042 -.106l-.031 -.113l-.013 -.075l-.009 -.11l.004 -.113l.005 -.044l.02 -.11l.022 -.072l1.15 -3.451l-.022 -.036c-2.21 -3.747 -1.209 -8.392 2.411 -11.118l.23 -.168z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>
                  </div>
                </div>
              </figure>
            </div>
            <div class="grid">
              <figure class="feed-item-card">
                <img src="assets/img/cat01.png" alt="" class="thumbnail-img">
                <div class="overlay">
                  <div class="overlay-content">
                    <dl class="icon-heart-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart-filled"
                          width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                          stroke-linecap="round" stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M6.979 3.074a6 6 0 0 1 4.988 1.425l.037 .033l.034 -.03a6 6 0 0 1 4.733 -1.44l.246 .036a6 6 0 0 1 3.364 10.008l-.18 .185l-.048 .041l-7.45 7.379a1 1 0 0 1 -1.313 .082l-.094 -.082l-7.493 -7.422a6 6 0 0 1 3.176 -10.215z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
                      </dt>
                      <dd>200</dd>
                    </dl>

                    <dl class="icon-msg-txt">
                      <dt>
                        <svg xmlns="http://www.w3.org/2000/svg"
                          class="icon icon-tabler icon-tabler-message-circle-2-filled" width="24" height="24"
                          viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                          stroke-linejoin="round">
                          <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M5.821 4.91c3.898 -2.765 9.469 -2.539 13.073 .536c3.667 3.127 4.168 8.238 1.152 11.897c-2.842 3.447 -7.965 4.583 -12.231 2.805l-.232 -.101l-4.375 .931l-.075 .013l-.11 .009l-.113 -.004l-.044 -.005l-.11 -.02l-.105 -.034l-.1 -.044l-.076 -.042l-.108 -.077l-.081 -.074l-.073 -.083l-.053 -.075l-.065 -.115l-.042 -.106l-.031 -.113l-.013 -.075l-.009 -.11l.004 -.113l.005 -.044l.02 -.11l.022 -.072l1.15 -3.451l-.022 -.036c-2.21 -3.747 -1.209 -8.392 2.411 -11.118l.23 -.168z"
                            stroke-width="0" fill="currentColor"></path>
                        </svg>
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
  </div>
</body>

</html>