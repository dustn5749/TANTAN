<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>Kakao Maps</title>
<script src="//code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<?php // http://craftpip.github.io/jquery-confirm/ ?>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47505492acfacae877bc0ab034617c5f&libraries=services,clusterer,drawing"></script>
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

/* 날짜 선택 div */
.schedule {
	margin-top: 80px !important;
	display: flex;
	width: 100%;
	text-align: center;
	justify-content: center;
	align-content: center;
	align-items: center;
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

/
날짜 선택 부분 * /
.schedule_title {
	margin-right: 50px;
	font-weight: bold;
	font-size: 20px !important;
}

.form-control {
	width: 300px;
	padding: 1%;
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
	height: 800px;
	overflow: auto;
	margin-left: 540px;
	width: calc(100% - 540px);
}

.schedule-list ul {
	list-style: none;
}

.schedule-list ul em {
	font-style: normal;
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
}

.schedule-list p:after {
	content: "";
	position: absolute;
	top: 50%;
	left: 90px;
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
	background-color: #0099FF;
}

.mySchedule a {
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
	width: 100%;
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

.title_div {
	margin-bottom: 20px; /* 원하는 간격으로 조정 */
}

.title_div span {
	font-weight: bold; /* 글 제목에 두껍게 표시 */
	margin-right: 10px; /* 글 제목과 입력 필드 사이 간격 */
}

#title {
	width: 300px; /* 원하는 길이로 조정 */
	padding: 5px; /* 입력 필드 내부 여백 */
}

.date-inputs {
	display: flex;
	align-items: center;
	justify-content: center; /* 가로로 가운데 정렬 */
	gap: 10px;
}

.date-inputs em {
	white-space: nowrap;
	margin-right: 10px;
}

.date-inputs form {
	display: flex;
	align-items: center;
}

.date-inputs label {
	white-space: nowrap;
	margin-right: 10px;
}

.date-inputs input {
	margin-right: 10px;
}

/* 글 제목 div */
.title_div {
	margin: 0 auto;
	text-align: center;
	margin-bottom: 30px;
	margin-top: 10px;
}
.title_div > input {
	width: 250px;
	border-radius: 2px;
	padding-left: 5px;
	margin-left: 10px;
}
</style>
<body>
	<div class="nav-wrap">
		<h2>한국</h2>
		<!--지역 선택하기 -->
		<div class="container">
			<div class="row">
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

	<input type="hidden" id="doe_location">
	<div class="schedule_container">
		<div class="cont_top">
			<div class="schedule">
				<div class="schedule_title">날짜선택</div>
				<form>
					<div class="startDate_div">
						<p class="Date_title">시작 날짜 :</p>
						<input type="date" class="form-control mt-1" id="start_Date"
							name="start_Date" placeholder="Choose Date">
					</div>
					<div class="endDate_div">
						<p class="Date_title">마감 날짜 :</p>
						<input type="date" class="form-control mt-1" id="end_Date"
							name="end_Date" placeholder="Choose Date">
					</div>
				</form>
			</div>
		</div>


		<div class="cont_bottom">
			<div class="map-section">
				<!--<h1>지도</h1> -->
				<div class="evt-map" id="map" style="width: 100%; height: 600px;"></div>
			</div>

                  <div class="schedule-list">
                  <div class="title_div"><span>글 제목 : </span><input type="text" id="title"></div>
                   <ul class="schedule-ul">
                      <!--일정 -->
                       <li class="schedule-item day-1">
                        <p>
                           <span>day<em class="day_num">1</em></span><em class="day_date"><input type="date" class="detail_scedule" ></em>
                        </p>
                        <div>
                           <button class="schedule-btn-grp" onclick="openModal(this)">장소추가</button>
                           <input type="text" readonly="readonly" id="select_city_area" class="day-1 placeList" name="location1"/>                  
                        </div>
                            <!-- 메모 부분 수정 -->
                     <div class="memo-div">
                         <button class="schedule-btn-grp memo-add-btn" onclick="addMemo(this)">메모추가</button>
                         <input type="text" readonly="readonly" id="memo_area_1" name="memo_area_1" class="memoList">
                     </div>
            
                     <!-- 메모 모달창 -->
                     <div class="memo-modal" style="display: none;">
                         <div class="modal-content">
                             <p>
                                 <span>day <em class="memo_day_num"></em></span><em class="memo_day_date"></em>
                             </p>
                             <textarea class="memo-content" placeholder="여행일정을 메모해보세요" ></textarea>
                             <div class="button-container1">
                                 <button class="schedule-btn-grp cancel-btn" onclick="cancelMemo(this)">취소</button>
                                 <button class="schedule-btn-grp complete-btn" onclick="completeMemo(this)">작성완료</button>
                             </div>
                             <div class="memo-display" style="display: none;"></div>
                         </div>
                     </div>
                     
               <!--장소선택버튼 -->
               <input type="hidden" id="Doenum">
               <div id="myModal" class="modal" style="display: none;">
                  <div class="modal-content">
                     <select id="selectBox" class="select-styling">
                        <option value="" disabled selected>전체를 선택하세요</option>
                     </select>
                     <div class="selection-text">
                        <p>가고 싶은 장소를 선택해주세요!</p>
                     </div>
                     <div class="button-container">
                        <button class="modal-button select-button"
                           onclick="selectLocation(this)">선택하기</button>
                        <button class="modal-button go-back-button" onclick="cancleLocation()">뒤로가기</button>
                     </div>
                  </div>
               </div>
               </li>

			<div class="schedule-list">
				<div class="title_div">
					<span> 제목 </span><input type="text" id="title">
				</div>
				<ul class="schedule-ul">
					<!--일정 -->
<!-- 					<li class="schedule-item day-1">
						<p>
							<span>day<em class="day_num">1</em></span><em class="day_date"><input
								type="date" class="detail_scedule"></em>
						</p>
						<div>
							<button class="schedule-btn-grp" onclick="openModal(this)">장소추가</button>
							<input type="text" readonly="readonly" id="select_city_area"
								class="day-1 placeList" name="location1" />
						</div> 메모 부분 수정
						<div class="memo-div">
							<button class="schedule-btn-grp memo-add-btn"
								onclick="addMemo(this)">메모추가</button>
							<input type="text" readonly="readonly" id="memo_area_1"
								name="memo_area_1" class="memoList">
						</div> 메모 모달창
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
						</div> 장소선택버튼 <input type="hidden" id="Doenum">
						<div id="myModal" class="modal" style="display: none;">
							<div class="modal-content">
								<select id="selectBox" class="select-styling">
									<option value="" disabled selected>전체를 선택하세요</option>
								</select>
								<div class="selection-text">
									<p>가고 싶은 장소를 선택해주세요!</p>
								</div>
								<div class="button-container">
									<button class="modal-button select-button"
										onclick="selectLocation(this)">선택하기</button>
								</div>
							</div>
					</li> -->

				</ul>
				<!-- 일정 추가 버튼 -->
				<div class="day_li_btn_div">
					<button class="add_shedule_btn">일정추가하기</button>
					<button class="minus_shedule_btn">일정삭제하기</button>
				</div>
				<!--일정 등록하기 버튼 -->
				<div class="mySchedule"
					style="text-align: center; margin-bottom: 20px;">
					<a href="javascript:void(0);" onclick="sendDataToServer()">일정등록하기</a>
				</div>
			</div>
		</div>

		<script>
         
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
   
   
   function createSchedule(day) {
	   let html ="" +
		"<li class='schedule-item day-" + day + "'>" +
		"<p>"+
		"	<span>day<em class='day_num'>" + day + "</em></span><em class='day_date'>" +
		"	<input type='date' class='detail_scedule'></em>" + 
		"</p>" +
		"<div>" + 
			"<button class='schedule-btn-grp' onclick='openModal(this)'>장소추가</button>" +
			"<input type='text' readonly='readonly' id='select_city_area' class='day-" + day +" placeList' name='location"+ day +"' />" +
		"</div>" +  <!-- 메모 부분 수정 -->
		"	<div class='memo-div'>" +
		"	<button class='schedule-btn-grp memo-add-btn' onclick='addMemo(this)'>메모추가</button>" + 
		"	<input type='text' readonly='readonly' id='memo_area_" + day + "' name='memo_area_" + day + "' class='memoList'> "+
		"</div>" + <!-- 메모 모달창 -->
		"<div class='memo-modal' style='display: none;'>"+
		"	<div class='modal-content'>" + 
				"<p>" + 
		"			<span>day <em class='memo_day_num'></em></span><em "+
		"				class='memo_day_date'></em> "+
		"		</p>"+
		"		<textarea class='memo-content' placeholder='여행일정을 메모해보세요'></textarea>"+
		"		<div class='button-container1'>"+
		"			<button class='schedule-btn-grp cancel-btn'"+
		"				onclick='cancelMemo(this)'>취소</button>"+
		"			<button class='schedule-btn-grp complete-btn'"+
		"				onclick='completeMemo(this)'>작성완료</button>"+
		"		</div>"+
		"		<div class='memo-display' style='display: none;'></div>"+
		"	</div>"+
		"</div> <!--장소선택버튼 --> <input type='hidden' id='Doenum'>"+
		"<div id='myModal' class='modal' style='display: none;'>"+
		"	<div class='modal-content'>"+
		"		<select id='selectBox' class='select-styling'>"+
		"			<option value='' disabled selected>전체를 선택하세요</option>"+
		"		</select>"+
		"		<div class='selection-text'>"+
		"			<p>가고 싶은 장소를 선택해주세요!</p>"+
		"		</div>"+
		"		<div class='button-container'>"+
		"			<button class='modal-button select-button'"+
		"				onclick='selectLocation(this)'>선택하기</button>"+
		"		</div>"+
		"	</div>"+
		"</li>";
		return html;
   }
   
   $(document).ready(function(){
	   $('.schedule-ul').append(createSchedule(1));
   });
   

   /* 일정 추가하기 */
   $(".add_shedule_btn").on("click", function() {

	   var lastScheduleItem = $(".schedule-ul li:last-child");
	         
	   // 복제된 일정 아이템을 새로운 일정으로 설정
	   //var newScheduleItem = lastScheduleItem.clone();
	   let newScheduleItem = $(createSchedule(parseInt(lastScheduleItem.find(".day_num").text()) + 1));
	  
	         
	   var currentDayNum = newScheduleItem.find(".day_num").text();
	   //newScheduleItem.find(".day_num").text(parseInt(currentDayNum) + 1);
	         
	   // 새로운 일정을 schedule-ul에 추가
	   $(".schedule-ul").append(newScheduleItem);
       setMinMax();
	            
	   // 시작 날짜 입력 시
	   startDateInput.addEventListener('input', setMinMax);
	
	   // 종료 날짜 입력 시
	   endDateInput.addEventListener('input', setMinMax);

	   var lastScheduleItem = $(".schedule-ul li:last-child");
         
	   // 복제된 일정 아이템을 새로운 일정으로 설정
	   var newScheduleItem = lastScheduleItem.clone();
         
	   var currentDayNum = newScheduleItem.find(".day_num").text();
	   newScheduleItem.find(".day_num").text(parseInt(currentDayNum) + 1);
	         
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
		   var lastScheduleItem = $(".schedule-ul li:last-child");   
		   lastScheduleItem.remove();
	   })
	   
	         
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
     
         // 장소 선택 버튼
            var selectPlaceButtons = document.querySelectorAll('.schedule-btn-grp');

            selectPlaceButtons.forEach(function (button, index) {
                button.addEventListener('click', function () {
                    var liElement = findClosestParent(this, "li");
                    var selectedPlace = liElement.querySelector('.day_date').innerText;

                    // 클릭된 버튼에 가장 가까운 스케줄 항목을 찾음
                    var scheduleItem = findClosestParent(this, ".schedule-item");

                    // 해당 스케줄 항목 내의 placeList 입력 필드를 업데이트
                    var inputField = scheduleItem.querySelector(".placeList");
                    inputField.value = selectedPlace;

                    // 이 스케줄 항목의 날짜 번호를 얻어옴
                    var dayNum = scheduleItem.querySelector(".day_num").innerText;

                    // 이 날짜에 대한 선택한 위치를 기반으로 추가 동작 수행 가능
                    console.log(dayNum + "일의 선택한 장소: " + selectedPlace);
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
        //var scheduleItem = findClosestParent(element, ".schedule-item");
      
      
      let inputSelector = '.day-' + day.split('day')[0] + ".placeList";
      console.log(inputSelector)
      
      var inputField = document.querySelector(inputSelector);
      console.log(inputField)

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

		console.log($("#doe_location").val())

          for (i=0;i<scheduleItems.length;i++) {
             schedules.push({
               title : $("#title").val(),
                day_date : scheduleItems[i].querySelector(".day_num").innerText,
                place1 : scheduleItems[i].querySelector(".placeList").value,
                memo1 : scheduleItems[i].querySelector(".memoList").value,
            	title : $("#title").val(),
                day_date : scheduleItems[i].querySelector(".day_num").innerText,
                place : scheduleItems[i].querySelector(".placeList").value,
                memoList : scheduleItems[i].querySelector(".memoList").value,
                start_Num : $("#start_Date").val(),
                end_Date: $("#end_Date").val(),
                doe_Name :$("#doe_location").val(),
                date1: scheduleItems[i].querySelector(".detail_scedule").value
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
   
      // 지도를 표시할 div 
      function mapDisplay(x, y){
         var mapContainer = document.getElementById('map'), 
         mapOption = { 
             center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
             level: 3 // 지도의 확대 레벨
         };
         
         //지도 생성
         var map = new kakao.maps.Map(mapContainer, mapOption); 
         
         var points = [
             new kakao.maps.LatLng(x,y)
         ];

         var bounds = new kakao.maps.LatLngBounds();    
         
         var i, marker;
         for (i = 0; i < points.length; i++) {
         marker =     new kakao.maps.Marker({ position : points[i] });
         marker.setMap(map);
         
         bounds.extend(points[i]);
         }
         
         function setBounds() {
         map.setBounds(bounds);
         }
      }
      
          window.onload = function() {
               mapDisplay('37.4474916666666','127.147719444444');
           };

          // 주소검색 이벤트 -- 검색 버튼 클릭 시
         $(document).on('click','.evt-search',function(e){
            var address = $('.evt-address').val();
            if( $.trim(address) == ''){ alert("주소를 입력해주세요."); return false; }
            map.search('map',address);
         });
         // 주소검색 이벤트 -- 검색어 엔터 시
         $(document).on('keydown','.evt-address',function(e){
            if( e.keyCode == 13){
               var address = $(this).val();
               if( $.trim(address) == ''){ alert("주소를 입력해주세요."); return false; }
               map.search('map',address);
            }
         });
          function toggleAddressInput() {
              const addressInput = document.querySelector('.evt-address');
              const searchButton = document.querySelector('.evt-search');
              // 입력 칸과 검색 버튼을 토글하여 보이거나 숨기도록 처리
              if (addressInput.classList.contains('d-none')) {
                  addressInput.classList.remove('d-none');
                  searchButton.classList.remove('d-none');
              } else {
                  addressInput.classList.add('d-none');
                  searchButton.classList.add('d-none');
              }
          } 
          
          
</script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>