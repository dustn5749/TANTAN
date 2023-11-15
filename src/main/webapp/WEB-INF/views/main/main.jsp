<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
/* 배너 */
.carousel-inner{
	background-color: rgb(244, 250, 255);
}



#template-mo-zay-hero-carousel .carousel-control-next i, #template-mo-zay-hero-carousel .carousel-control-prev i {
    color: #0099ff !important;
    font-size: 2.8em !important;
}

#template-mo-zay-hero-carousel .carousel-indicators li {
    margin-top: -50px;
    background-color: #0099FF;
}
/* 배너 슬라이드img div */
.carousel-item {
    position: relative;
     height: 900px;
}
.carousel-item >  .d-block{
  overflow: cover;
}


/* 일정검색 img  */	
.schedule_search_bar {
    position: absolute;
    top: 50%; /* 수직 가운데 정렬 */
    left: 50%; /* 수평 가운데 정렬 */
    transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
    z-index: 1; /* 이미지를 최상위로 표시 */
    width: 50%; /* 초기 너비 100% */
}

@media (max-width: 769px) {
    .schedule_search_bar {
        max-width: 500px; /* 화면 폭이 769px 이하일 때 이미지 너비 500px */
    }
}
	
/* 일정검색 input */	
.schedule_bar {
    position: absolute;
    top: 72%; /* 수직 가운데 정렬 */
    left: 51%; /* 수평 가운데 정렬 */
    transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
    z-index: 1; /* 이미지를 최상위로 표시 */;
    flex-direction: column;
    display: flex;
    justify-content: space-between; /* 요소 사이의 간격을 균등하게 배치합니다 */
    align-items: center; /* 요소들을 수직 중앙 정렬합니다 */
  

}

.schedule_bar_inner {
    display: flex;
    flex-direction: row; /* 가로로 정렬합니다 */
    align-items: center; /* 요소들을 수직 중앙 정렬합니다 */
    margin-right: 20px; /* 요소 사이의 간격을 조절합니다 */
    margin-bottom: 10px;
    /* 다른 스타일 속성들 */
}

.schedule_menu {
    font-weight: bold;
    font-family: 'Pretendard-Regular';
    margin-right:10px; 
    font-size: 20px !important;
}

.schedule_menu_input {
    margin-top: 5px;
    font-family: 'Pretendard-Regular' !important;
}

.start_date,
.end_date {
    width: 200px;
}
/* 검색버튼 div */

.search_button {
	font-family: 'Pretendard-Regular';
    margin-top: 10px;
    width: 250px;
    height: 35px;
    border-radius: 5px;
    background-color: rgb(22, 108, 228);
    color: white;
    border: none;
    box-shadow: 1px 1px 1px 1px rgb(0, 71, 170);
}

.search_button:hover {
	background: rgb(0, 71, 170);

}
/* best top5 여행지 */
.best_top5_city {	
   	background: url("/assets/img/wave.jpg");
    width: 100%;
    height: 700px;
    margin: 0 auto;
    align-content: center;
    align-items: center;
    text-align: center;
    padding: 20px;
    overflow: scroll;
    justify-content: center;
}

.best_top5_city_inner {
    margin: 0 auto;
    align-content: center;
    align-items: center;
    text-align: center;
    display: flex;
    flex-wrap: wrap;
    width: 100%;
    justify-content: center;
}


.best_city_title {
	font-size: 50px  !important;
	font-weight: bold !important;
	font-family: 'Pretendard-Regular' !important;
	margin-bottom:30px; 
}

/* 더보기  div */
.plus_div{
	text-align: right;
	padding-right: 5%;
	padding-bottom: 1%;

}
.plus_a {
	font-family: 'Pretendard-Regular' !important;
	color : grey !important;
	cursor: pointer !important;
	font-size: 18px !important;
	text-decoration: none;
}
.plus_a:hover {
	color : red !important;
}

/* 반응형 스타일 추가 */
@media (max-width: 768px) {
    .case  {
        width: 100%; /* 화면이 768px 미만일 때 1개씩 표시 */
        margin: 10px 0;
		height: 450px;
		flex-direction: column;
		overflow: visible;
    }
    

}

@media (min-width: 769px) {
    .case  {
    	display: inline-block;
        width: 18%; /* 화면이 769px 이상일 때 5개씩 표시 */
        margin: 0 10px;
		height: 400px;
    }
    
   
}
/* 지역 사진 div */
.top5_city {
/*     border: 1px solid black;
 */    border-radius: 15px;
    height: 400px;
    width: 100%;
    cursor: pointer;
    overflow: hidden;
    position: relative;
}

.top5_city > img {
    width: 100%; /* Set the initial width to 100% */
    height: 100%; /* Set the initial height to 100% */
    object-fit: cover;
    position: absolute;
    top: 50%; /* Vertically center the image */
    left: 50%; /* Horizontally center the image */
    transform: translate(-50%, -50%); /* Center the image */
   
    
}

.top5_city:hover > img {
    width: 110%;
    height: 110%;
}

.city_name {
    margin: 10px;
    font-family: 'Pretendard-Regular' !important;
    font-size: 20px !important;
}

/* 지역 사진 */
.city_img {
    display: block; /* Add this line to remove any extra spacing */
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 15px;
}

/* 최신 동행 모집 */

.container .py-5{
}

.col-12 .col-md-4 .p-5 .mt-3 {
	width: 20% !important;
}
.row, .text-center,  .text-center > a{
		font-family: 'Pretendard-Regular' !important;
}

/* 최신 동행 모집 title */
.fw-bolder {
	font-size: 23px !important;
	height: 30px;
	margin-bottom:10px;
	font-weight: bold;
	font-family: 'Pretendard-Regular' !important;
	
}
/* 날짜 */
.date {
	font-size: 14px !important;
	color : rgb(121, 121, 121);
}

/* 상세 보기 버튼 */
.detailBtn {
	background: white;
	border: none;
	width: 120px;
	height: 45px;
	border-radius: 8px;
	cursor: pointer;
	font-family: 'Pretendard-Regular' !important;
}
.detailBtn:hover {
	background-color: black;
	color : white;
}

 /* 최신 동행 모집 사진 이미지  */
 
 .img_div {
 	width: 100%;
 	height: 300px;
 }
 #us_file_img{
 	width: 100%;
 	height: 100%;
 }
</style>
</head>
<body>

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>


<!-- Start Banner Hero -->
<div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
    <ol class="carousel-indicators" >
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
        <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
    </ol>

    <!-- 배너 이미지 위치 -->
	<div class="carousel-inner">
    <div class="carousel-item active">
        <img src="/assets/img/sea.jpg" class="d-block w-100 h-100" alt="First Slide" >
        <img src="/assets/img/search_menubar.png" class="schedule_search_bar">
           <div class="schedule_bar">
          <%@ include file="/WEB-INF/views/main/schedule_bar_inner.jsp"%>
        </div>
    </div>
    <div class="carousel-item">
        <img src="/assets/img/palace.jpg" class="d-block w-100 h-100" alt="Second Slide"   height="700px" >
        <img src="/assets/img/search_menubar.png" class="schedule_search_bar">
           <div class="schedule_bar">
            <%@ include file="/WEB-INF/views/main/schedule_bar_inner.jsp"%>
        </div>
    </div>
    <div class="carousel-item">
    	
        <img src="/assets/img/boat.jpg" class="d-block w-100 h-100" alt="Third Slide"  height="700px">
        <img src="/assets/img/search_menubar.png" class="schedule_search_bar">
           <div class="schedule_bar">
            <%@ include file="/WEB-INF/views/main/schedule_bar_inner.jsp"%>
        </div>
    </div>
</div>

    <!-- 배너 슬라이드 화살표 -->
    <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
        <i class="fas fa-chevron-left"></i>
    </a>
    <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
        <i class="fas fa-chevron-right"></i>
    </a>
</div>
<!-- End Banner Hero -->

	<!-- best top5 지역 -->
	
    <div class="best_top5_city">
        <p class="best_city_title">BEST 여행지 TOP5</p>
        <div class="plus_div"><a class="plus_a" href="/review/main">+더보기</a></div>
        <div class="best_top5_city_inner">
            <div class="case">
                <div class="top5_city">
                	<img src="/assets/img/seoul.jpg" class="city_img">
                </div>
                    <p class="city_name">서울</p>
            </div>
            <div class="case">
                <div class="top5_city">
                    <img src="/assets/img/busan.jpg" class="city_img">
                </div>
                    <p class="city_name">부산</p>
            </div>
            <div class="case">
                <div class="top5_city">
                <img src="/assets/img/geoungju.png" class="city_img">
                </div>
                    <p class="city_name">경주</p>
            </div>
            <div class="case">
                <div class="top5_city">
                 <img src="/assets/img/jeju2.jpg" class="city_img">
                 
                </div>
                    <p class="city_name">제주</p>
            </div>
            <div class="case">
                <div class="top5_city">
                <img src="/assets/img/Gangneung.jpg" class="city_img">
                </div>
                    <p class="city_name">강릉</p>
            </div>
        </div>
    </div>



    <!-- 최신 동행 모집 -->
    <section class="container py-6">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="best_city_title">최신 동행 모집</h1>
            </div>
        </div>
        <!-- 최신 동행 모집 div -->
        <div class="row">
         <c:forEach items="${usList}" var="item">
        	 <div class="col-12 col-md-4 p-5 mt-3">
            	<div class="card-header" style=border-radius:5%;>
            	<div class="row text-center" style=display:inline-block;><span id="writer">작성자</span> <span>${item.writer}</span></div>
            	<div class="row text-center" style=display:inline-block;float:right;><span><img src="/assets/img/new.png" width="32px;"></span></div>
            	</div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="img_div">
									<img class="card-img-top" src="/file/displayImage.do?usFileNum=${item.fileNo}" alt="동행사진" id="us_file_img"/>
                            </div>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${item.title}</h5>
                                    <!-- Product price-->
                                   <span class="date">${item.start_Date}</span> ~ <span  class="date">${item.end_Date}</span>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
					            <input type="hidden" value="${item.us_num}" class="us_num">
                                <div class="text-center"><button class="detailBtn">상세보기</button></div>
                            </div>
                        </div>
                    </div>
            </div>
        </c:forEach>
        </div>
    </section>
    <!-- End Categories of The Month -->


    <!-- best(좋아요순)5 일정 공유 -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">일정공유</h1>
                </div>
            </div>
            <div class="row" id="schedule">
	            <div class="col-12 col-md-4 p-5 mt-3">
	                	<div class="col mb-5">
		                    <div class="card h-100">
		                        <!-- Product image-->
		                        <img class="card-img-top" src="assets/img/busan.jpg" />
		                        
		                        <!-- Product details-->
		                        <div class="card-body p-6">
		                            <div class="text-center">
		                            <img src="assets/img/check.png" style=width:30px;float:inline-start; />
		                            <p style=text-align:left;>부산
		                            <hr>
		                                <!-- Product name-->
		                                <h5 class="fw-bolder" style=display:inline;>User1님의 여행일정</h5>
		                                <hr>
		                                <!-- Product price-->
		                            </div>
		                        </div>
		                        <!-- Product actions-->
		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent" style=text-align:center;>
		                            <div class="text-center" style=display:contents;><a class="btn btn-outline-dark mt-auto" href="#">일정담기</a></div>
		                            <div class="text-center" style=display:contents;><a class="btn btn-outline-dark mt-auto" href="#">일정 상세보기</a></div>
		                        </div>
		                    </div>
	                    </div>
	            </div>
	            <div class="col-12 col-md-4 p-5 mt-3">
	                	<div class="col mb-5">
		                    <div class="card h-100">
		                        <!-- Product image-->
		                        <img class="card-img-top" src="assets/img/busan.jpg" />
		                        
		                        <!-- Product details-->
		                        <div class="card-body p-6">
		                            <div class="text-center">
		                            <img src="assets/img/check.png" style=width:30px;float:inline-start; />
		                            <p style=text-align:left;>부산
		                            <hr>
		                                <!-- Product name-->
		                                <h5 class="fw-bolder" style=display:inline;>User1님의 여행일정</h5>
		                                <hr>
		                                <!-- Product price-->
		                            </div>
		                        </div>
		                        <!-- Product actions-->
		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent" style=text-align:center;>
		                            <div class="text-center" style=display:contents;><a class="btn btn-outline-dark mt-auto" href="#">일정담기</a></div>
		                            <div class="text-center" style=display:contents;><a class="btn btn-outline-dark mt-auto" href="#">일정 상세보기</a></div>
		                        </div>
		                    </div>
	                    </div>
	            </div>
	            <div class="col-12 col-md-4 p-5 mt-3">
	                	<div class="col mb-5">
		                    <div class="card h-100">
		                        <!-- Product image-->
		                        <img class="card-img-top" src="assets/img/busan.jpg" />
		                        
		                        <!-- Product details-->
		                        <div class="card-body p-6">
		                            <div class="text-center">
		                            <img src="assets/img/check.png" style=width:30px;float:inline-start; />
		                            <p style=text-align:left;>부산
		                            <hr>
		                                <!-- Product name-->
		                                <h5 class="fw-bolder" style=display:inline;>User1님의 여행일정</h5>
		                                <hr>
		                                <!-- Product price-->
		                            </div>
		                        </div>
		                        <!-- Product actions-->
		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent" style=text-align:center;>
		                            <div class="text-center" style=display:contents;><a class="btn btn-outline-dark mt-auto" href="#">일정담기</a></div>
		                            <div class="text-center" style=display:contents;><a class="btn btn-outline-dark mt-auto" href="#">일정 상세보기</a></div>
		                        </div>
		                    </div>
	                    </div>
	            </div>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->
<script>
	/* 동행 상세보기 */
	$(".detailBtn").on("click", function(e){
	console.log("상세보기")
    const us_num = e.target.closest(".card-footer").querySelector(".us_num").value;
   
  	location.href="/us/Detail?us_num="+us_num;
});

</script>	

</body>
</html>