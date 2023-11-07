<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
    <title>일정 글쓰기</title>

<!--카카오키 -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47505492acfacae877bc0ab034617c5f&libraries=services,clusterer,drawing"></script>
      
<!--네이버키 -->
   <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=&submodules=geocoder"></script>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
   
</head>


<style>
.nav-wrap {
   position:relative;
   margin: 50px auto 0;
   width: 1000px;
   height: 50px;
}

.nav-wrap:after {
   content: "";
   position: absolute;
   top: 50%;
   left: 0 ;
   margin-top: -15px;
   width: 6px;
   height: 30px;
   background-color: #0099FF;
}
.nav-wrap h2 {
   position: absolute;
   top: 0;
   left: 0;
   width : 100px;
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

.container {
   margin: 20px auto 0;
   width: 1000px;
}
/* .schedule { */
/*    display: flex; */
/*    height: 30px; */
/* } */
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
   content: "";
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
}

.map-section {
   position: absolute;
   top: 0;
   left: 0;
   padding: 20px;
   width: 500px;
   border: 2px solid #ccc; 
   border-radius : 5px;
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
}

.schedule-list > ul > li {
   padding-bottom: 30px;
   width: 100%;
   border-bottom: 1px dashed #666;

}

.schedule-list > ul > li:last-child {
   border-bottom: none;
}

.schedule-item + .schedule-item {
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
   padding:0;
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
/*    height: 50px; */
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
   margin: 30px auto 0;
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
   /* 모달의 디스플레이 여부 및 레이아웃 설정 */
.modal {
  display: none; 
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.6); 
}

/* 모달 내부 내용의 스타일 */
.modal-content {
  background-color: #fefefe;
  margin: 12% auto; 
  padding: 20px;
  border: 1px solid #ccc;
  width: 00000%;
  max-width: 400px;
  border-radius: 8px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

/* 모달 내부 닫기 버튼의 스타일 */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

/* 내용의 텍스트 스타일 */
.modal-content p {
  font-size: 16px;
  line-height: 1.6;
  color: #333;
}

/* 버튼 스타일 */
.modal-content button {
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #009688;
  color: white; 
  font-size: 16px;
  cursor: pointer;
}

/* 버튼 호버 효과 */
.modal-content button:hover {
  background-color: #00796B;
}

   
</style>

<body>

<div class="nav-wrap">
   <h2>한국</h2>
    <ul class="nav-ul">
        <li class="nav-li">
      <a href="javascript:void(0);" onclick="getLocation(this)" data-value="서울" class="doe_name">
                서울
            </a>
        </li>
         <li class="nav-li">
        <a href="javascript:void(0);" onclick="getLocation(this)" data-value="경기">
            경기
        </a>
    </li>
          <li class="nav-li">
             <a href="javascript:void(0);" onclick="getLocation(this)" data-value="인천">
                인천
            </a>
        </li>
        <li class="nav-li">
               <a href="javascript:void(0);" onclick="getLocation(this)" data-value="강원">
                강원
            </a>
        </li>
        <li class="nav-li">
            <a href="javascript:void(0);" onclick="getLocation(this)" data-value="제주">
                제주
            </a>
        </li>
    <li class="nav-li">
      <a href="javascript:void(0);" onclick="getLocation(this)" data-value="전남">
            전남
        </a>
    </li>
    <li class="nav-li">
          <a href="javascript:void(0);" onclick="getLocation(this)" data-value="부산">
            부산
        </a>
    </li>
      <li class="nav-li">
      <a href="javascript:void(0);" onclick="getLocation(this)" data-value="경남">
            경남
        </a>
      </li>
    
    <li class="nav-li">
           <a href="javascript:void(0);" onclick="getLocation(this)" data-value="대전" >
            대전
        </a>
    </li>
    <li class="nav-li">
        <a href="javascript:void(0);" onclick="getLocation(this)" data-value="경북">
            경북
        </a>
    </li>
    <li class="nav-li">
        <a href="javascript:void(0);" onclick="getLocation(this)" data-value="대구" >
            대구
        </a>
    </li>
    <li class="nav-li">
     <a href="javascript:void(0);" onclick="getLocation(this)" data-value="울산">
            울산
        </a>
    </li>
    <li class="nav-li">
      <a href="javascript:void(0);" onclick="getLocation(this)" data-value="충북" >
            충북
        </a>
    </li>
    <li class="nav-li">
         <a href="javascript:void(0);" onclick="getLocation(this)" data-value="충남">
            충남
        </a>
    </li>
    <li class="nav-li">
          <a href="javascript:void(0);" onclick="getLocation(this)" data-value="광주">
            광주
        </a>
    </li>
    <li class="nav-li">
     <a href="javascript:void(0);" onclick="getLocation(this)" data-value="전북">
            전북
        </a>
    </li>
    </ul>
    </div>
  
<div class="container">
   <div class="cont_top">
      <div class="schedule">
         <br>
         <em>날짜 선택</em>
         <form>
            <input type="date" class="form-control mt-1" id="start_Date" name="start_Date" placeholder="Choose Date">
            <input type="date" class="form-control mt-1" id="end_Date" name="end_Date" placeholder="Choose Date">
         </form>
      </div>
   </div>
   <div class="cont_bottom">
      <div class="map-section">
         <!--<h1>지도</h1> --> 
          <div class="evt-map" id="map"></div>
      </div>
      
   <div class="schedule-list">
    <ul>
        <li class="schedule-item">
            <p><span>day <em id="day_num">1</em></span><em id="day_date">10.31</em></p>
            <div class="schedule-btn-grp">
                <ul>
                    <li><button onclick="openModal()">장소추가</button></li>
                    <li><button onclick="memoModal()">메모추가</button></li>
                </ul>
            </div>
        </li>
        
        <li class="schedule-item">
            <p><span>day <em id="day_num">2</em></span> <em id="day_date">10.31</em></p>
            <div class="schedule-btn-grp">
                <ul>
                    <li><button onclick="openModal()">장소 추가</button></li>
                    <li><button onclick="openModal()">메모 추가</button></li>
                </ul>
            </div>
        </li>
        
        <li class="schedule-item">
            <p><span>day <em id="day_num">3</em></span> <em id="day_date">10.31</em></p>
            <div class="schedule-btn-grp">
                <ul>
                    <li><button onclick="openModal()">장소 추가</button></li>
                    <li><button onclick="openModal()">메모 추가</button></li>
                </ul>
            </div>
        </li>
        
        <li class="schedule-item">
            <p><span>day <em id="day_num">4</em></span> <em id="day_date">10.31</em></p>
            <div class="schedule-btn-grp">
                <ul>
                    <li><button onclick="openModal()">장소 추가</button></li>
                    <li><button onclick="openModal()">메모 추가</button></li>
                </ul>
            </div>
        </li>
    </ul>
    
    <div class="mySchedule">
        <button onclick="goToScheduleDetail()">일정등록하기</button>
    </div>
<!--     장소추가 -->
<div id="myModal" class="modal" style="display: none;">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
    <form id="locationForm">
      <input type="text" id="location" placeholder="장소를 입력하세요">
      <input type="submit" value="추가">
    </form>
    <div class="search" style="display: none;">
      <input id="address" type="text" placeholder="검색할 주소">
      <input id="submit" type="button" value="주소검색" onclick="showTable()">
    </div>
    <div id="map" style="width:1000px;height:500px; display: none;"></div>
    <div style="display: none;">
      <table>
        <thead>
          <tr>
            <th>주소</th>
            <th>위도</th>
            <th>경도</th>
          </tr>
        </thead>
        <tbody id="mapList"></tbody>
      </table>
    </div>
  </div>
</div>


    <div class="goBack">
        <button onclick="goToScheduleList()">뒤로가기</button>
    </div>
</div>
   
   
   <div id="memoModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeMemoModal()">&times;</span>
    <h2>메모 추가</h2>
    <form id="memoForm">
      <label for="memo">메모:</label>
      <input type="text" id="memo" name="memo">
      <button type="button" onclick="addMemo()">확인</button>
    </form>
  </div>
</div>


<script>
function openModal() {
     document.getElementById("myModal").style.display = "block";

     // 네이버 지도 생성
     var mapOptions = {
       center: new naver.maps.LatLng(37.5666805, 126.9784147), // 초기 좌표
       zoom: 10 // 초기 줌 레벨
     };

     var map = new naver.maps.Map('map', mapOptions);
   }

   function closeModal() {
     document.getElementById("myModal").style.display = "none";
   }


function openModal() {
     document.getElementById("myModal").style.display = "block";
   }

   function closeModal() {
     document.getElementById("myModal").style.display = "none";
   }

   function showTable() {
     var addressInput = document.getElementById("address");
     var map = document.getElementById("map");
     var search = document.querySelector(".search");
     var table = document.querySelector("table");

     addressInput.style.display = "block";
     map.style.display = "block";
     search.style.display = "block";
     table.style.display = "block";
   }


// 메모를 추가하는 함수 (여기서는 경고창으로 표시)
function addMemo() {
  var memoValue = document.getElementById("memo").value;
  alert("추가된 메모: " + memoValue);
  closeMemoModal(); // 모달 닫기
}

function openModal() {
     document.getElementById("myModal").style.display = "block";
   }

   function closeModal() {
     document.getElementById("myModal").style.display = "none";
   }

   document.getElementById("locationForm").addEventListener("submit", function(event) {
     event.preventDefault();
     var locationValue = document.getElementById("location").value;
     alert("장소가 추가되었습니다: " + locationValue);
     closeModal(); 
   });
   

function goToScheduleDetail() {

function getLocation(element) {
    const location = element.getAttribute('data-value');
    const start_Date = document.getElementById("start_Date").value;
    const end_Date = document.getElementById("end_Date").value;
   
   alert(location) ;   
    const param = {
        doe_Name: location,
        start_Date: start_Date,
        end_Date: end_Date
    };

     sendDataToServer(param);
}

function sendDataToServer(data) {
    $.ajax({
        url: '/schedule/writeInsert',
        method: 'POST',
        data: data,
        success: function (response) {
            if (response === 'success') {
                handleResponseSuccess();
            } else {
                handleResponse(response);
            }
        },
        error: function (xhr, status, error) {
            handleResponse(error);
        }
    });
}

function handleResponseSuccess() {
    alert('일정이 성공적으로 등록되었습니다.');
    window.location.href = '/schedule/list';
}

function handleResponse(error) {
    alert('일정 등록에 실패했습니다.');
    console.error('데이터 가져오기에 실패했습니다:', error);
}
}

var map = {
      item : {},
      // 맵 로드
      load : function(id, options){
         var thisObj = this;
         if (typeof id == 'undefined'){ return false; }
         // 옵션이 없을 경우 기본값 정의
         if(typeof options == 'undefined'){ options = {};}
         // 지도객체 아이템을 조금더 세분화 
         thisObj.item[id] = {};
         // 지도의 옵션 초기화
         if(typeof options.lat =='undefined'){ options.lat = 33.450701;}
         if(typeof options.lng =='undefined'){ options.lng = 126.570667;}
         if(typeof options.level =='undefined'){ options.level = 3;}
         var coords = new kakao.maps.LatLng(options.lat, options.lng); // 지도의 중심좌표
         // 맵 옵션
         var mapOptions = {
            center: coords,
            level: options.level // 지도의 확대 레벨            
         }
         // 지도 생성
         thisObj.item[id].map = new kakao.maps.Map(document.getElementById(id),mapOptions);
         // 마커 생성
         thisObj.item[id].markers =[];
         thisObj.item[id].markers[thisObj.item[id].markers.length] = new kakao.maps.Marker({
             position: coords,
         });      
         $.each(thisObj.item[id].markers,function(i,v){
            // 마커를 적용
            thisObj.item[id].markers[i].setMap(thisObj.item[id].map);
         });
      },
      search : function(id,address){
         var thisObj = this;
         if( typeof id == 'undefined') return false;
         if( typeof address == 'undefined') return false;
         if( typeof thisObj.item[id] == 'undefined') return false;
         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new kakao.maps.services.Geocoder();
         // 주소로 좌표를 검색합니다
         geocoder.addressSearch(address, function(result, status) {
         // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {
         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
         // 현재 마커들을 삭제
         $.each(thisObj.item[id].markers,function(i,v){
         // 마커를 적용
         thisObj.item[id].markers[i].setMap(null);
         thisObj.item[id].markers = [];
         });                    
         // 마커 생성
         thisObj.item[id].markers[thisObj.item[id].markers.length] = new kakao.maps.Marker({
          position: coords
         });      
         // 현재 마커들을 삭제
         $.each(thisObj.item[id].markers,function(i,v){
          // 마커를 적용
         thisObj.item[id].markers[i].setMap(thisObj.item[id].map);
          });                    
         thisObj.item[id].map.panTo(coords);    
             } 
             else{
                alert('주소 검색에 실패하였습니다.');
             }
         });    

      },
   };
   $(document).ready(function(e){
      map.load('map',{});
   });
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

</body>
</html>