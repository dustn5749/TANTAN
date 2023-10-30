<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style type="text/css">

@font-face {
    font-family: 'NPSfontBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
.nav-link{
     font-family: 'NPSfontBold';
	font-size: 20px !important;
	
	/* 버튼들 간격 조절 */
    .nav-icon {
        margin-right: 30px; /* 원하는 간격으로 조절합니다. */
    }
    
    /* 버튼 크기 조절 */
    .nav-icon i {
        font-size: 24px; /* 아이콘 크기 조절, 원하는 크기로 조절합니다. */
    }
    
	.nav-link {
        font-family: 'NPSfontBold';
        font-size: 20px !important;
    }
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
                            <a class="nav-link" href="/member/review.do">커뮤니티</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">동행</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.html">고객센터</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/member/loginForm.do">로그인</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
					
<!-- 					<div class="header-menu"> -->
<!-- 			          <button type="button" class="hd-btn"> -->
<!-- 			            <span class="txt-hidden">친구</span><svg xmlns="http://www.w3.org/2000/svg" -->
<!-- 			              class="icon icon-tabler icon-tabler-users" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" -->
<!-- 			              stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"> -->
<!-- 			              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path> -->
<!-- 			              <path d="M9 7m-4 0a4 4 0 1 0 8 0a4 4 0 1 0 -8 0"></path> -->
<!-- 			              <path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path> -->
<!-- 			              <path d="M16 3.13a4 4 0 0 1 0 7.75"></path> -->
<!-- 			              <path d="M21 21v-2a4 4 0 0 0 -3 -3.85"></path> -->
<!-- 			            </svg> -->
<!-- 			          </button> -->
			          
<!-- 			          <button type="button" class="hd-btn"> -->
<!-- 			            <span class="txt-hidden">메세지</span> -->
<!-- 			            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-mail" width="24" height="24" -->
<!-- 			              viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" -->
<!-- 			              stroke-linejoin="round"> -->
<!-- 			              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path> -->
<!-- 			              <path d="M3 7a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v10a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2v-10z"></path> -->
<!-- 			              <path d="M3 7l9 6l9 -6"></path> -->
<!-- 			            </svg> -->
<!-- 			          </button> -->
			          
<!-- 			          <button type="button" class="hd-btn"> -->
<!-- 			            <span class="txt-hidden">알림</span> -->
<!-- 			            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-heart" width="24" height="24" -->
<!-- 			              viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" -->
<!-- 			              stroke-linejoin="round"> -->
<!-- 			              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path> -->
<!-- 			              <path d="M19.5 12.572l-7.5 7.428l-7.5 -7.428a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572"></path> -->
<!-- 			            </svg> -->
<!-- 			          </button> -->
			          
<!-- 			          <button type="button" class="hd-btn hd-mypage-btn"> -->
<!-- 			            <span class="txt-hidden">마이페이지</span> -->
<!-- 			            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user-filled" width="24" -->
<!-- 			              height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" -->
<!-- 			              stroke-linejoin="round"> -->
<!-- 			              <path stroke="none" d="M0 0h24v24H0z" fill="none"></path> -->
<!-- 			              <path d="M12 2a5 5 0 1 1 -5 5l.005 -.217a5 5 0 0 1 4.995 -4.783z" stroke-width="0" fill="currentColor"> -->
<!-- 			              </path> -->
<!-- 			              <path d="M14 14a5 5 0 0 1 5 5v1a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2v-1a5 5 0 0 1 5 -5h4z" stroke-width="0" -->
<!-- 			                fill="currentColor"></path> -->
<!-- 			            </svg> -->
<!--          		 	  </button> -->
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa-solid fa-user-group"></i>
<!--                         <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span> -->
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa-regular fa-message"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa-regular fa-bell"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+20</span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa-regular fa-user"></i>                    
                    </a>
            </div>
        </div>
    </nav>
    </header>
    <!-- Close Header -->
</body>
</html>