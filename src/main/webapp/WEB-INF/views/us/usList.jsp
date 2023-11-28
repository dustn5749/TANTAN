<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<meta charset="UTF-8">
<title>동행 목록조회</title>
<style>
@font-face {
   font-family: 'Pretendard-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
      format('woff');
   font-weight: 400;
   font-style: normal;
}

.us_container {
   width: 94%;
   margin: 0 auto;
}

.content {
   padding: 4%;
}

.us_header_size {
   float: right;
   /*     width: 237px; */
   top: 80px;
   height: fit-content;
   background-color: rgb(255, 255, 255);
   display: flex;
}

.card.box-shadow{
	height: 500px;
}


.card-body.p-4{
	height: 450px;
}
.card-footer.p-4.pt-0.border-top-0.bg-transparent{
	height: 45px;
	margin-bottom: 5px;
}
.text-center {
	height: 100%;
	
}
.text-center > button {
	height: 100%;
}
.fw-bolder {
	margin-bottom: 10px;
}
}
.us_header {
   position: sticky;
   z-index: 9;
   top: 80px;
   height: fit-content;
   background-color: rgb(255, 255, 255);
   transition: all 0.1s ease-in-out 0.3s;
}

.us_header2 {
   background-color: rgb(255, 255, 255);
}

.us_header3 {
   display: flex;
   -webkit-box-pack: center;
   justify-content: center;
   -webkit-box-align: center;
   align-items: center;
   position: sticky;
   z-index: 9;
   top: 80px;
   width: 100%;
   height: 44px;
   margin-top: 20px;
   padding: 0px 0px 20px;
   /*        background-color: rgb(255, 255, 255); */
}

.us_header4 {
   z-index: 9;
   box-sizing: border-box;
   width: 260px;
   height: 38px;
   padding: 0px 18px;
   background: rgba(0, 0, 0, 0);
}

.us_header5 {
   position: relative;
   display: flex;
   -webkit-box-align: center;
   align-items: center;
   box-sizing: border-box;
   width: 100%;
   height: 100%;
   padding: 6px;
   background-color: rgb(248, 248, 248);
   border-radius: 50px;
}

.us_header6 {
   position: relative;
   display: flex;
   -webkit-box-align: center;
   align-items: center;
   box-sizing: border-box;
   width: 100%;
   height: 100%;
   border-radius: 50px;
}

.us_inner {
   position: absolute;
   left: 0px;
   width: 50%;
   height: 34px;
   background-color: rgb(37, 37, 37);
   border-radius: 20px;
   box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 6px 0px;
}

.us_btn {
   position: relative;
   box-sizing: border-box;
   width: 50%;
   height: 34px;
   display: flex;
   -webkit-box-pack: center;
   justify-content: center;
   -webkit-box-align: center;
   align-items: center;
   font-size: 15px;
   font-weight: 500;
   color: rgb(255, 255, 255);
   border-radius: 20px;
   transition: color 0.1s ease-out 0.4s;
   background-color: black;
   color: white;
}

.us_img {
   width: 16px;
   height: 16px;
   margin-right: 4px;
}

.schedule_btn {
   position: relative;
   box-sizing: border-box;
   width: 50%;
   height: 34px;
   display: flex;
   -webkit-box-pack: center;
   justify-content: center;
   -webkit-box-align: center;
   align-items: center;
   font-size: 15px;
   font-weight: 500;
   color: rgb(106, 106, 106);
   border-radius: 20px;
   transition: color 0.1s ease-out 0.4s;
}
/* 동행 생성하기 버튼 div */
.make_us {
   display: flex;
   float: right;
   width: 90%;
}

.make_us>button {
   width: 150px;
   height: 35px;
   background-color: rgb(81, 174, 255);
   border-radius: 7px;
}

.us_fillter {
   margin: 0 auto;
   width: 1260px;
}

.fillter_btn_area {
   display: flex;
   width: 300px;
   margin-bottom: 30px;
}

.fillter_btn {
   width: 80px;
   height: 40px;
   border-radius: 10px;
   background-color: black;
   color: white;
}

.fillter_btn+.fillter_btn {
   margin: 0 10px;
}

.fillter_btn:hover {
   background-color: white;
   color: black;
}

.city_btn {
   cursor: pointer;
   position: relative;
   display: inline-flex;
   align-items: center;
   justify-content: center;
   box-sizing: border-box;
   width: 80px !important;
   height: 40px;
   margin-right: 15px;
   margin-left: 0;
   padding: 8px 14px;
   background: #0099ff;
   border: 1px solid rgb(233, 233, 233);
   border-radius: 10px;
}

.city_btn1 {
   cursor: pointer;
   position: relative;
   display: inline-flex;
   align-items: center;
   justify-content: center;
   box-sizing: border-box;
   width: 80px !important;
   height: 40px;
   margin-right: 15px;
   margin-left: 0;
   padding: 0px;
   background: #0099ff;
   border: 1px solid rgb(233, 233, 233);
   border-radius: 10px;
}

.city_fillter_inner {
   display: flex;
}

.mainItem {
   display: none;
}

.mainItem.active {
   display: block;
}

.sub.active {
   display: block;
}

ul>li {
   list-style: none;
}

.ehUQiC {
   display: flex;
   -webkit-box-align: center;
   align-items: center;
   -webkit-box-pack: center;
   justify-content: center;
   width: 100%;
   height: 32px;
   margin: 108px 0px 140px;
   padding: 0px;
}

.bPLlTV {
   cursor: pointer;
   display: flex;
   -webkit-box-align: center;
   align-items: center;
   -webkit-box-pack: center;
   justify-content: center;
   width: 32px;
   height: 32px;
   margin: 0px 5px;
   font-size: 16px;
   color: rgb(0, 0, 0);
   background-color: rgb(255, 255, 255);
}

.fcPuDF {
   cursor: pointer;
   display: flex;
   -webkit-box-align: center;
   align-items: center;
   -webkit-box-pack: center;
   justify-content: center;
   width: 38px;
   height: 38px;
   margin: 0px 5px;
   padding-right: 0px;
   padding-left: 2px;
   background-color: rgb(255, 255, 255);
   border: 1px solid rgb(238, 238, 238);
   border-radius: 50px;
}

.bPLlTV {
   cursor: pointer;
   display: flex;
   -webkit-box-align: center;
   align-items: center;
   -webkit-box-pack: center;
   justify-content: center;
   width: 32px;
   height: 32px;
   margin: 0px 5px;
   font-size: 16px;
   color: rgb(0, 0, 0);
   background-color: rgb(255, 255, 255);
}

.fcPuDF {
   cursor: pointer;
   display: flex;
   -webkit-box-align: center;
   align-items: center;
   -webkit-box-pack: center;
   justify-content: center;
   width: 38px;
   height: 38px;
   margin: 0px 5px;
   padding-right: 0px;
   padding-left: 2px;
   background-color: rgb(255, 255, 255);
   border: 1px solid rgb(238, 238, 238);
   border-radius: 50px;
}

.ekMLCz {
   display: flex;
   -webkit-box-align: center;
   align-items: center;
   -webkit-box-pack: center;
   justify-content: center;
   width: auto;
   height: 32px;
   margin: 0px 10px;
}

.fdmLWW {
   cursor: pointer;
   display: flex;
   -webkit-box-align: center;
   align-items: center;
   -webkit-box-pack: center;
   justify-content: center;
   width: 38px;
   height: 38px;
   margin: 0px 5px;
   padding-right: 1px;
   padding-left: 0px;
   background-color: rgb(255, 255, 255);
   border: 1px solid rgb(238, 238, 238);
   border-radius: 50px;
}

.mainTxt {
   position: relative;
}

.sub {
   position: absolute;
   index: 1;
   left: 0;
   bottom: 0;
   display: none;
   list-style: none;
}

.schedule_btn {
   cursor: pointer !important;
}

.schedule_btn:hover {
   background-color: black !important;
   color: white !important;
}

.py-5 {
   padding: 10px;
}

.schedule_container {
   width: 70%;
   margin: 0 auto;
}

ul>li {
   position: relative;
}

ul . {
   position: abd
}

.nav-wrap {
   position: relative;
   margin: 50px auto 0;
   width: 1000px;
   height: 50px;
}

.nav-wrap:after {
   content: "";
   position: absolute;
   top: 50%;
   left: 0;
   margin-top: -15px;
   width: 6px;
   height: 30px;
   background-color: #0099FF;
}

.nav-wrap h2 {
   position: absolute;
   top: 0;
   left: 0;
   width: 100px;
   height: 30px;
   line-height: 50px;
   font-size: 20px;
   font-weight: bold;
   text-align: center;
}

.nav-wrap .nav-ul {
   margin: 0 0 0 100px;
   padding: 0;
   width: 900px;
   list-style: none;
}

.nav-li {
   float: left;
   width: 100px;
   height: 50px;
}

.nav-li:hover a {
   color: #0099FF;
}

.nav-li a {
   display: block;
   line-height: 50px;
   text-decoration: none;
   font-size: 16px;
   font-weight: 400;
   color: #999;
}

/* 사용자 정의 스타일 */
.dropdown-menu {
   background-color: #f8f9fa; /* 배경색 */
   border: none; /* 기본 테두리 제거 */
   width: auto; /* 필요에 따라 너비 조절 */
}

.dropdown-menu .nav-ul {
   list-style: none;
   padding: 0;
}

.dropdown-menu .nav-li {
   padding: 8px 20px;
}

.dropdown-menu .nav-li a {
   text-decoration: none;
   color: #333; /* 텍스트 색상 */
   display: block;
}

.dropdown-menu .nav-li a:hover {
   background-color: #cce5ff; /* 호버 색상 */
   color: #0069d9; /* 호버 텍스트 색상 */
}
/* 이미지 div */
.img_div {
   display: flex;
}

.us_content_img {
   border: none;
   box-shadow: 1px 1px 1px 1px rgb(237, 237, 237);
   width: 95%;
   height: 200px;
}

.fw-bolder {
   font-size: 20px !important;
   margin-bottom: 10px;
   margin-top: 10px;
   font-weight: bold;
   font-family: 'Pretendard-Regular';
}

div, input, p, span, button, h2 {
   font-family: 'Pretendard-Regular' !important;
}

/* 상세 보기 버튼 */
.detailBtn {
   background: white;
   border: none;
   width: 120px;
   height: 45px;
   border-radius: 8px;
   cursor: pointer;
}

.detailBtn:hover {
   background-color: black;
   color: white;
}

/* 페이징 처리 */
.nav_div {
	margin-top: 30px;
	margin-bottom: 30px;
	
}

.nav_div > a {
	font-size: 20px !important;
	cursor: pointer !important;
}
.nav_div > a:hover {
	color : red;
}
.nav_div  > strong {
	font-size: 24px !important;
	background-color: rgb(248, 248, 248);
}
.nav_div> a,strong {
	margin-left: 10px;
}

</style>
</head>

<body>

   <div class="schedule_container">
      <div class="us_header">
         <div class="us_header2"></div>
         <div class="us_header3">
            <div class="us_header4">
               <div class="us_header5">
                  <div class="us_header6">
                     <div class="us_inner" style="left: 0%;"></div>
                     <button class="us_btn">
                        <img src="/assets/img/women_holding_hands.png" alt="동행"
                           class="us_img">동행
                     </button>
                     <button class="schedule_btn">
                        <img src="/assets/img/answer2_img02.png" alt="일정" class="us_img">일정

                     </button>
                  </div>
               </div>
            </div>
         </div>



         <div class="us_fillter">
            <div class="us_header_size">
               <button id="categoryButton"
                  data-testid="category-bar-filter-button"
                  style="--filter-button_border: 1px solid var(--j-qkgmf); cursor: pointer; position: relative; display: inline-flex; align-items: center; justify-content: center; box-sizing: border-box; height: 40px; margin-right: 15px; margin-left: 0; padding: 0; background: #fff; border: 1px solid #e9e9e9; border-radius: 10px;">
                  <span class="i1fo7oz dir dir-ltr"
                     style="display: flex; align-items: center;"> <svg
                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                        style="fill: none; height: 25px; width: 25px; stroke: currentColor; stroke-width: 3; overflow: visible"
                        aria-hidden="true" role="presentation" focusable="false">
                    <path fill="none"
                           d="M7 16H3m26 0H15M29 6h-4m-8 0H3m26 20h-4M7 16a4 4 0 1 0 8 0 4 4 0 0 0-8 0zM17 6a4 4 0 1 0 8 0 4 4 0 0 0-8 0zm0 20a4 4 0 1 0 8 0 4 4 0 0 0-8 0zm0 0H3"></path>
                </svg> <span class="b1prp6wh dir dir-ltr"
                     style="margin-left: 5px;">지역</span>
                  </span>
               </button>

               <button class="city_btn1"
                  style="cursor: pointer; position: relative; display: inline-flex; align-items: center; justify-content: center; box-sizing: border-box; width: auto; height: 40px; margin-right: 15px; margin-left: 0; padding: 0px; background: rgb(255, 255, 255); border: 1px solid rgb(233, 233, 233); border-radius: 10px;">글쓰기</button>
            </div>

            <div class="fillter_btn_area"
               style="display: flex; justify-content: flex-end;">
               <button class="fillter_btn">댓글순</button>
               <button class="fillter_btn">조회순</button>
               <button class="fillter_btn">인기순</button>
            </div>
         </div>


         <div class="row">
            <c:forEach var="item" items="${result.list}">
               <div class="col-md-3 mb-4">
                  <div class="card box-shadow">
                     <div class="card-body p-4">
                        <div class="text-center">
                           <div class="img_div">
							<c:choose>
								<c:when test="${item.fileNo!=0}">
									<img src="/file/displayImage.do?usFileNum=${item.fileNo}" alt="동행이미지 사진" class="us_content_img">
								</c:when>
								<c:when test="${!empty item.imageUrl}">
								 	<img src="${item.imageUrl}" class="us_content_img">
								</c:when>
								<c:when test="${empty item.imageUrl&& item.fileNo==0}">
								    <img src="https://tripsoda.s3.ap-northeast-2.amazonaws.com/prod/accompany/1697506783063-1207"
                                    class="us_content_img">
								</c:when>
							</c:choose>
							
      <%--                         <c:if test="${item.fileNo!=0}">
                                 <img src="/file/displayImage.do?usFileNum=${item.fileNo}"
                                    alt="동행이미지 사진" class="us_content_img">
                              </c:if>
                              <c:if test="${!empty item.imageUrl}">
                                 <img src="${item.imageUrl}" class="us_content_img">
                              </c:if>
                              <c:if test="${empty item.imageUrl&& item.fileNo==0}">
                                 <img
                                    src="https://tripsoda.s3.ap-northeast-2.amazonaws.com/prod/accompany/1697506783063-1207"
                                    class="us_content_img">
                              </c:if> --%>


                           </div>
                           <h5 class="fw-bolder">${item.title}</h5>
                           <p>${item.writer}</p>
                           <div class="us_day">
                              <p class="menu">모집기간</p>
                              <span id="start_day"> ${item.start_Date} ~ </span> <span
                                 id="end_day">${item.end_Date}</span>
                           </div>
                           <div class="us_cnt_div">
                              <span class="menu">모집 인원</span> : <span>${item.us_cnt}
                                 명</span>
                           </div>
                        </div>
                     </div>
                     <input type="hidden" value="${item.us_num}" class="us_num">
                     <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                           <input type="button" value="상세보기" class="detailBtn">
                        </div>
                     </div>
                  </div>
               </div>
            </c:forEach>
         </div>
         
         <form name="pageForm" id="pageForm" action="/us/list"
            method="get">
            <input type="hidden" name="pageNo" id="pageNo"
               value="${result.us.pageNo}">
            <%--<input type="hidden" id="pageNo2" name="pageNo" value="${result.schedule.pageNo}">--%>
         </form>

         <!-- 페이징 처리 -->
         <div class="nav_div" style="text-align: center; margin-top: 10px;">
            <c:if test="${result.us.navStart != 1}">
               <a href="#" onclick="jsPageNo(${result.us.navStart-1})"
                  class="pageArrow">&lt;</a>
            </c:if>


            <c:forEach var="item" begin="${result.us.navStart}"
               end="${result.us.navEnd}">
               <c:choose>
                  <c:when test="${result.us.pageNo != item}">
                     <a href="#" onclick="jsPageNo(${item})" class="pageNum">${item}</a>
                  </c:when>
                  <c:otherwise>
                     <strong>${item}</strong>
                  </c:otherwise>
               </c:choose>
            </c:forEach>


            <c:if test="${result.us.navEnd != result.us.totalPageSize}">
               <a href="#" onclick="jsPageNo(${result.us.navEnd+1})"
                  class="pageArrow">&gt;</a>
            </c:if>

         </div>
      </div>
   </div>
		<c:choose>
		    <c:when test="${empty principal}">
		        <input type="hidden" value="${principal.user.member_id}" class="member">			
		    </c:when>
		    <c:otherwise>
		        <input type="hidden" value="null" class="member">
		    </c:otherwise>		
		</c:choose>



   <script>
 $(".city_btn1").on("click", function() {
		if($(".member").val()!=""){
			location.href="/us/write";		
		} else {
			alert("로그인 후 이용해주세요")
		}
	 
	})

    function jsPageNo(pageNo) {
        document.getElementById("pageNo").value = pageNo;
        document.getElementById("pageForm").submit();
    }

    document.addEventListener("DOMContentLoaded", function() {
        var scheduleBtn = document.querySelector(".schedule_btn");

        if (scheduleBtn) {
            scheduleBtn.addEventListener("click", function(event) {
                location.href = "/schedule/list";
            });
        }
    });

     /* 동행 상세보기 */
         $(".detailBtn").on("click", function(e){
          console.log("상세보기")
           const us_num = e.target.closest(".card").querySelector(".us_num").value;
          
            location.href="/us/Detail?us_num="+us_num;
       });

</script>

</body>
</html>