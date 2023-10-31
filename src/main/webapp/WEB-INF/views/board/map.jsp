<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="//code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script><?php // http://craftpip.github.io/jquery-confirm/ ?> 
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=657a667701d99d211422aac539b6e927&libraries=services,clusterer,drawing"></script>
  <style>
    .container{  overflow: hidden; }
    .container { overflow: hidden; width:100%; max-width: 500px; margin:40px auto;  }
    .container .evt-map{ width:100%; height:300px; border:solid 1px #eee; }
    .container .form{ margin:10px 0; border-bottom: solid 3px #eee; padding:5px 0;}
    .container .form input{ width:280px; padding:5px 3px; font-size:12px; }
    .container .form a{ display: inline-block; width:80px; text-align:center; border:solid 1px #eee; text-decoration: none; color:#333; font-size:12px; padding:5px 0; }
  
  </style>
</head>
<body>
  <!-- 지도를 띄울 Container -->
<div class="container">
	<div class="group">
		<h1>지도</h1>
		<div class="form">
			<input type="text" class="evt-address" name="address" value="" placeholder="주소입력">
			<a href="#none" onclick="return false;" class="evt-search">검색</a>
		</div>
		<div class="evt-map" id="map"></div>
	</div>
</div>

<!-- script -->
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

</script>
</body>
</html>