<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="UTF-8">
<title>일정 목록 조회</title>
<style>
@font-face {
   font-family: 'Pretendard-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
      format('woff');
   font-weight: 400;
   font-style: normal;
}

input, button, div, span, h2, p, h5{
 font-family: 'Pretendard-Regular';
}
.us_container {
   width: 80%;
   margin: 0 auto;
   padding: 3%;
}

.us_header_size {
   float: right;
   width: 19%;
   top: 80px;
   height: fit-content;
   /*     background-color: rgb(255, 255, 255); */
   display: flex;
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
   /*        padding: 0px 0px 20px;
       background-color: rgb(255, 255, 255); */
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
   color: black;
   border-radius: 20px;
   transition: color 0.1s ease-out 0.4s;
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
   background-color: black;
   color: white;
}

.us_fillter {
   PADDING: 10PX;
}

.fillter_btn_area {

/*    left: -820px; */
   width: 78%;

}

.fillter_btn {
   width: 80px;
   margin:34px;
   height: 40px;
   border-radius: 10px;
   background-color: black;
   color: white;
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

.us_btn:hover {
   background-color: black !important;
   color: white !important;
}

.py-5 {
   padding: 10px;
}

.schedule_container {
   width: 94%;
   margin: 0 auto;
}

#korea {
   display: none;
}

#myModal {
   display: none;
   position: fixed;
   z-index: 1;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgb(0, 0, 0);
   background-color: rgba(0, 0, 0, 0.4);
   padding-top: 60px; /* Adjust as needed */
}

/* Style for the modal content */
.modal-content {
   background-color: #fefefe;
   margin: 5% auto;
   padding: 20px;
   border: 1px solid #888;
   width: 80%; /* Adjust as needed */
   max-width: 600px; /* Set a maximum width if desired */
}

/* Center the modal content horizontally */
.modal-content {
   text-align: center;
}

.close {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}

.close:hover, .close:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}

.contents {
   text-align: center; /* 부모 요소를 가운데 정렬하는 스타일 */
}

/* 더보기 버튼 스타일 수정 */
#moreView {
   display: block;
   margin: 0 auto; /* 가운데 정렬을 위해 추가 */
   padding: 10px 20px;
   background-color: #3498db;
   color: #fff;
   text-decoration: none;
   border-radius: 4px;
   transition: background-color 0.3s ease;
}

#moreView:hover {
   background-color: #2980b9;
}

.btn-sm {
   padding: 0.2rem 0.5rem;
   font-size: 80%;
   border-radius: 0.2rem;
   width: 100px;
}

.button-container {
   text-align: center;
}
.card.box-shadow{
   height: 450px;
}
.schedule_detail {
   height: 130px;
   margin-top: 20px;
   margin-bottom: 20px;
}
.detail_btn_area {
   margin-top: 20px;
   height: 50px;
}
.detailBtn{
   background: white;
   border: none;
   width: 100px;
   height: 40px;
   border-radius: 7px;
}
.detailBtn:hover{
   background: black;
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
      </div>

      <div class="us_fillter">
         <div class="us_header_size">
            <button id="categoryButton" data-testid="category-bar-filter-button"
               style="--filter-button_border: 1px solid var(--j-qkgmf); cursor: pointer; position: relative; display: inline-flex; align-items: center; justify-content: center; box-sizing: border-box; height: 40px; margin-right: 15px; margin-left: 0; padding: 0; background: #fff; border: 1px solid #e9e9e9; border-radius: 10px;">
               <span class="i1fo7oz dir dir-ltr"
                  style="display: flex; align-items: center;"> <svg
                     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                     style="fill: none; height: 25px; width: 25px; stroke: currentColor; stroke-width: 3; overflow: visible"
                     aria-hidden="true" role="presentation" focusable="false">
            <path fill="none"
                        d="M7 16H3m26 0H15M29 6h-4m-8 0H3m26 20h-4M7 16a4 4 0 1 0 8 0 4 4 0 0 0-8 0zM17 6a4 4 0 1 0 8 0 4 4 0 0 0-8 0zm0 20a4 4 0 1 0 8 0 4 4 0 0 0-8 0zm0 0H3"></path>
        </svg> <span class="b1prp6wh dir dir-ltr location-filter" style="margin-left: 5px;">지역</span>
               </span>
            </button>


            <button class="city_btn1" onclick="window.location.href ='write'"
               style="cursor: pointer; position: relative; display: inline-flex; align-items: center; justify-content: center; box-sizing: border-box; width: auto; height: 40px; margin-right: 15px; margin-left: 0; padding: 0px; background: rgb(255, 255, 255); border: 1px solid rgb(233, 233, 233); border-radius: 10px;">글쓰기</button>
         </div>

         <!-- 필터 모달 -->
         <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
               <h1 id="filter-section-FILTER_SECTION_CONTAINER:ROOM_TYPE"
                  tabindex="-1" class="hpipapi dir dir-ltr"
                  elementtiming="LCP-target">국내여행</h1>
               <div
                  class="s1rt5b4y atm_c8_fkimz8 atm_g3_11yl58k atm_mk_h2mmj6__oggzyc atm_vy_1osqo2v__oggzyc ss5cljs atm_gp_z1y8gd atm_gp_logulu__oggzyc dir dir-ltr"
                  aria-hidden="true">관심있는 지역을 검색해보세요.</div>
               <br>
               <div class="smzyzaq atm_lh_pzf8ws__oggzyc dir dir-ltr">
                  <div class="form-check">
                     <input type="radio" name="deo_name" class="form-check-input"
                        id="all" value="all" checked="checked"> <label class="form-check-label"
                        for="all">전체</label>
                  </div>
                  <div class="form-check">
                     <input type="radio" name="deo_name" class="form-check-input"
                        id="seoulCheckbox" value="서울"> <label class="form-check-label"
                        for="seoulCheckbox">서울</label>
                  </div>

                  <div class="form-check">
                     <input type="radio" name="deo_name" class="form-check-input"
                        id="gangwonCheckbox" value="강원"> <label class="form-check-label"
                        for="gangwonCheckbox">강원도</label>
                  </div>

                  <div class="form-check">
                     <input type="radio" name="deo_name" class="form-check-input" id="jejuCheckbox">
                     <label class="form-check-label" for="jejuCheckbox">제주</label>
                  </div>

                  <div class="form-check">
                     <input type="radio" name="deo_name" class="form-check-input"
                        id="busanCheckbox"> <label class="form-check-label"
                        for="busanCheckbox">부산</label>
                  </div>

                  <div class="form-check">
                     <input type="radio" name="deo_name" class="form-check-input"
                        id="gyeonggiCheckbox" value="경기"> <label class="form-check-label"
                        for="gyeonggiCheckbox">경기</label>
                  </div>

                  <div class="form-check">
                     <input type="radio" name="deo_name" class="form-check-input"
                        id="chungcheongCheckbox"> <label
                        class="form-check-label" for="chungcheongCheckbox">충북</label>
                  </div>

                  <div class="form-check">
                     <input type="radio" name="deo_name" class="form-check-input"
                        id="gyeongsangCheckbox"> <label class="form-check-label"
                        for="gyeongsangCheckbox">경북</label>
                  </div>

                  <div class="form-check">
                     <input type="radio" name="deo_name" class="form-check-input"
                        id="jeollaCheckbox"> <label class="form-check-label"
                        for="jeollaCheckbox">전라도</label>
                  </div>

                  <div class="form-check">
                     <input type="radio" name="deo_name" class="form-check-input"
                        id="ulleungCheckbox"> <label class="form-check-label"
                        for="ulleungCheckbox">울릉도</label>
                  </div>
               </div>

               <br>
               <div style="text-align: center;">
                  <button type="button" class="btn btn-primary btn-sm"
                     onclick="moveRegion()">이동하기</button>
                  <button type="button" class="btn btn-primary btn-sm"
                     onclick="moveToSelectedRegion()">뒤로가기</button>
               </div>

            </div>
         </div>

         
         <div class="container">
         
                  <div class="fillter_btn_area" justify-content: flex-end;">
            <button class="fillter_btn" onclick="order('hh')">최신순</button>
            <button class="fillter_btn" style="margin-left: -28px;"
} onclick="order('like')">인기순</button>
         </div>
         
            <div class="cy5jw6o dir dir-ltr" role="group"
               data-testid="card-container"
               aria-labelledby="title_896641117667634802">
               <div class="lxq01kf l1tup9az dir dir-ltr">
                  <div class="m1v28t5c dir dir-ltr">
                     <div class="c14dgvke dir dir-ltr">
                        <div aria-describedby="carousel-description"
                           class="cnjlbcx cp0pqp0 rd7fm2t dir dir-ltr" role="group">
                           <div class="row">
                              <!-- Schedule Content -->
                              <c:forEach var="schedule" items="${result.scheduleList}">
                                 <div class="col-md-3 mb-4">
                                    <div class="card box-shadow">
                                       <div class="card-body p-4" tyle="border-radius: 30px;">



                                          <div class="text-center" style="position: relative;">
                                             <!-- Image Container -->
                                             <!-- Heart Icon -->
                                             <svg id="heartIcon" class="heartIcon" viewBox="0 0 32 32"
                                                aria-hidden="true" role="presentation" focusable="false"
                                                data-schedule-num="${schedule.schedule_Num }"
                        style="position: absolute; top: 0; left: 0; fill: ${schedule.like ? 'rgb(255, 0, 0)' : 'rgba(0, 0, 0, 0.5)'}; height: 24px; width: 24px; stroke: var(--f-mkcy-f); stroke-width: 2; overflow: visible;">
    <path
                                                   d="M16 28c7-4.73 14-10 14-17a6.98 6.98 0 0 0-7-7c-1.8 0-3.58.68-4.95 2.05L16 8.1l-2.05-2.05a6.98 6.98 0 0 0-9.9 0A6.98 6.98 0 0 0 2 11c0 7 7 12.27 14 17z">
    </path>
</svg>
                                             </a> <img src="/assets/img/local/${schedule.doe_img}"
                                                style="max-width: 100%; height: 200px; object-fit: cover;">
                                             <input type="hidden" name="memberId"
                                                value="${schedule.member_id}"> <input
                                                type="hidden" name="schedule_Num"
                                                value="${schedule.schedule_Num}">
                                            <div class="schedule_detail">
                                             <h5 class="fw-bolder">${schedule.title}</h5>
                                             <p>${schedule.member_id}</p>
                                             <p>지역:${schedule.doe_Name}</p>
                                             <p>여행시작:${schedule.start_Num != null ? schedule.start_Num : ""}</p>
                                             <p>여행끝:${schedule.end_Date != null ? schedule.end_Date : ""}</p>
<%--                                       	     <p>좋아요 수: ${schedule.LikeCNT != null ? schedule.LikeCNT : ""}</p> --%>
                                             <input type="hidden" name="regDate"
                                                value="${schedule.reg_Date != null ? schedule.reg_Date : ""}">
                                             <input type="hidden" value="${schedule.schedule_Num}"
                                                class="schedule_num">
                                          </div>
                                             <div 
                                                class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                                <div class="detail_btn_area">
                                                   <input type="button" value="상세보기" class="detailBtn">
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </c:forEach>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>


         <form name="pageForm" id="pageForm" action="/schedule/list"
            method="post">
            <input type="hidden" name="pageNo" id="pageNo"
               value="${result.schedule.pageNo}">
            <input type="hidden" id="pageNo2" name="pageNo" value="${result.schedule.pageNo}">
         </form>
         
         
      </div>

   </div>
         <!-- 페이징 처리 -->
         <div class="nav_div" style="text-align: center; margin-top: 10px;">
            <c:if test="${result.schedule.navStart != 1}">
               <a href="#" onclick="jsPageNo(${result.schedule.navStart-1})"
                  class="pageArrow">&lt;</a>
            </c:if>


            <c:forEach var="item" begin="${result.schedule.navStart}"
               end="${result.schedule.navEnd}">
               <c:choose>
                  <c:when test="${result.schedule.pageNo != item}">
                     <a href="#" onclick="jsPageNo(${item})" class="pageNum">${item}</a>
                  </c:when>
                  <c:otherwise>
                     <strong>${item}</strong>
                  </c:otherwise>
               </c:choose>
            </c:forEach>


            <c:if test="${result.schedule.navEnd != result.schedule.totalPageSize}">
               <a href="#" onclick="jsPageNo(${result.schedule.navEnd+1})"
                  class="pageArrow">&gt;</a>
            </c:if>
         </div>

<!--            <form name="searchForm" id="searchForm" action="/schedule/list" method="post"> -->
<%--              <input type="hidden" id="pageNo2" name="pageNo" value="${result.inquiry.pageNo}"> --%>
<!--              <div class="search_area"> -->
<!--                 <div class="search_menu_div"> -->
<!--                    <select id="search_menu_selects"> -->
<!--                       <option>제목</option> -->
<!--                       <option>유형</option> -->
<!--                       <option>작성일</option> -->
<!--                       <option>작성자</option> -->
<!--                       <option>진행상태</option> -->
<!--                    </select> -->
<!--                 </div> -->
<!--                 <div class="search_input_div"> -->
<!--                    <input type="text" id="search_input" name="searchTitle"> -->
<!--                    <button id="search_btn"><img src="/assets/img/search.png" width="30px"></button> -->
<!--                 </div> -->
<!--              </div> -->
<!--              </form> -->


   <script>
   function jsPageNo(pageNo) {
	    // 현재 URL 가져오기
	    var currentUrl = window.location.href;

	    // 기존의 pageNo 매개변수 제거
	    var regex = /[?&]pageNo(=[^&]*)?(&|$)/;
	    currentUrl = currentUrl.replace(regex, '$2');

	    // 현재 URL에 페이지 번호 추가
	    var newUrl;
	    if (currentUrl.indexOf('?') !== -1) {
	        newUrl = currentUrl + "&pageNo=" + pageNo;
	    } else {
	        newUrl = currentUrl + "?pageNo=" + pageNo;
	    }

	    // 새로운 URL을 폼의 액션으로 설정
	    document.getElementById("pageForm").action = newUrl;

	    // 페이지 번호 설정 및 폼 제출
	    document.getElementById("pageNo").value = pageNo;
	    document.getElementById("pageForm").submit();
	}

   
   function loadMoreData(start) {
    var member_Id = "member_id"; 
    var doe_Name = "doe_name"; 
    var schedule_Num = "schedule_num"; 
    var end_Date = "end_date";
    var reg_Date = "reg_date"; 

    $.ajax({
        type: "POST",
        url: "/schedule/list",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
            start: start,
            member_id: member_Id,
            doe_Name: doe_Name,
            schedule_Num: schedule_Num,
            end_Date: end_Date,
            reg_Date: reg_Date
        }),
        success: function (response) {
        },
        error: function (xhr, textStatus, errorThrown) {
            console.error("AJAX 요청 중 오류 발생:", textStatus, errorThrown);
        }
    });
}
            function moveToSelectedRegion() {
                window.location.href = '/schedule/list';
            }

            $(document).ready(function () {
                $('.heartIcon').click(function () {
                    var scheduleNum = $(this).data('schedule-num');
                    var heartIcon = $(this);
                    var currentColor = heartIcon.css('fill');
                    
                    console.log(scheduleNum)
                    var isLike = true;
                    if (currentColor == ('rgb(255, 0, 0)')) {   // 하트가 빨간색이면 (좋아요가 눌려있으면)
                       heartIcon.css('fill', 'rgba(0, 0, 0, 0.5)');   // 좋아요 취소
                       isLike = false;
                    } else {
                       heartIcon.css('fill', 'rgb(255, 0, 0');
                    }
                    
                    $.ajax({
                        url: '/schedule/updateHeartColor',
                        method: 'POST',
                        data: { scheduleNum: scheduleNum, isLike: isLike},
                        success: function (response) {
                            
                        },
                        error: function () {
                            console.error('Error during AJAX request.');
                        }
                    });
                });

              
                function jsPageNo(pageNo) {
                    document.getElementById("pageNo").value = pageNo;
                    document.getElementById("pageForm").submit();
                }

                
                //일정목록으로 이동 
                document.querySelector(".us_btn").addEventListener("click", function () {
                    location.href = "/us/list";
                });

                
                //상세보기
                $(".detailBtn").on("click", function (e) {
                    console.log("상세보기");

                    const schedule_num_element = e.currentTarget.closest(".card").querySelector(".schedule_num");

                    if (schedule_num_element) {
                        const schedule_num = schedule_num_element.value;

                        if (schedule_num.trim() !== "") {
                            console.log("Redirecting to: /detail?schedule_Num=" + schedule_num);
                            location.href = "/schedule/detail?schedule_Num=" + schedule_num;
                        } else {
                            console.error("schedule_num이 비어 있습니다.");
                        }
                    } else {
                        console.error("schedule_num 요소를 찾을 수 없습니다.");
                    }
                });
                
                // 지역 필터
                $('.location-filter').on('click', function() {
                    var modal = document.getElementById("myModal");
                    modal.style.display = "block";
                });
            });

   function moveRegion() {
      var value = $('[name=deo_name]:checked').val();
      
      if (value == 'all') {
         location.href = '/schedule/list';
      } else {
         location.href = '/schedule/list?doe_Name=' + value;
      }
   }
   
   function order(orderName) {
      location.href = '/schedule/list?order=' + orderName;
   }

</script>
</body>
</html>