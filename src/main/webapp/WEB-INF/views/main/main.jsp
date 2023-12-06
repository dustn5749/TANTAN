<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
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


@font-face {
    font-family: 'MICEGothic Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}


/* 배너 */
.carousel-inner{
	background-color: rgb(244, 250, 255);
	position: relative;
}

.imgarea {
    position: absolute;
    top: 50%; /* 수직 가운데 정렬 */
    left: 50%; /* 수평 가운데 정렬 */
    transform: translate(-50%, -50%); /* 가운데 정렬을 위한 변환 */
    z-index: 1; /* 이미지를 최상위로 표시 */
    width: 50%; /* 초기 너비 100% */
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

.schedule_search_bar{
	display: block;
	width: 100%;
	height: 100%;	
} 

@media (max-width: 769px) {
    .schedule_search_bar {
        max-width: 500px; /* 화면 폭이 769px 이하일 때 이미지 너비 500px */
    }
}
	
/* 일정검색 input */	
.schedule_bar {
    position: absolute;
    top: 67%; /* 수직 가운데 정렬 */
    left: 54%; /* 수평 가운데 정렬 */
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
  /*  	background: url("/assets/img/wave.jpg"); */
    width: 100%;
    height: 800px;
    margin: 0 auto;
    align-content: center;
    align-items: center;
    text-align: center;
    padding: 20px;
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
		position: relative;
    }
    

}

@media (min-width: 769px) {
    .case  {
    	display: inline-block;
        width: 18%; /* 화면이 769px 이상일 때 5개씩 표시 */
        margin: 0 10px;
		height: 400px;
		position: relative;
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
        font-family: 'MICEGothic Bold';
	color :  #0099ff !important;
	text-shadow: 1px 1px 1px grey;
    font-size: 35px !important;
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

.usContainer{
	width: 100%;
	
 	 background: url("/assets/img/fly.png"); /* no-repeat center fixed; */  
 	 background-size: cover;
	background-size: cover !important;
	
}

.col-12 .col-md-4 .p-5 .mt-3 {
	width: 15% !important;
}
.row, .text-center,  .text-center > a{
		font-family: 'Pretendard-Regular' !important;
}
.card-header {
	box-shadow: 15px 15px 20px grey;
	background: white;
}
.col.mb-5{
	box-shadow: 15px 15px 20px grey;
}
/* 최신 동행 모집 title */
.fw-bolder {

	font-size: 20px !important;
	height: 80px;
	margin-top:30px;
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
 	height: 250px;
 }
 .img_div >img {
 	height: 100%;
 	width: 100%;
 }
 #us_file_img{
 	width: 100%;
 	height: 100%;
 }
 
 /* 일정 공유 section  */
 .bg-light {
     background-color: rgb(236, 245, 255) !important; 
}
 .schedule_h1 {
 	font-family: 'Pretendard-Regular' !important;
 	font-weight: bold;
 	font-size: 50px !important;
 }
 
.card.h-100 {
	position: relative;
}
 .priceaArea{
 	position: absolute !important;
 	bottom: 500px;
 	display: inline-block;
 	background: none;
 	z-index: 15;
 }
 /* 일정공유 이미지 */
 .card-img-top{
 	height: 280px !important;
 }
 
 /* 일정상세보기 */
 .btn.schedule:hover{
	 background: black;
	 color: white;
 }
 
 /* 좋아요 지역이름 div */
 .doenameAndLikecnt {
 	display: flex;
 	
 }
 .doe_name {
 	width: 80%;
 }
 .likecnt {
 	width: 36%;
 }
 .card_inner_div {
 	padding: 30px;
 }
 .card_header_div {
 	height: 30px;
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
    </div>
    <div class="carousel-item">
        <img src="/assets/img/palace.jpg" class="d-block w-100 h-100" alt="Second Slide"   height="700px" >
    </div>
    <div class="carousel-item">
        <img src="/assets/img/boat.jpg" class="d-block w-100 h-100" alt="Third Slide"  height="700px">
    </div>
       <div class="imgarea">
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
        <div class="best_city_title">
        	<img src="/assets/img/bestTravel.png" width="450px">
        </div>
        <div class="plus_div"><a class="plus_a" href="/review/main">+더보기</a></div>
        <div class="best_top5_city_inner">
        <c:forEach items="${doeList}" var="item">
             <div class="case">
                <div class="top5_city" data-value="${item.doe_name}">
                	<img src="/assets/img/doereview/${item.doe_review}" class="city_img">
                </div>
                    
	            <div class="doe_Name">
	            	<p class="city_name">${item.doe_name}</p>
	            </div>
            </div>
        </c:forEach>
        </div>
    </div>



    <!-- 최신 동행 모집 -->
    <section class="usContainer">
    <section class="container py-6">
        <div class="row text-center pt-3">
	        <div class="best_city_title">
	        	<img src="/assets/img/newus.png" width="470px">
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
                            
                            <c:if test="${item.fileNo!=0}">
							    <img src="/file/displayImage.do?usFileNum=${item.fileNo}" alt="동행이미지 사진" id="us_file_img">
							</c:if>
							<c:if test="${!empty item.imageUrl}">
							    <img src="${item.imageUrl}" id="us_file_img">
							</c:if>
							<c:if test="${empty item.imageUrl&& item.fileNo==0}">
							    <img src="https://tripsoda.s3.ap-northeast-2.amazonaws.com/prod/accompany/1697506783063-1207" id="us_file_img">
							</c:if>
                                                        
                            </div>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">${item.title}</h5>
                                    <!-- Product price-->
                                   <span class="date">${fn:substring(item.start_Date, 0, 10) }</span> ~ <span  class="date">${fn:substring(item.end_Date, 0, 10) }</span>
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
    </section>
    <!-- End Categories of The Month -->


    <!-- best(좋아요순)5 일정 공유 -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
		        <div class="row text-center pt-3">
			        <div class="best_city_title">
			        	<img src="/assets/img/pick.png" width="470px">
			        </div>
            </div>
            <div class="row" id="schedule">
            
           <c:forEach items="${scheduleList}" var="item" >
				
	            <div class="col-12 col-md-4 p-5 mt-3">
	                	<div class="col mb-7">
		                    <div class="card h-100" style="position: relative;">
		                    <div class="card_inner_div">
		                    	<div class="card_header_div">
		                    		<p id="boldText"></p>
		                    	</div>
		                        <!-- Product image-->
		                        <div class="priceaArea" style="position: absolute; text-align: left; width: 150px; left:33px; top: 13px;">
		                        	<img src="/assets/img/like.png" class="price" width="278px" height="31px">
		                        </div>
		                        <img class="card-img-top" src="/assets/img/doereview/${item.doe_img}" />
		                        
		                        <!-- Product details-->
		                        <div class="card-body p-6">
		                            <div class="text-center">
		                            <img src="assets/img/check.png" style=width:30px;float:inline-start; />
		                            <div class="doenameAndLikecnt">
		                            <input type="hidden" value="${item.schedule_Num }"  class="schedule_Num">      
			                            <p style=text-align:left; class="doe_name">${item.doe_Name}</p>
										<p class="likecnt">
											<svg id="heartIcon" class="heartIcon" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" data-schedule-num="0" style=" left: 0px; height: 24px; width: 24px; stroke: var(--f-mkcy-f); stroke-width: 2; overflow: visible; fill: rgb(255, 0, 0);">
    											<path d="M16 28c7-4.73 14-10 14-17a6.98 6.98 0 0 0-7-7c-1.8 0-3.58.68-4.95 2.05L16 8.1l-2.05-2.05a6.98 6.98 0 0 0-9.9 0A6.98 6.98 0 0 0 2 11c0 7 7 12.27 14 17z">
    											</path>
											</svg>
										${item.likecnt}</p>		                            
		                            </div>
		                            
		                            <hr>
		                                <!-- Product name-->
		                                <h5 class="fw-bolder" style=display:inline;>${item.member_id}</h5>
		                                <hr>
		                                <!-- Product price-->
		                            </div>
		                        </div>
		                        <!-- Product actions-->
		                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent" style=text-align:center;>
		                            <div class="text-center" style=display:contents;><a class="btn btn-outline-dark mt-auto" href="#">일정담기</a></div>
		                            <div class="text-center" style=display:contents; ><a class="btn schedule" href="#" >일정 상세보기</a></div>
		                        </div>
		                    </div>
	                    </div>
		             </div>
	            </div>
	            </c:forEach>
 
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
	
	/* 리뷰 상세보기 */
	$(".top5_city").on("click", function(e){
		 var doeName = $(this).data('value');
		 location.href="/review/display2?doe_name=" + doeName;
	})
	
	/* 일정 상세보기 */
	$(".btn.schedule").on("click", function(e) {
	    var schedule_Num = $(this).closest(".col-12").find(".schedule_Num").val();
    	location.href="/schedule/detail?schedule_Num=" +schedule_Num;
    // 여기에 원하는 동작을 추가하세요.
	});
	
	// 1,2,3등 이미지
/* 	document.addEventListener("DOMContentLoaded", function () {
        var priceImages = ["/assets/img/first.png", "/assets/img/second.png", "/assets/img/third.png"];
		
        var scheduleItems = document.querySelectorAll(".col-12.col-md-4.p-5.mt-3");

        scheduleItems.forEach(function (item, index) {

        	
        	
        	var priceImageSrc = priceImages[index % priceImages.length]; // Use modulo to cycle through the price images

            var price = $(".price");
        	alert(priceImageSrc)
            price.src = priceImageSrc;
       
        });
    }); */
	
</script>	

</body>
</html>