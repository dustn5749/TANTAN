<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Kakao Maps</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <!-- Kakao Maps API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47505492acfacae877bc0ab034617c5f&libraries=services,clusterer,drawing"></script>

       <title>Kakao Maps</title>
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            width: 100%;
            max-width: 800px;
            margin: 40px auto;
        }
        .map-section {
            width: 50%;
            padding: 20px;
        }
        
        .form-section {
            width: 50%;
            padding: 20px;
        }
         .map-section { 
             border: 2px solid #ccc; 
         } 
     
       #map {
	    height: 500px;
	    border-radius: 1px; /*
       

     
/*         .form-section { */
/*             padding-left: 20px; */
/*         } */
        
/*          .container .form {  */
/*              margin: 10px 0;  */
/*              border-bottom: solid 3px #eee;  */
/*              padding: 5px 0;  */
/*          }   */


/*         .container .form input {  */
/*              width: 100%;  */
/*             padding: 5px 3px;  */
/*              font-size: 12px;  */
/*             margin-bottom: 10px;  */
/*          }  */

/*          .container .form label {  */
/*              display: block;  */
/*              margin-bottom: 5px;  */
/*          }  */

/*          .container .form a {  */
/*              display: inline-block;  */
/*              text-align: center;  */
/*              border: solid 1px #eee;  */
/*              text-decoration: none;  */
/*              color: #333;  */
/*              font-size: 12px;  */
/*              padding: 5px 0;  */
/*              margin-right: 10px;  */
/*          }  */
/*  		  body {  */
/*              font-family: Arial, sans-serif; */ */
/*              margin: 0;  */
/*              padding: 0;  */
/*              background-color: #f4f4f4;/ */
/*          }  */

/*          .container { */ */
/*               max-width: 800px;  */ */
/*               margin: 0 auto;  */ */
/*               padding: 20px;  */ */
/*               background-color: #fff;  */ */
/*               box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  */ */
/*               border-radius: 8px;  */ */
/*               margin-top: 20px;  */ */
/*  }  */

        .map-section {
            text-align: center;
        }

        .map-section h1 {
            margin-bottom: 20px;
            color: #333;
        }

        .form {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .evt-address {
            padding: 8px;
            width: 60%;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .evt-search {
            display: inline-block;
            padding: 8px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .evt-search:hover {
            background-color: #0056b3;
        }

        .region-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }

        .region-buttons button {
            padding: 8px 15px;
            background-color: #009688;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .region-buttons button:hover {
            background-color: #007d63;
        }
        
        .explore-section {
        margin:0 auto;
        text-align: center;
        align-content: center;
        align-items: center;
        }
        

	.container{  overflow: hidden; }
	.container { overflow: hidden; width:100%; max-width: 500px; margin:40px auto;  }
	.container .evt-map{ width:100%; height:300px; border:solid 1px #eee; }
	.container .form{ margin:10px 0; border-bottom: solid 3px #eee; padding:5px 0;}
	.container .form input{ width:280px; padding:5px 3px; font-size:12px; }
	.container .form a{ display: inline-block; width:80px; text-align:center; border:solid 1px #eee; text-decoration: none; color:#333; font-size:12px; padding:5px 0; }



    </style>
</head>
<body>

<section class="explore-section section-padding" id="section_2">
    <div class="col-12 text-center">
        <br>
     
    
    </div>
<div class="container-fluid">
		    <div class="row d-flex justify-content-center">
		      <div class="col-12 text-center">
		        <ul class="nav nav-tabs" id="myTab" role="tablist">
		            <li class="nav-item" role="presentation">
		                <button class="nav-link active" id="design-tab" data-bs-toggle="tab" data-bs-target="#design-tab-pane" type="button"
		                 role="tab" aria-controls="design-tab-pane" aria-selected="true">서울</button>
		        		    </li>

                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="marketing-tab" data-bs-toggle="tab" data-bs-target="#marketing-tab-pane" type="button" 
                                role="tab" aria-controls="marketing-tab-pane" aria-selected="false">강원도</button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="finance-tab" data-bs-toggle="tab" data-bs-target="#finance-tab-pane" type="button" 
                                role="tab" aria-controls="finance-tab-pane" aria-selected="false">제주</button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="music-tab" data-bs-toggle="tab" data-bs-target="#music-tab-pane" type="button" 
                                role="tab" aria-controls="music-tab-pane" aria-selected="false">부산</button>
                            </li>

                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="education-tab" data-bs-toggle="tab" data-bs-target="#education-tab-pane" type="button" 
                                role="tab" aria-controls="education-tab-pane" aria-selected="false">경기도</button>
                            </li>
                     
                             <li class="nav-item" role="presentation">
                                <button class="nav-link" id="education-tab" data-bs-toggle="tab" data-bs-target="#education-tab-pane" type="button" 
                                role="tab" aria-controls="education-tab-pane" aria-selected="false">충청도</button>
                            </li>
                        
                        
                              <li class="nav-item" role="presentation">
                                <button class="nav-link" id="education-tab" data-bs-toggle="tab" data-bs-target="#education-tab-pane" type="button" 
                                role="tab" aria-controls="education-tab-pane" aria-selected="false">경상도</button>
                            </li>
                        
                        
                              <li class="nav-item" role="presentation">
                                <button class="nav-link" id="education-tab" data-bs-toggle="tab" data-bs-target="#education-tab-pane" type="button"
                                 role="tab" aria-controls="education-tab-pane" aria-selected="false">전라도</button>
                            </li>
                        
                              <li class="nav-item" role="presentation">
                                <button class="nav-link" id="education-tab" data-bs-toggle="tab" data-bs-target="#education-tab-pane" type="button"
                                 role="tab" aria-controls="education-tab-pane" aria-selected="false">울릉도</button>
                            </li>
                        </ul>
                    </div>
                </div>
        	</div>
          </section>
           <div class="container">
    <div class="map-section">
<!--         <h1>지도</h1> -->
       
        <div class="evt-map" id="map"></div>
    </div>
    <div class="form-section">
        <form class="col-md-9 m-auto" method="post" role="form">
            <div class="mb-3">
                <label for="inputsubject">Day 1</label>
                <input type="date" class="form-control mt-1" id="date1" name="date1" placeholder="Choose Date">
                <input type="date" class="form-control mt-1" id="date1" name="date1" placeholder="Choose Date">
                <input type="time" class="form-control mt-1" id="time1" name="time1" placeholder="Choose Time">
              <div class="form">
    <a href="#" class="btn btn-info btn-sm add-place" onclick="toggleAddressInput()">장소추가</a>
    <input type="text" class="evt-address d-none" name="address" value="" placeholder="주소입력">
    <a href="#none" onclick="handleSearchAddress()" class="evt-search d-none">검색</a>
</div>

<script>
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

    function handleSearchAddress() {
        // 여기에 주소 검색 이벤트를 추가하는 JavaScript 코드를 작성합니다.
        alert('주소 검색을 수행합니다.');
    }
</script>
              
                
                <a href="#" class="btn btn-info btn-sm add-memo">메모추가</a>
            </div>
            <div class="mb-3">
                <label for="inputsubject">Day 2</label>
                <input type="date" class="form-control mt-1" id="date2" name="date2" placeholder="Choose Date">
                <input type="date" class="form-control mt-1" id="date1" name="date1" placeholder="Choose Date">
                <input type="time" class="form-control mt-1" id="time2" name="time2" placeholder="Choose Time">
            <a href="#" class="btn btn-info btn-sm add-place" onclick="showAddressInput()">장소추가</a>
<input type="text" class="evt-address d-none" name="address" value="" placeholder="주소입력">
<a href="#none" class="evt-search d-none" onclick="handleSearchAddress()">검색</a>
            
                <a href="#" class="btn btn-info btn-sm add-memo">메모추가</a>
            </div>
            <div class="row">
                <div class="col text-center mt-2">
                    <button type="submit" class="btn btn-success btn-lg px-3">일정 생성하기</button>
                </div>
            </div>
        </form>
    </div>
</div>
           
                
			
			
			<!-- kakao 지도 API (+ services와 clusterer, drawing 라이브러리 불러오기) -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=543d067cfc41f7325d2f408e2f32264d&libraries=services,clusterer,drawing"></script>
			<script>
    var map = {
        item: {},
        load: function(id, options) {
            var thisObj = this;
            if (typeof id == 'undefined') {
                return false;
            }
            if (typeof options == 'undefined') {
                options = {};
            }

            thisObj.item[id] = {};

            thisObj.item[id].map = new kakao.maps.Map(document.getElementById(id), {
                center: new kakao.maps.LatLng(options.lat || 33.450701, options.lng || 126.570667),
                level: options.level || 3
            });

            thisObj.item[id].markers = [];
            thisObj.item[id].markers.push(new kakao.maps.Marker({
                position: new kakao.maps.LatLng(options.lat || 33.450701, options.lng || 126.570667)
            }));

            thisObj.item[id].markers.forEach(function(marker) {
                marker.setMap(thisObj.item[id].map);
            });
        },
        search: function(id, address) {
            var thisObj = this;
            if (typeof id == 'undefined' || typeof address == 'undefined' || typeof thisObj.item[id] == 'undefined') {
                return false;
            }

            var geocoder = new kakao.maps.services.Geocoder();

            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    thisObj.item[id].markers.forEach(function(marker) {
                        marker.setMap(null);
                    });
                    thisObj.item[id].markers = [];
                    thisObj.item[id].markers.push(new kakao.maps.Marker({ position: coords }));
                    thisObj.item[id].markers.forEach(function(marker) {
                        marker.setMap(thisObj.item[id].map);
                    });

                    thisObj.item[id].map.panTo(coords);
                } else {
                    alert('주소 검색에 실패하였습니다.');
                }
            });
        }
    };

    $(document).ready(function(e) {
        map.load('map', {});
    });

    $(document).on('click', '.evt-search', function(e) {
        var address = $('.evt-address').val();
        if ($.trim(address) === '') {
            alert("주소를 입력해주세요.");
            return false;
        }
        map.search('map', address);
    });

    $(document).on('keydown', '.evt-address', function(e) {
        if (e.keyCode === 13) {
            var address = $(this).val();
            if ($.trim(address) === '') {
                alert("주소를 입력해주세요.");
                return false;
            }
            map.search('map', address);
        }
    });
</script>


  
       
 
<!-- jquery -->
<script src="//code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>


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
