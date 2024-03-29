<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<title>Kakao Maps</title>
<script src="//code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script>
<?php // http://craftpip.github.io/jquery-confirm/ ?>

</head>
<style>
@font-face {
   font-family: 'Pretendard-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
      format('woff');
   font-weight: 400;
   font-style: normal;
}
/* 상세보기 전페 div */
.scheduleDetailContent {
   width: 80%;
       margin-bottom:  100px  !important;

   padding: 2%;
   margin: 0 auto;
}

input, a, span, div, h2, button, li, ul {
   font-family: 'Pretendard-Regular';

}

/* 날짜 선택 div */
.schedule {
    margin-top: 50px !important;
    display: flex;
    width: 100%;
    text-align: center;
    justify-content: center;
    align-items: center;
    position: absolute;
    top: 30%;
    left: 40%;
    padding: 5px;
/*     transform: translate(-50%, -50%); */
}



.schedule>form {
   display: flex;
   text-align: center;
}

.startDate_div, .endDate_div {
   display: flex;
   justify-content: center;
   align-content: center;
   align-items: center;
   color: grey;
}

.Date_title {
   width: 120px;
}

/날짜 선택 부분 * /
.schedule_title {
   margin-right: 100px;
   font-weight: bold;
   font-size: 20px !important;
}
.titlediv{
   text-align: center;
   width: 70px;
}
#title {
   position: absolute;
   left: 120px;
   width: 45%;
   height: 30px;
   padding-left: 10px;
   border-radius: 3px;
   border : 1px solid rgb(219, 219, 219);
}

.form-control {
   width: 300px;
   padding: 1%;
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

.schedule_container {
   margin: 20px auto 0;
   width: 1000px;
}

.schedule_container>input, button, p, em, div, span, a {
   font-family: 'Pretendard-Regular';
}

.schedule em {
   width: 100px;
   line-height: 30px;
   font-style: normal;
}

.schedule form {
   position: relative;
   display: flex;
   margin: 0 !important;
   width: calc(100% - 100px);
}

.schedule form:after { 
   position: absolute;
   top: 50%;
   left: 50%;
   margin: -1px 0 0 -3px;
   width: 6px;
   height: 2px;
   background-color: #666;
}

.schedule form input {
   margin: 0 !important;
   padding: 0;
   width: 48%;
   height: 30px;
   box-sizing: border-box;
}

.schedule form input#date_end {
   margin-left: 4% !important;
}

.cont_bottom {
   position: relative;
   margin-top: 50px;
   width: 100%;
   min-height: 540px;
   display: flex;
}

.map-section {
   position: absolute;
   top: 0;
   left: 0;
   padding: 20px;
   width: 500px;
   border: 2px solid #ccc;
   border-radius: 5px;
   text-align: center;
}

#map {
   height: 500px;
}

.schedule-list {
   margin-left: 540px;
   width: calc(100% - 540px);
}

.schedule-list ul {
   list-style: none;
}

.schedule-list ul em {
   font-style: normal;
   left: 170px;
   position: absolute;
}

.schedule-list>ul>li {
   padding-bottom: 30px;
   width: 100%;
   border-bottom: 1px dashed #666;
}

.schedule-list>ul>li:last-child {
   border-bottom: none;
}

.schedule-item+.schedule-item {
   margin-top: 30px;
}

.schedule-list p {
   position: relative;
   display: flex;
   padding-left: 20px;
}

.schedule-list p:after {
   content: "";
   position: absolute;
   top: 50%;
   left: 120px;
   margin-top: -8px;
   width: 2px;
   height: 16px;
   border-radius: 1px;
   background-color: #0099FF;
}

.schedule-list p span {
   display: inline-block;
   width: 80px;
   height: 30px;
   line-height: 30px;
   font-size: 16px;
   font-weight: bold;
   color: #fff;
   text-align: center;
   border-radius: 15px;
   background-color: #333;
}

.schedule-list #day_date {
   margin-left: 20px;
   line-height: 30px;
   font-size: 16px;
}

.schedule-btn-grp {
   padding: 0;
   margin: 20px auto 0;
   width: 240px;
   height: 30px;
}

.schedule-btn-grp ul {
   padding: 0;
   margin: 0;
}

.schedule-btn-grp li {
   float: left;
   margin: 0 10px;
   padding: 0;
   width: 100px;
   height: 30px;
   border-radius: 15px;;
   background-color: #ebebeb;
}

.schedule-btn-grp li a {
   display: block;
   line-height: 30px;
   font-size: 14px !important;
   font-weight: bold !important;
   color: #333;
   text-align: center;
   text-decoration: none;
}

.mySchedule {
   margin: 30px auto 0;
   width: 150px;
   border-radius: 25px;
   position: relative;
}

.mySchedule a {
	position: relative;
	border-radius:30px;
	width: 74%;
	height: 50px;
	left :-80px;
 	background-color: #0077FF;
   	display: block;
   line-height: 50px;
   font-size: 14px !important;
   font-weight: bold !important;
   text-align: center;
   color: #fff;
   text-decoration: none;
}

.goBack {
   margin: 120px auto 0;
   width: 150px;
   height: 50px;
   border-radius: 25px;
   background-color: #0099FF;
   display: block;
   line-height: 50px;
   font-size: 14px !important;
   font-weight: bold !important;
   text-align: center;
   color: #fff;
   text-decoration: none;
}

.active_doe {
   font-weight: bold !important;
}

.schedule-btn-grp {
   float: left;
   margin: 0 10px;
   padding: 0;
   width: 100px;
   height: 30px;
   border-radius: 15px;;
   background-color: #ebebeb;
}

.modal {
   display: none;
   position: fixed;
   z-index: 1;
   left: 0;
   top: 0;
   width: 100%;
   height: 100%;
   overflow: auto;
   background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
   background-color: #fefefe;
   margin: 15% auto;
   padding: 20px;
   border: 1px solid #888;
   width: 80%;
   max-width: 400px; /* 최대 너비 설정 */
}

.modal-content {
   text-align: center;
}

.select-styling {
   width: calc(100% - 22px); /* 전체 영역 선택 */
   padding: 10px;
   font-size: 16px;
   border: 1px solid #ccc;
   border-radius: 4px;
}

.selection-text {
   text-align: left;
   margin-top: 10px;
}

.selection-text p {
   display: inline;
   margin: 0;
   margin-right: 10px;
}

.button-container {
   margin-top: 20px;
}

.modal-button {
   padding: 10px 20px;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

.select-button {
   background-color: #4CAF50;
   color: white;
}

.go-back-button {
   background-color: #f44336;
   color: white;
}

.button-container1 {
   display: flex;
   gap: 10px;
}

.map_wrap, .map_wrap * {
   margin: 0;
   padding: 0;
   font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
   font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
   color: #000;
   text-decoration: none;
}

.map_wrap {
   position: relative;
   width: 100%;
   height: 500px;
}

#menu_wrap {
   position: absolute;
   top: 0;
   left: 0;
   bottom: 0;
   width: 250px;
   margin: 10px 0 30px 10px;
   padding: 5px;
   overflow-y: auto;
   background: rgba(255, 255, 255, 0.7);
   z-index: 1;
   font-size: 12px;
   border-radius: 10px;
}

.bg_white {
   background: #fff;
}
/* 디테일 일정창 */
.detail_scedule {
   border: none;
   margin-left: 10px;
}

/* 일정 추가 버튼 div  */
.day_li_btn_div {
   margin-top: 30px;
   height: 50px;
   margin-bottom: 20px;
   width: 74%;
   text-align: center;
}

.day_li_btn_div>button {
   width: 120px;
   height: 35px;
   border: none;
   background-color: rgb(255, 215, 215);
   border-radius: 7px;
   text-align: center;
}

.day_li_btn_div>button:hover {
   background-color: rgb(249, 179, 179);
   color: white;
}

.content {
   width: 800px;
}

 .center-align {
    padding: 35px;
    text-align: center;
    position: relative;
    padding: 35px;
    text-align: left;
    padding-left: 20px;
    margin: auto;
    margin-top: 30px;
    display: flex;
  }

  /* 간격 추가 스타일 */
 .spacing {
    margin-bottom: 20px;
  }
  .button-container {
    margin-top: 10px;
  }

  .memo-modal {
    margin-top: 20px;
  }
   
  .day_li_btn_div button {
    margin-right: 10px;
  }
  .daycontent {
     margin-top: 20px;
  }
  .inline, .memo-div {
     display: flex;
     margin-bottom: 2px;
  }
  .inline>div, .memo-div > div {
     margin-right: 50px;
  
  }
  .inline>input, .memo-div > input{
     width: 300px !important;
     border-radius: 3px;
     border: 1px solid rgb(219, 219, 219);
     padding-left: 10px;
  }
  
#goback {
    background-color: #0099FF;!important; /* Green */
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 26px;
}

#goback:hover {
    background-color:  #0099ff !important; /* Darker Green */
}

  
  .back {
     margin-left: 220px;
     margin-top: 20px;
  }
  
  .dotOverlay.distanceInfo {
   color: #0066ff !important;
    font-size: 16px;
/*     margin-top: 20px; */
    text-align: center;
    background-color: #fff;
  }
  
      .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
  
</style>
<body>

   <div class="nav-wrap">
      <h2>한국</h2>
      <!--지역 선택하기 -->
      <div class="container">
         <div class="row">
            <input type="hidden" id="doe_location" value="${scheduleList[0].doe_Name}"/>
            <div class="col-md-6">
               <ul class="nav-ul">
                  <li class="nav-li"><a href="javascript:void(0);"
                     onclick="getLocation(this)" data-value="1"> 서울 </a></li>
                  <li class="nav-li"><a href="javascript:void(0);"
                     onclick="getLocation(this)" data-value="3"> 경기 </a></li>
                  <li class="nav-li"><a href="javascript:void(0);"
                     onclick="getLocation(this)" data-value="2"> 인천 </a></li>
                  <li class="nav-li"><a href="javascript:void(0);"
                     onclick="getLocation(this)" data-value="4"> 강원 </a></li>
                  <li class="nav-li"><a href="javascript:void(0);"
                     onclick="getLocation(this)" data-value="13"> 제주 </a></li>
                  <li class="nav-li"><a href="javascript:void(0);"
                     onclick="getLocation(this)" data-value="12"> 전남 </a></li>
                  <li class="nav-li"><a href="javascript:void(0);"
                     onclick="getLocation(this)" data-value="16"> 부산 </a></li>
                  <li class="nav-li"><a href="javascript:void(0);"
                     onclick="getLocation(this)" data-value="14"> 경남 </a></li>
               </ul>
            </div>
         </div>
         <div class="col-md-6">
            <ul class="nav-ul">
               <li class="nav-li"><a href="javascript:void(0);"
                  onclick="getLocation(this)" data-value="8"> 경북 </a></li>
               <li class="nav-li"><a href="javascript:void(0);"
                  onclick="getLocation(this)" data-value="9"> 대구 </a></li>
               <li class="nav-li"><a href="javascript:void(0);"
                  onclick="getLocation(this)" data-value="15"> 울산 </a></li>
               <li class="nav-li"><a href="javascript:void(0);"
                  onclick="getLocation(this)" data-value="5"> 충북 </a></li>
               <li class="nav-li"><a href="javascript:void(0);"
                  onclick="getLocation(this)" data-value="6"> 충남 </a></li>
               <li class="nav-li"><a href="javascript:void(0);"
                  onclick="getLocation(this)" data-value="11"> 광주 </a></li>
               <li class="nav-li"><a href="javascript:void(0);"
                  onclick="getLocation(this)" data-value="10"> 전북 </a></li>
               <li class="nav-li"><a href="javascript:void(0);"
                  onclick="getLocation(this)" data-value="7"> 대전 </a></li>
            </ul>
         </div>
      </div>
   </div>
   <br>

   <div class="scheduleDetailContent">
      <div class="schedule">
<!--          <div class="schedule_title">날짜선택</div> -->
         <form>
            <div class="startDate_div">
               <p class="Date_title">시작 날짜 :</p>
               <input type="date" class="form-control mt-1" id="start_Date"
                  name="start_Date" placeholder="Choose Date"
                  value="${scheduleList[0].start_Num }">
            </div>
            <div class="endDate_div">
               <p class="Date_title">마감 날짜 :</p>
               <input type="date" class="form-control mt-1" id="end_Date"
                  name="end_Date" placeholder="Choose Date"
                  value="${scheduleList[0].end_Date }">
            </div>
         </form>
      </div>
      <div>
         <div class="cont_bottom">
            <div class="map-section">
               <!--<h1>지도</h1> -->
               <div class="evt-map" id="map" style="width: 100%; height: 600px;"></div>
            </div>

            <div class="schedule-list">
               <div class="title_div">
                 
    <div class="title-container center-align">
     <div class="titlediv">제목</div>
     <input type="text" id="title" value='${scheduleList[0].title}' readonly="readonly" >
   </div>


               <ul class="schedule-ul">
                  <c:forEach items="${scheduleList}" var="item" varStatus="status">
                     <li class="schedule-item day-${status.count }">
                     <input type="hidden" class="lat" value="${item.city_latitude }" /> 
                     <input type="hidden" class="lng" value="${item.city_longitude }" />
                      
                      
                        <p>
                           <span>day<em class="day_num">${status.count }</em></span>
                           <em class="day_date">
                              <input type="date" class="detail_scedule" value=${item.date1 }></em>
                        </p>
                 
                 
                        <div class="daycontent">
                           <div class="inline">
                           <c:choose>
                             <c:when test="${principal.user.member_id==writer}">
                              <button class="schedule-btn-grp" onclick="openModal(this)">장소수정</button>
                             </c:when>
                             <c:otherwise>
                              <div class="schedule-btn-grp" >장소</div>
                             </c:otherwise>
                             </c:choose>
                              <input type="text" readonly="readonly"
                                 id="select_city_area_${status.count }"
                                 class="day-${status.count } placeList"
                                 name="location${status.count }" value="${item.place1 }" />
                   
                           </div> <!-- 메모 부분 수정 -->
                           <div class="memo-div">
                           <c:choose>
                             <c:when test="${principal.user.member_id==writer}">
                              <button class="schedule-btn-grp memo-add-btn"
                                 onclick="addMemo(this)">메모수정</button>
                             </c:when>
                             <c:otherwise>
                                <div class="schedule-btn-grp memo-add-btn">메모</div>
                             </c:otherwise>
                             </c:choose>
                              <input type="text" readonly="readonly"
                                 id="select_city_area_${status.count }"
                                 class="day-${status.count } placeList memoList"
                                 name="location${status.count }" value="${item.memo1}" />
              
                        </div>
                     </div>
                           <!-- 메모 모달창 -->
                           <div class="memo-modal" style="display: none;">
                              <div class="modal-content">
                                 <p>
                                    <span>day <em class="memo_day_num"></em></span><em
                                       class="memo_day_date"></em>
                                 </p>
                                 <textarea class="memo-content" placeholder="여행일정을 메모해보세요"></textarea>
                                 <div class="button-container1">
                                    <button class="schedule-btn-grp cancel-btn"
                                       onclick="cancelMemo(this)">취소</button>
                                    <button class="schedule-btn-grp complete-btn"
                                       onclick="completeMemo(this)">작성완료</button>
                                 </div>
                                 <div class="memo-display" style="display: none;"></div>
                              </div>
                           </div>

         <input type="hidden" id="Doenum">
         <div id="myModal" class="modal" style="display: none;">
             <div class="modal-content">
                 <select id="selectBox" class="select-styling">
                     <option value="" disabled selected>전체를 선택하세요</option>
                 </select>
                 <div class="selection-text">
                     <p>가고 싶은 장소를 선택해주세요!</p>
                 </div>
         
                 <div class="button-container" style="text-align: center;">
                     <button class="modal-button select-button" onclick="selectLocation(this)">선택하기</button>
                 </div>
                 
             </div>
         </div>
                     </li>
                  </c:forEach>
               </ul>
               
               <div class = "back">
                  <button id ="goback" onclick="goBack()">뒤로 가기</button>
              
               </div>
               <c:if test="${principal.user.member_id==writer}">
                     <!-- 일정 추가 버튼 -->
                  <div class="day_li_btn_div">
                     <button class="add_shedule_btn">일정추가</button>
                     <button class="minus_shedule_btn">일정삭제</button>
                  </div>    
                             
                  <!--일정 수정하기 버튼 -->
                  <div class="mySchedule"
                     style="text-align: center; margin-bottom: 20px;">
                     <a href="javascript:void(0);" id="saveEntryBtn">수정완료</a>
                  </div>
               </c:if>
               
               
               
            </div>
   
         </div>
      </div>
  
   </div>




   <script type="text/javascript"
      src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=47505492acfacae877bc0ab034617c5f&libraries=services,clusterer,drawing"></script>

   <script>
   
   
   
   function goBack() {
       window.history.back();
   }

   
//수정한 내용 저장 버튼
function saveEntry() {
    // 수정할 스케줄 정보 가져오기
    const scheduleList = document.querySelectorAll('.schedule-item');

    // 저장할 데이터 배열 초기화
    const data = [];

     // 스케줄 정보를 data 배열에 추가
   scheduleList.forEach((schedule, index) => {
       const schedule_Num = document.getElementById(`schedule_Num${index}`).textContent;
       
       const MEMO1Element = document.getElementById(`MEMO1_${index}`);
       const MEMO1 = MEMO1Element ? MEMO1Element.innerText : ''; 
       const MEMO2 = document.getElementById(`MEMO2_${index}`).innerText;
       const PLACE1 = document.getElementById(`PLACE1${index}`).innerText;
       const PLACE2 = document.getElementById(`PLACE2${index}`).value;
   
       data.push({
           schedule_Num: schedule_Num,
           
           MEMO1: MEMO1,
           MEMO2: MEMO2,
           PLACE1: PLACE1,
           PLACE2: PLACE2
       });
   });

    // 서버로 데이터 전송
    fetch('/schedule/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(data),
    })
    .then(response => response.json())
    .then(json => {
        console.log(json);
        if (json.message === "수정 성공했습니다!") {
            alert('수정이 완료되었습니다.');
        } else {
            alert('수정에 실패했습니다.');
        }
    })
    .catch(error => {
        console.error('수정 중 오류 발생:', error);
    });
}

// 삭제하기
function deleteEntry() {
    const schedule_Num = ${param.schedule_Num}
    

    fetch('/schedule/delete', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({ schedule_Num: parseInt(schedule_Num) }),
    })
    .then(response => response.json())
    .then(data => {
        alert(data.message);
        location.href = '/schedule/list';
        // 여기에서 삭제 후 수행할 작업을 추가할 수 있습니다.
    })
    .catch(error => {
        console.error('에러:', error);
    });
}

// 홈페이지로 이동
function goToHomepage() {
    window.location.href = '/schedule/list';
}
     
     
function saveEntry() {

    
    const scheduleItems = document.querySelectorAll(".schedule-item");
    const schedules = [];

   var doe_name = $("#doe_location").val();

    for (i=0;i<scheduleItems.length;i++) {
       schedules.push({
          member_id : $("#member_id").val(),
         title : $("#title").val(),
          day_date : scheduleItems[i].querySelector(".day_num").innerText,
          place1 : scheduleItems[i].querySelector(".placeList").value,
          memo1 : scheduleItems[i].querySelector(".memoList").value,
          start_Num : $("#start_Date").val(),
          end_Date: $("#end_Date").val(),
          doe_Name :$("#doe_location").val(),
          date1: scheduleItems[i].querySelector(".detail_scedule").value
       });
    }

      
    $.ajax({
        url : "/schedule/update/${param.schedule_Num}",
        type: 'POST',
        contentType: "application/json; charset=UTF-8",
        data: JSON.stringify(schedules),
        dataType: "json",
        success: function (data) {
          //alert(data.message);
          alert('일정 수정이 완료되었습니다.');
          location.reload();
          if(data.result){
             location.href="/schedule/list";
          }
       }
       }) 
    
}     
         
/* 일정 추가 날짜 범위 지정하기 */

   const startDateInput = document.getElementById('start_Date');
   const endDateInput = document.getElementById('end_Date');
   const detailScheduleInputs = document.querySelectorAll('.detail_scedule');
      
   function setMinMax() {
      detailScheduleInputs.forEach(function (input) {
      input.setAttribute('min', startDateInput.value);
      input.setAttribute('max', endDateInput.value);
   });
   }
      
   // 최초 실행
   setMinMax();
      
   // 시작 날짜 입력 시
   startDateInput.addEventListener('input', setMinMax);
      
   // 종료 날짜 입력 시
   endDateInput.addEventListener('input', setMinMax);

   /* 일정 추가하기 */
   $(".add_shedule_btn").on("click", function() {
   var lastScheduleItem = $(".schedule-ul li:last-child");
         
   // 복제된 일정 아이템을 새로운 일정으로 설정
   var newScheduleItem = lastScheduleItem.clone();
   
   var currentDayNum = newScheduleItem.find(".day_num").text();
   newScheduleItem.find(".day_num").text(parseInt(currentDayNum) + 1);
   
   
   newScheduleItem.find(".placeList").val($("#select_city_area_2").val());
   newScheduleItem.find(".memoList").val($("#select_city_memo_2").val());
         
   // 새로운 일정을 schedule-ul에 추가
   $(".schedule-ul").append(newScheduleItem);
   
   
             
   setMinMax();
            
   // 시작 날짜 입력 시
   startDateInput.addEventListener('input', setMinMax);

   // 종료 날짜 입력 시
   endDateInput.addEventListener('input', setMinMax);
   });   
               
  /* 일정 삭제하기 */
$(".minus_shedule_btn").on("click", function(){
    
   deleteEntry();
});


      
   function toggleMemoModal(day) {
      const memoModal = document.querySelector(`.day-${day} .memo-modal`);
      memoModal.style.display = (memoModal.style.display === 'none' || memoModal.style.display === '') ? 'block' : 'none';
      }

   // 메모 작성 완료 
   function completeMemo(element) {
       var li = findClosestParent(element, ".schedule-item");
       var day = li.querySelector(".day_num").innerText;
   
       console.log(day + " 메모추가");
       var memo_content = li.querySelector(".memo-modal .memo-content").value; // 해당 day에 해당하는 memo-content 내용을 가져옴
       var memo_input = li.querySelector(".memo-div .memoList");
       memo_input.value = memo_content; // 해당 day에 해당하는 memo_area에 내용 적용
       console.log("memo_input: " + memo_input.value);
   
       li.querySelector(".memo-modal").style.display = "none"; // 해당 day에 해당하는 메모 모달창 숨김
   }


         // 모든 장소선택 버튼 가져오기
         var selectPlaceButtons = document.querySelectorAll('.schedule-btn-grp');

            selectPlaceButtons.forEach(function(button, index) {
             button.addEventListener('click', function() {
            
                var liElement = findClosestParent(this, "li");

      
                 var selectedPlace = liElement.querySelector('.day_date').innerText;
                 var selectedPlace = liElement.querySelector('.schedule-btn-grp').innerText;

             });
         });
         
   //장소추가
   function openModal(element) {
       var modal = document.getElementById("myModal");
       modal.style.display = "block";
   
       // 가장 가까운 상위 li 태그를 찾아서 day_num 값을 가져옴
       var dayNum = findClosestParent(element, ".schedule-item").querySelector(".day_num").innerText;
   
       // modal에 day 값을 저장
       modal.dataset.day = dayNum;
   }
   
   // 가장 가까운 상위 요소를 찾는 함수
   function findClosestParent(element, selector) {
       while ((element = element.parentElement) && !element.matches(selector));
       return element;
   }
      // 장소 추가 모달창 닫기(뒤로가기)
      function cancleLocation(){
          var modal = document.getElementById("myModal");
          modal.style.display = "none";
         
      }
      
      
   //메모
   let selectedDayForMemo = null;
   
   //메모추가
   function addMemo(element) {
       // 현재 일정 아이템에서 day_num 값을 가져옴
       var dayNum = findClosestParent(element, ".schedule-item").querySelector(".day_num").innerText;

       // 메모 모달의 day_num 텍스트 업데이트
       $(".memo_day_num").text(dayNum);

       // 현재 일정 아이템에서 detail_scedule 값을 가져와서 메모 모달의 day_date 텍스트 업데이트
       var day = findClosestParent(element, ".schedule-item").querySelector(".detail_scedule").value;
       $(".memo_day_date").text(day);

       // 모달 열기
       const scheduleItem = findClosestParent(element, ".schedule-item");
       const memoModal = scheduleItem.querySelector('.memo-modal');
       memoModal.style.display = 'block';
         
   }
   
   // 메모 취소 (모달 닫기)
   function cancelMemo(element){
       const scheduleItem = findClosestParent(element, ".schedule-item");
      const memoModal = scheduleItem.querySelector('.memo-modal');
       memoModal.style.display = 'none';
      
   }
         

      //지역 선택
      function getLocation(element) {
          var dataValue = element.getAttribute("data-value");
         
          var doeNameElement = document.getElementById("doe-name");
          if (doeNameElement) {
              doeNameElement.value = dataValue;
          }
          var doe_name = element.closest("a").innerText;
         $("#doe_location").val(doe_name);
         var activeElements = document.getElementsByClassName("active_doe");
          for (var i = 0; i < activeElements.length; i++) {
              activeElements[i].classList.remove("active_doe");
          }
      
          element.classList.add("active_doe");
          
          SelectBox(dataValue);
      }
      
      //도 선택
      function SelectBox(doeNum) {
          $.ajax({
              url: "/schedule/writeInsert2", 
              method: "POST",
              data: JSON.stringify({doe_Num: doeNum}),
              contentType : "application/json; charset=utf-8",
              success: function (data) {
                  var selectBox = document.getElementById("selectBox");
               var cityList = data.result;
                  selectBox.innerHTML = "";
               
                  cityList.forEach(city => {
                      console.log(city.cityNum);
                     var option = document.createElement("option");
                      option.value = city.cityNum;
                      option.text = city.cityName;

                      selectBox.appendChild(option);
                      
                      $("option").on("click", function(){
                         mapDisplay(city.LATITUDE, city.LONGITUDE);
                          modal.style.display = "none";

                      })
                  });
              },
              error: function () {
                  console.error("도시 정보를 불러오는 중 오류가 발생했습니다.");
              }
          });
      }
      
      // 위도 경도 전달
      function selectLocation(element) {
       var modal = document.getElementById("myModal");
       var selectElement = modal.querySelector('select');
       var selectedText = selectElement.options[selectElement.selectedIndex].text;
       var day = modal.dataset.day;
         console.log("day" + day);
         console.log("selectedText = " +selectedText )
         var scheduleItem = findClosestParent(element, ".schedule-item");
      
        let inputSelector = '.day-' + day.split('day')[0] + ".placeList";
        console.log(inputSelector)
        
        var inputField = document.querySelector(inputSelector);

       if (selectElement) {
           inputField.value = selectedText;
           $.ajax({
               url: "/schedule/selectCity",
               method: "POST",
               data: JSON.stringify({ city_name: selectedText }),
               contentType: "application/json; charset=utf-8",
               success: function (data) {
                   var city = data.city;
                   var x = city.latitude;
                   var y = city.longitude;
                   
                   mapDisplay(x, y);
                   
                   var memoInputField = document.querySelector('#memo.day-' + day);
                   var memo = "This is the memo for day " + day + ": Lat - " + x + ", Long - " + y;
                   if (memoInputField) {
                       memoInputField.value = memo;
                   }
   
                   modal.style.display = "none";
               },
               error: function () {
                   console.error("도시 정보를 불러오는 중 오류가 발생했습니다.");
               }
           });
   
           modal.style.display = "none"; 
       }
   }

         
      //서버 전달
      function sendDataToServer() {
          const scheduleItems = document.querySelectorAll(".schedule-item");
          const schedules = [];

          for (i=0;i<scheduleItems.length;i++) {
             schedules.push({
                 day_date : scheduleItems[i].querySelector(".day_num").innerText,
                place : scheduleItems[i].querySelector(".placeList").value,
                memoList : scheduleItems[i].querySelector(".memoList").value,
                start_Num : $("#start_Date").val(),
                end_Date: $("#end_Date").val(),
                  doe_Name :$("#doe_location").val()
             });
          }

          console.log(schedules);
          console.log(JSON.stringify(schedules));
            
          $.ajax({
              url : "/schedule/writeInsert",
              type: 'POST',
              contentType: "application/json; charset=UTF-8",
              data: JSON.stringify(schedules),
              dataType: "json",
              success: function (data) {
                alert(data.message);
                if(data.result){
                   location.href="/schedule/list";
                }
             }
             }) 
      }

      
      
      document.addEventListener('DOMContentLoaded', function () {
           var mapContainer = document.getElementById('map');
           var mapOption = {
               center: new kakao.maps.LatLng(37.5, 128),
               level: 13
           };

           var map = new kakao.maps.Map(mapContainer, mapOption);

           var scheduleItems = document.querySelectorAll('.schedule-item');
           var paths = [];
           var prevPath = null;

           for (var i = 0; i < scheduleItems.length; i++) {
               var lat = parseFloat(scheduleItems[i].querySelector('.lat').value);
               var lng = parseFloat(scheduleItems[i].querySelector('.lng').value);
               var path = new kakao.maps.LatLng(lat, lng);
               paths.push(path);

               var description = scheduleItems[i].querySelector('.placeList').value;
               var marker = new kakao.maps.Marker({
                   position: path,
                   map: map,
                   title: description
               });

               addClickEventToMarker(map, marker, path, description);

               if (i !== 0) {
                   var line = new kakao.maps.Polyline({
                       path: [prevPath, path],
                   });

                   var distance = Math.round(line.getLength());
                   var message = distance;
                   var unit = 'm';
                   if (distance > 1000) {
                       message = distance / 1000;
                       unit = 'km';
                   }

                   var distanceOverlay = new kakao.maps.CustomOverlay({
                       map: map,
                       content: '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + message + '</span>' + unit + '</div>',
                       position: path,
                       xAnchor: 0,
                       yAnchor: 0,
                       zIndex: 3
                   });
               }

               prevPath = path;
           }

           if (line) {
               line.setMap(null);
           }

           var line = new kakao.maps.Polyline({
               path: paths,
               strokeWeight: 3,
               strokeColor: '#db4040',
               strokeOpacity: 1,
               strokeStyle: 'solid'
           });

           line.setMap(map);
       });

       function addClickEventToMarker(map, marker, position, description) {
           kakao.maps.event.addListener(marker, 'click', function () {
               searchDetailAddrFromCoords(marker.getPosition(), function (result, status) {
                   if (status === kakao.maps.services.Status.OK) {

                      
                      var detailAddr = getDetailAddr(result);
                      var content = '<div class="bAddr">' +
                          '<span class="title">주소정보</span>' +
                          detailAddr +
                          '</div>';
                          

                      infowindow.setContent(content);
                      infowindow.open(map, marker);

                   }
               });
           });
       }

       var mapContainer = document.getElementById('map'),
           mapOption = {
               center: new kakao.maps.LatLng(37.566826, 126.9786567),
               level: 1
           };

       var map = new kakao.maps.Map(mapContainer, mapOption);
       var geocoder = new kakao.maps.services.Geocoder();
       var marker = new kakao.maps.Marker();
       var infowindow = new kakao.maps.InfoWindow({ zindex: 1 });

       searchAddrFromCoords(map.getCenter(), displayCenterInfo);

       kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
           searchDetailAddrFromCoords(mouseEvent.latLng, function (result, status) {
               if (status === kakao.maps.services.Status.OK) {
                   var detailAddr = getDetailAddr(result);
                   var content = '<div class="bAddr">' +
                       '<span class="title">법정동 주소정보</span>' +
                       detailAddr +
                       '</div>';

                   marker.setPosition(mouseEvent.latLng);
                   marker.setMap(map);

                   infowindow.setContent(content);
                   infowindow.open(map, marker);

                   addInfoToMarker(map, marker, mouseEvent.latLng);
               }
           });
       });

       kakao.maps.event.addListener(map, 'idle', function () {
           searchAddrFromCoords(map.getCenter(), displayCenterInfo);
       });

       function searchAddrFromCoords(coords, callback) {
           geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
       }

       function searchDetailAddrFromCoords(coords, callback) {
           geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
       }

       function displayCenterInfo(result, status) {
           if (status === kakao.maps.services.Status.OK) {
               var infoDiv = document.getElementById('centerAddr');

               for (var i = 0; i < result.length; i++) {
                   if (result[i].region_type === 'H') {
                       infoDiv.innerHTML = result[i].address_name;
                       break;
                   }
               }
           }
       }

       function addInfoToMarker(map, marker, position) {
           function updateInfoWindow(result, status) {
               if (status === kakao.maps.services.Status.OK) {
                   var info = result[0];
                   var detailedAddress = getDetailAddr(result);
                   var placeName = info.place_name;

                   var infowindow = new kakao.maps.InfoWindow({
                       content: '<div class="info-window">' +
                           '<div class="info-title">장소명: </div>' +
                           '<div class="info-content">' + placeName + '</div>' +
                           '<div class="info-title">상세주소: </div>' +
                           '<div class="info-content">' + detailedAddress + '</div>' +
                           '</div>',
                       removable: true
                   });

                   kakao.maps.event.addListener(marker, 'click', function () {
                       infowindow.open(map, marker);
                   });
               }
           }

           geocoder.coord2Address(position.getLng(), position.getLat(), updateInfoWindow);
       }

       kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
           marker.setMap(null);
           marker.setPosition(mouseEvent.latLng);
           marker.setMap(map);
           addInfoToMarker(map, marker, mouseEvent.latLng);
       });

       function addInfoWindowToMarker(map, marker, description) {
           var infowindow = new kakao.maps.InfoWindow({
               content: '<div class="info-window">' +
                   '<div class="info-content">' + description + '</div>' +
                   '</div>',
               removable: true
           });

           kakao.maps.event.addListener(marker, 'click', function () {
               infowindow.open(map, marker);
           });
       }

       function getDetailAddr(result) {
          console.log('result: ', result);
           if (result && result.length > 0) {
               var detailAddr = '';
               var roadAddr = result[0].road_address;
               var jibunAddr = result[0].address;

               if (roadAddr) {
                   detailAddr += '도로명주소 : ' + roadAddr.address_name + '<br>';
               }
               if (jibunAddr) {
                   detailAddr += '지번 주소 : ' + jibunAddr.address_name;
               }

               return detailAddr;
           }
           return '';
       }


  
      $(document).ready(function () {
          //document.getElementById('deleteBtn').addEventListener('click', deleteEntry);
          document.getElementById('saveEntryBtn').addEventListener('click', saveEntry);
          
      });


</script>

</body>
</html>