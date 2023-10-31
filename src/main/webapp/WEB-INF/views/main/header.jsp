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
	
	 /* 버튼 아이콘의 크기를 조절 */
    .nav-icon i {
        font-size: 30px; /* 원하는 크기로 조절합니다. */
    }
    
    /* 버튼들 간격을 조절 */
    .nav-icon {
        margin-right: 20px; /* 원하는 간격으로 조절합니다. */
    }
    
	.nav-link {
        font-family: 'NPSfontBold';
        font-size: 20px !important;
    }
    
    .navbar .align-self-center .d-flex {
    	width: 200px !important;
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
                            <a class="nav-link" href="">커뮤니티</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/board/list">동행</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.html">고객센터</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/member/loginForm.do">로그인</a>
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