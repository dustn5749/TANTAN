<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Kakao Maps</title>
	<script src="//code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script><?php // http://craftpip.github.io/jquery-confirm/ ?> 

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47505492acfacae877bc0ab034617c5f&libraries=services,clusterer,drawing"></script>
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
.schedule {
	display: flex;
	height: 30px;
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
	height: 50px;
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
</style>

<body>

<div class="nav-wrap">
	<h2>한국</h2>
    <ul class="nav-ul">
        <li class="nav-li">
            <a class="nav-btn">
                서울
            </a>
        </li>
        <li class="nav-li">
            <a href="javascript:void(0);">
                강원도
            </a>
        </li>
        <li class="nav-li">
            <a href="javascript:void(0);">
                제주
            </a>
        </li>
        <li class="nav-li">
            <a href="javascript:void(0);">
                부산
            </a>
        </li>
        <li class="nav-li">
            <a href="javascript:void(0);">
                경기도
            </a>
        </li>
        <li class="nav-li">
            <a href="javascript:void(0);">
                충청도
            </a>
        </li>
        <li class="nav-li">
            <a href="javascript:void(0);">
                경상도
            </a>
        </li>
        <li class="nav-li">
            <a href="javascript:void(0);">
                전라도
            </a>
        </li>
        <li class="nav-li">
            <a href="javascript:void(0);">
                울릉도
            </a>
        </li>
    </ul>
</div>
<div class="container">
	<div class="cont_top">
		<div class="schedule">
			<em>날짜 선택</em>
			<form>
				<input type="date" class="form-control mt-1" id="date_start" name="date_start" placeholder="Choose Date">
				<input type="date" class="form-control mt-1" id="date_end" name="date_end" placeholder="Choose Date">
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
					<p><span>day <em id="day_num">1</em></span> <em id="day_date">10.31</em></p>
					<div class="schedule-btn-grp">
						<ul>
							<li><a href="javascript:void(0);">장소 추가</a></li>
							<li><a href="javascript:void(0);">메모 추가</a></li>
						</ul>
					</div>
				</li>
				
				<li class="schedule-item">
					<p><span>day <em id="day_num">2</em></span> <em id="day_date">10.31</em></p>
					<div class="schedule-btn-grp">
						<ul>
							<li><a href="javascript:void(0);">장소 추가</a></li>
							<li><a href="javascript:void(0);">메모 추가</a></li>
						</ul>
					</div>
				</li>
				
				<li class="schedule-item">
					<p><span>day <em id="day_num">3</em></span> <em id="day_date">10.31</em></p>
					<div class="schedule-btn-grp">
						<ul>
							<li><a href="javascript:void(0);">장소 추가</a></li>
							<li><a href="javascript:void(0);">메모 추가</a></li>
						</ul>
					</div>
				</li>
				
				<li class="schedule-item">
					<p><span>day <em id="day_num">4</em></span> <em id="day_date">10.31</em></p>
					<div class="schedule-btn-grp">
						<ul>
							<li><a href="javascript:void(0);">장소 추가</a></li>
							<li><a href="javascript:void(0);">메모 추가</a></li>
						</ul>
					</div>
				</li>
			</ul>
			<div class="mySchedule">
				<a href="javascript:void(0);">
					내 일정으로 이동
				</a>
			</div>
		</div>
<script>
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