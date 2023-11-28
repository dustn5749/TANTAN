<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%> 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
 
  
 <!DOCTYPE html> 
 <html> 
 <head> 
 <meta charset="UTF-8"> 
 <title>리뷰페이지</title> 
 <style> 
 @font-face {
     font-family: 'Pretendard-Regular';
     src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
     font-weight: 400;
     font-style: normal;
}
 .review_container {
     margin: 0 auto;
     padding: 10px;
     align-items: flex-start !important;
     justify-content: flex-start !important;
     align-content:flex-start !important;
     height: 1300px;
     padding-top: 30px;
}



 .boardmap_container {
     width: 90% !important;
     padding: 3% !important;
     margin: 0 auto;
     display: flex;
     justify-content: center;
     
}
 .row {
     display: flex;
     margin: 0 auto !important;
     justify-content: center;
     width: 100%;
     height: 100% !important;
}
 .col-md-12 {
     display: flex;
     justify-content: space-between;
     align-items: center;
     position: relative;
     width: 100%;
}
 @media (max-width: 798px) {
     .list-container, .wrap {
         width: 100%;
         float: none;
    }
}
 @media (min-width: 799px) {
     .list-container, .wrap {
         width: 40%;
         float: left;
         text-align: left;
    }
     .col-md-12:after {
         display: table;
         clear: both;
    }
     .list-container {
         display: flex;
         flex-wrap: wrap;
         justify-content: center;
    }
     .wrap {
         width: 40%;
         text-align: center;
    }
     .reviewform textarea {
         width: 100%;
         padding: 10px;
         box-sizing: border-box;
    }
     .col-md-6 {
         position: relative;
         height: 700px;
        /* padding-bottom: 200px */
    }
     #map_div{
         margin: 0;
    }
     .map_div_inner {
         margin: 0;
         padding: 0;
         width: 300px;
    }
     .col-md-6 > a {
         align-content: center;
         align-items: center;
         align-self: center;
         margin: 0 atuo;
    }
    /* 검색바 div */
     .search_bar {
         height: 100px;
         margin: 0 auto;
         padding-top: 25px;
    }
    /* 검색 input 창 */
     .search_bar > input {
         width: 350px;
         border: 1px solid rgb(233, 233, 233);
         border-radius: 3px;
         padding: 1%;
         font-family: 'Pretendard-Regular' !important;
    }
    /* 검색 버튼 */
     #search_btn{
         border: none;
         box-shadow: 1px 1px 1px 1px rgb(233, 233, 233);
         border-radius: 10px;
         width: 50px;
         height: 50px;
    }
     #search_btn:hover {
         background-color: rgb(173, 173, 173);
    }
    /* 벌점을 선택해주세요 */
     .warning_msg {
         height: 50px;
         font-size: 25px !important;
         font-family: 'Pretendard-Regular' !important;
    }
    /* 5자 이상으로 입력해주세요 */
     .warning_msg_comment {
         height: 50px;
         margin: 0 auto;
         justify-content: center;
         text-align: center;
         padding-top: 15px;
    }
     .list0 {
         clear:both;
         position: relative;
         z-index: 1;
         top: -35px;
         left: -5px;
    }
     .list1 {
         clear:both;
         position: absolute;
         z-index: 1;
         top: 260px;
         left: 20px;
    }
     .list2 {
         clear:both;
         position: absolute;
         z-index: 2;
         top: 215px;
         left: 52px;
    }
     .list3 {
         clear:both;
         position: absolute;
         z-index: 3;
         top: 232px;
         left: 115px;
    }
     .list4 {
         clear:both;
         position: absolute;
         z-index: 4;
         top: 050px;
         left: 88px;
    }
     .list5 {
         clear:both;
         position: absolute;
         z-index: 5;
         top: 154px;
         left: 35px;
    }
     .list6 {
         clear:both;
         position: absolute;
         z-index: 6;
         top: 074px;
         left: 63px;
    }
     .list7 {
         clear:both;
         position: absolute;
         z-index: 7;
         top: 143px;
         left: 98px;
    }
     .list8 {
         clear:both;
         position: absolute;
         z-index: 8;
         top: 147px;
         left: 128px;
    }
     .list9 {
         clear:both;
         position: absolute;
         z-index: 9;
         top: 368px;
         left: 40px;
    }
     .list10 {
         clear:both;
         position: absolute;
         z-index: 10;
         top: 112px;
         left: 72px;
    }
     .list11 {
         clear:both;
         position: absolute;
         z-index: 11;
         top: 101px;
         left: 39px;
    }
     .list12 {
         clear:both;
         position: absolute;
         z-index: 12;
         top: 192px;
         left: 96px;
    }
     .list13 {
         clear:both;
         position: absolute;
         z-index: 13;
         top: 275px;
         left: 62px;
    }
     .list14 {
         clear:both;
         position: absolute;
         z-index: 14;
         top: 223px;
         left: 157px;
    }
     .list15 {
         clear:both;
         position: absolute;
         z-index: 15;
         top: 242px;
         left: 189px;
    }
     .list16 {
         clear:both;
         position: absolute;
         z-index: 16;
         top: 263px;
         left: 179px;
    }
	.star-rating {
	    border: solid 1px #ccc;
	    justify-content: flex-end;
	    align-content: center;
	    text-align: center;
	    margin: 0 auto;
	    display: flex;
	    flex-direction: row-reverse;
	    font-size: 3em;
	    justify-content: space-around;
	    padding: 0 .2em;
	    text-align: center;
	    width: 5em;
	    height: 30px;
	}
	
	.star-rating input {
	    display: none;
	}
	
	.star-rating label {
	    color: #ccc;
	    cursor: pointer;
	}


	
	.star-rating input:checked ~ label {
	    color: #f90;
	}
	
	.star-rating label:hover, .star-rating label:hover ~ label {
	    color: #fc0;
	}
     .cmd {
         height: 75px;
         margin: 0 atuo;
         align-items: center;
         padding-top: 25px 
    }
     .cmd > input{
         width: 100px;
         height: 35px;
         border-radius: 10px;
         box-shadow: 1px 1px 1px 1px rgb(233, 233, 233);
         background-color: rgb(216, 242, 248);
         border: none;
         font-family: 'Pretendard-Regular' !important;
    }
     .cmd > input:hover {
         background-color: rgb(85, 193, 220);
         color : white;
    }
    
    .selected-region-img {
            max-width: 100%;
            height: auto;
        }
        
    /* 선택된 지역 이름 */
    #img_title{
		font-size: 40px !important;
		color : #565656;
		 font-family: 'Pretendard-Regular' !important;
		 margin-top: 20px;
		 margin-bottom: 20px;
		 font-weight: bold;
    }
    /* 지역 별점 div */
    .avlStar {
    	display: none;

    }
    
    
    /* 평점 리스트 */
    .reviewList{
    	height: 300px;
    	overflow: scroll;
    }
    .review_area {
     	display : flex;
     	justify-content: center;
     	text-align: center;
     
    }
    .member_id_div {
    	display: flex;
    	margin-right: 20px;
    	width: 100px;
    	text-align: left;
    	
    }
    .member_id_div > p {
    	margin-left: 2px;
    	margin-right: 2px;
    	font-family: 'Pretendard-Regular' !important;
    	color : grey;
    	font-size: small;
    }
    .content {
    	font-weight: bold !important;
    	font-family: 'Pretendard-Regular' !important;
    	font-size: 12px !important;
    	width: 150px;
    	text-align: left;
    }
    
    .score_span {
    	font-family: 'Pretendard-Regular' !important;
    	color : red;
    	margin-left: 15px;
    	width: 30px;
    }
     </style> 
     </head> 
     <body> 
     
<!-- 하나는 pk로 만들고 하나는 제목으로 만듬 -->

     <div class="review_container"> 
     	<div class="container px-4 px-lg-5 my-5"> 
     		<div class="row gx-4 gx-lg-5 align-items-center"> 
     			<div class="col-md-6" id="map_div" style="margin: 0; width: 300px; top: 100px;"> 
     				<div class="map_div_inner" > 
						<!--전남 -->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus1') 
     					onmouseout=mus_off('mus1') onclick=smenu_click('전남',2)> 
     						<img src='/assets/img/map2/m061.gif' alt='' border='0' name='mus1' class='list1' >
     					</a> 
						<!--전북 -->
     					<a href="" onfocus='this.blur()' onmouseover=mus_on('mus2') onmouseout=mus_off('mus2') onclick=smenu_click('전북',10)>
     					<img src='/assets/img/map2/m063.gif' alt='' border='0' name='mus2' class='list2' >
     					<!--경남 -->
     					</a><a href="#" onfocus='this.blur()' onmouseover=mus_on('mus3') onmouseout=mus_off('mus3') onclick=smenu_click('경남',14)>
     						<img src='/assets/img/map2/m055.gif' alt='' border='0' name='mus3' class='list3' >
     					</a>
     					<!--강원 -->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus4') onmouseout=mus_off('mus4') onclick=smenu_click('강원',4)>
     						<img src='/assets/img/map2/m033.gif' alt='' border='0' name='mus4' class='list4' >
     					</a>
     					<!--충남 -->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus5') onmouseout=mus_off('mus5') onclick=smenu_click('충남',6)>
     						<img src='/assets/img/map2/m041.gif' alt='' border='0' name='mus5' class='list5' >
     					</a>
     					<!--경기 -->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus6') onmouseout=mus_off('mus6') onclick=smenu_click('경기',3)>
     						<img src='/assets/img/map2/m031.gif' alt='' border='0' name='mus6' class='list6' >
     					</a>
     					<!--충북 -->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus7') onmouseout=mus_off('mus7') onclick=smenu_click('충북',5)>
     						<img src='/assets/img/map2/m043.gif' alt='' border='0' name='mus7' class='list7' >
     					</a>
     					<!--경북-->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus8') onmouseout=mus_off('mus8') onclick=smenu_click('경북',8)>
     						<img src='/assets/img/map2/m054.gif' alt='' border='0' name='mus8' class='list8' >
     					</a>
     					<!--제주-->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus9') onmouseout=mus_off('mus9') onclick=smenu_click('제주',13)>
     						<img src='/assets/img/map2/m064.gif' alt='' border='0' name='mus9' class='list9' >
     					</a>
     					<!--서울  -->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus10') onmouseout=mus_off('mus10') onclick=smenu_click('서울',1)>
     						<img src='/assets/img/map2/m02.gif' alt='' border='0' name='mus10' class='list10' >
     					</a>
     					
     					<!--인천-->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus11') onmouseout=mus_off('mus11') onclick=smenu_click('인천',2)>
     						<img src='/assets/img/map2/m032.gif' alt='' border='0' name='mus11' class='list11' >
     					</a>
     					<!--대전-->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus12') onmouseout=mus_off('mus12') onclick=smenu_click('대전',7)>
     						<img src='/assets/img/map2/m042.gif' alt='' border='0' name='mus12' class='list12' >
     					</a>
     					<!--광주-->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus13') onmouseout=mus_off('mus13') onclick=smenu_click('광주',11)>
     						<img src='/assets/img/map2/m062.gif' alt='' border='0' name='mus13' class='list13' >
     					</a>
     					<!--대구 -->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus14') onmouseout=mus_off('mus14') onclick=smenu_click('대구',9)>
     						<img src='/assets/img/map2/m053.gif' alt='' border='0' name='mus14' class='list14' >
     					</a>
     					<!--울산-->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus15') onmouseout=mus_off('mus15') onclick=smenu_click('울산',15)>
     						<img src='/assets/img/map2/m052.gif' alt='' border='0' name='mus15' class='list15' >
     					</a>
     					<!---->
     					<a href="#" onfocus='this.blur()' onmouseover=mus_on('mus16') onmouseout=mus_off('mus16') onclick=smenu_click('부산',16)>
     					<img src='/assets/img/map2/m051.gif' alt='' border='0' name='mus16' class='list16' >
     					</a> 
     				</div>
     			</div> 
     			
     			<div class="col-md-6" style="text-align: center;"> 
     				<div class="boardmap_container" style="background-color: #f2f2f2; padding: 20px; border-radius: 8px; display: inline-block;"> 
     					<div class="search_bar" > 
     						<input type="text" placeholder="지역을 검색해보세요" id="search_bar_input" style="margin-bottom: 10px;"> 
     							<button id="search_btn"> 
     								<img src="/assets/img/search.png" width="30px"> 
     							</button> 
     						</div> 
     						
     						<div class="img_div">
     							<div class="img_title_div"><p id="img_title"></p></div>
     							<div class="img_content_div">
     								<img class="region_img" >
     							</div>     							
     						</div>
     						<div class="avlStar">
     							<p id="avl_text">평균 별점 : </p>
     							    <div class="star-rating"> 
     									<input type="radio" id="5-stars" name="rating" class="star_score"  value="5" /> 
     									<label for="5-stars" class="star">&#9733; </label> 
     									<input type="radio" id="4-stars" name="rating" class="star_score"  value="4" /> 
     									<label for="4-stars" class="star">&#9733;</label> 
     									<input type="radio" id="3-stars" name="rating" class="star_score"  value="3" /> 
     									<label for="3-stars" class="star">&#9733; </label> 
     									<input type="radio" id="2-stars" name="rating" class="star_score"  value="2" /> 
     									<label for="2-stars" class="star">&#9733;</label> 
     									<input type="radio" id="1-star" name="rating" class="star_score"  value="1" /> 
     									<label for="1-star" class="star">&#9733;</label> 
     								</div>
     						</div>
     						<div class="seachcity" style="margin-bottom: 10px;"></div> 
     						<div class="row"> 
     							<input type="hidden" name="rate" id="rate" value="0" style="margin-bottom: 10px;"> 
     								<div class="warning_msg" >별점을 선택해 주세요</div> 
										<div class="star-rating"> 
     									<input type="radio" id="5-stars" name="rating" class="star_score"  value="5" /> 
     									<label for="5-stars" class="star">&#9733; </label> 
     									<input type="radio" id="4-stars" name="rating" class="star_score"  value="4" /> 
     									<label for="4-stars" class="star">&#9733;</label> 
     									<input type="radio" id="3-stars" name="rating" class="star_score"  value="3" /> 
     									<label for="3-stars" class="star">&#9733; </label> 
     									<input type="radio" id="2-stars" name="rating" class="star_score"  value="2" /> 
     									<label for="2-stars" class="star">&#9733;</label> 
     									<input type="radio" id="1-star" name="rating" class="star_score"  value="1" /> 
     									<label for="1-star" class="star">&#9733;</label> 
     									</div>
     								<div class="review_contents" style="margin-bottom: 10px;"> 
     									<div class="warning_msg_comment">5자 이상으로 작성해 주세요.</div> 
     									<textarea rows="2" class="review_textarea" style="width: 100%;"></textarea> 
     								</div> 
     								<div class="cmd"> 
     									<input type="button" name="save" id="save" value="등록"> 
     								</div> 
     								
     								<div class="reviewList"></div>
     							</div> 
     						</div> 
     					</div> 
     				</div> 
     			</div> 
				<div id="regionImageContainer">
				</div>
     		</div>
     		<c:choose>
     			<c:when test="${!empty principal}">
	     			 <input type="hidden" value="${principal.user.member_id}" id="member_id">     			
     			</c:when>
     			<c:otherwise>
     					 <input type="hidden" value="" id="member_id">
     			</c:otherwise>
     		</c:choose> 

     
     <script> 
     mus1on = new Image( );
     mus1off = new Image( );
     mus2on = new Image( );
     mus2off = new Image( );
     mus3on = new Image( );
     mus3off = new Image( );
     mus4on = new Image( );
     mus4off = new Image( );
     mus5on = new Image( );
     mus5off = new Image( );
     mus6on = new Image( );
     mus6off = new Image( );
     mus7on = new Image( );
     mus7off = new Image( );
     mus8on = new Image( );
     mus8off = new Image( );
     mus9on = new Image( );
     mus9off = new Image( );
     mus10on = new Image( );
     mus10off = new Image( );
     mus11on = new Image( );
     mus11off = new Image( );
     mus12on = new Image( );
     mus12off = new Image( );
     mus13on = new Image( );
     mus13off = new Image( );
     mus14on = new Image( );
     mus14off = new Image( );
     mus15on = new Image( );
     mus15off = new Image( );
     mus16on = new Image( );
     mus16off = new Image( );
    /* 메뉴를 늘이거나 줄일때 추가~삭제하세요. 쌍으로 구성되어있습니다. */
     mus1off.src = '/assets/img/map2/m061.gif';
     mus2off.src = '/assets/img/map2/m063.gif';
     mus3off.src = '/assets/img/map2/m055.gif';
     mus4off.src = '/assets/img/map2/m033.gif';
     mus5off.src = '/assets/img/map2/m041.gif';
     mus6off.src = '/assets/img/map2/m031.gif';
     mus7off.src = '/assets/img/map2/m043.gif';
     mus8off.src = '/assets/img/map2/m054.gif';
     mus9off.src = '/assets/img/map2/m064.gif';
     mus10off.src = '/assets/img/map2/m02.gif';
     mus11off.src = '/assets/img/map2/m032.gif';
     mus12off.src = '/assets/img/map2/m042.gif';
     mus13off.src = '/assets/img/map2/m062.gif';
     mus14off.src = '/assets/img/map2/m053.gif';
     mus15off.src = '/assets/img/map2/m052.gif';
     mus16off.src = '/assets/img/map2/m051.gif';
     mus1on.src = '/assets/img/map2/m061o.gif';
     mus2on.src = '/assets/img/map2/m063o.gif';
     mus3on.src = '/assets/img/map2/m055o.gif';
     mus4on.src = '/assets/img/map2/m033o.gif';
     mus5on.src = '/assets/img/map2/m041o.gif';
     mus6on.src = '/assets/img/map2/m031o.gif';
     mus7on.src = '/assets/img/map2/m043o.gif';
     mus8on.src = '/assets/img/map2/m054o.gif';
     mus9on.src = '/assets/img/map2/m064o.gif';
     mus10on.src = '/assets/img/map2/m02o.gif';
     mus11on.src = '/assets/img/map2/m032o.gif';
     mus12on.src = '/assets/img/map2/m042o.gif';
     mus13on.src = '/assets/img/map2/m062o.gif';
     mus14on.src = '/assets/img/map2/m053o.gif';
     mus15on.src = '/assets/img/map2/m052o.gif';
     mus16on.src = '/assets/img/map2/m051o.gif';
    /* ----------------------------------------------------------------- */
     var cMuName="";
    /* ----------------아래내용 순서 변경 불가-------------------------------- */
     var exx = new Array("","전남","전북","경남","강원","충남","경기","충북","경북","제주","서울","인천","대전","광주","대구","울산","부산");
     function mus_on(musName) {
         if(cMuName!=musName) {
             document [musName].src = eval(musName + 'on.src');
        }
    }
     function mus_off(musName) {
         if(cMuName!=musName) document [musName].src = eval(musName + 'off.src');
    }
     
     // 지도 클릭시 이벤트 
     function smenu_click(musName, doe_Num){
    	 
    	 const regionImages = {
     	        '전남': '/assets/img/doereview/jeonnam.png',
     	        '전북': '/assets/img/doereview/Jeonbuk.jpg',
     	        '경남': '/assets/img/doereview/Gyeongnam.jpg',
     	        '강원': '/assets/img/doereview/Gangwon.jpg',
     	        '충남': '/assets/img/doereview/chungnam.jpg',
     	        '경기': '/assets/img/doereview/Gyeonggi.jpg',
     	        '충북': '/assets/img/doereview/Chungbok.jpg',
     	        '제주': '/assets/img/doereview/jeju.jpg',
     	        '서울': '/assets/img/doereview/seoul.jpg',
     	        '인천': '/assets/img/doereview/Inchon.jpg',
     	        '대전': '/assets/img/doereview/Daejeon.jpg',
     	        '광주': '/assets/img/doereview/Gawngju.jpg',
     	        '대구': '/assets/img/doereview/Daegu.jpg',
     	        '울산': '/assets/img/doereview/Ulsan.jpg',
     	        '부산': '/assets/img/doereview/busan.jpg',
     	        '경북': '/assets/img/doereview/Gyeongbuk.png'
     	    };
    	 
        
     	 $("#img_title").text(musName);
     	  $(".region_img").attr("src", regionImages[musName]);
     	 $(".region_img").css({
     	    "width": "100%",
     	    "height": "300px"
     	});
     	 
     	$(".avlStar").css({
     		"display":"block"
     	})	 
     	$("#avl_text").css({
        	"font-family": "'Pretendard-Regular' !important",
        	"font-size": "20px !important",
        	"color" : "rgb(0, 0, 121)"
     	})

     	var param = {
     			doe_name : musName,
     			doe_num : doe_Num
     	}
     	
     	$.ajax({
     	    url: "/review/display",
     	    type: 'POST',
     	    contentType: "application/json; charset=UTF-8",
     	    data: JSON.stringify(param),
     	    dataType: "json",
     	    success: function (data) {
     	        if (data.result) {
     	            var reviewListDiv = $('.reviewList');
     	           reviewListDiv.empty();
     	            var average = Math.round(data.doe.average);
     	            console.log(average);
     	            $(".avlStar .star-rating input[value='" + average + "']").prop("checked", true);
     	            $(".avlStar .star-rating input").prop("disabled", true);
     	            var reviewList = data.reviewList;
					
     	            reviewList.forEach(function (e) {
     	                var div = document.createElement("div");
     	                $(div).addClass("review_area");

     	                var member_id = document.createElement("div");
     	                var member_img = document.createElement("img");
     	               $(member_img).attr("src", "/assets/img/userReview.png");
     	              $(member_img).css({
     	            		"width" : "25px"  
     	              })
     	                var member_id_p = document.createElement("p");
     	                $(member_id_p).text(e.member_id);
     	                $(member_id).addClass("member_id_div");
	     	            $(member_id_p).addClass("member_id");
	     	            
	     	            $(member_id).append(member_img);
	     	            $(member_id).append(member_id_p);

     	                var content = document.createElement("p");
     	                $(content).addClass("content");
     	                $(content).text(e.content);

     	                var scoreSpan = document.createElement("span");
     	                $(scoreSpan).text(e.score + "점");
     	               $(scoreSpan).addClass("score_span");
     	                
     	                $(div).append(member_id);
     	                $(div).append(content);
     	                $(div).append(scoreSpan);

     	                $(reviewListDiv).append(div);
     	            });
     	        }
     	    }
     	});

    }
     
     // 평점 등록하기
     $("#save").on("click", function(){
    	 var doe_name = $("#img_title").text()
    	 var score = $(".row .star-rating input:checked").val();
		 var content = $(".review_textarea").val();
		 var memberId = $("#member_id").val();
		 
    	 if(memberId == ""){
    		alert("로그인 후 이용해주세요")
    	 } else if(doe_name==""){
    		 alert("지역을 먼저 선택해주세요");
    	 } else if(score == ""){
    		 alert("점수를 선택해주세요")
    	 } else if(content == ""){
    		 alert("내용을 입력해주세요")
    	 } else {
	    	var param = {
	    			doe_name :  doe_name,
	    			score : score,
	    			content : content
	    	}
	    	
			$.ajax({
				url : "/review/insert",
				type: 'POST',
		     	contentType: "application/json; charset=UTF-8",
		     	data: JSON.stringify(param),
		     	dataType: "json",
		     	success: function (data){
		     		if(data.result){
		     			alert("일정이 성공적으로 등록되었습니다");
		 	            var reviewListDiv = $('.reviewList');
		     	           reviewListDiv.empty();
		     	            var average = Math.round(data.doe.average);
		     	            console.log(average);
		     	            $(".avlStar .star-rating input[value='" + average + "']").prop("checked", true);
		     	            $(".avlStar .star-rating input").prop("disabled", true);
		     	            var reviewList = data.reviewList;

		     	            reviewList.forEach(function (e) {
		     	                var div = document.createElement("div");
		     	                $(div).addClass("review_area");

		     	                var member_id = document.createElement("div");
		     	                var member_img = document.createElement("img");
		     	               $(member_img).attr("src", "/assets/img/userReview.png");
		     	              $(member_img).css({
		     	            		"width" : "25px"  
		     	              })
		     	                var member_id_p = document.createElement("p");
		     	                $(member_id_p).text(e.member_id);
		     	                $(member_id).addClass("member_id_div");
			     	            $(member_id_p).addClass("member_id");
			     	            
			     	            $(member_id).append(member_img);
			     	            $(member_id).append(member_id_p);

		     	                var content = document.createElement("p");
		     	                $(content).addClass("content");
		     	                $(content).text(e.content);

		     	                var scoreSpan = document.createElement("span");
		     	                $(scoreSpan).text(e.score + "점");
		     	               $(scoreSpan).addClass("score_span");
		     	                
		     	                $(div).append(member_id);
		     	                $(div).append(content);
		     	                $(div).append(scoreSpan);

		     	                $(reviewListDiv).append(div);
		     	            });
		     			
		     		} else {
		     			alert("로그인 후 이용해주세요")
		     			
		     		}
		     		
		     	} 
			})
    		 
    		 
    	 }
     }) 
	// 지역 검색하기
	$("#search_btn").on("click", function(){
		var doe_name = $("#search_bar_input").val();
		if(doe_name==""){
			alert("지역 이름을 입력해주세요");
		} else {
			var param ={
					doe_name : doe_name
			}
			
	    	 const regionImages = {
	     	        '전남': '/assets/img/doereview/jeonnam.png',
	     	        '전북': '/assets/img/doereview/Jeonbuk.jpg',
	     	        '경남': '/assets/img/doereview/Gyeongnam.jpg',
	     	        '강원': '/assets/img/doereview/Gangwon.jpg',
	     	        '충남': '/assets/img/doereview/chungnam.jpg',
	     	        '경기': '/assets/img/doereview/Gyeonggi.jpg',
	     	        '충북': '/assets/img/doereview/Chungbok.jpg',
	     	        '제주': '/assets/img/doereview/jeju.jpg',
	     	        '서울': '/assets/img/doereview/seoul.jpg',
	     	        '인천': '/assets/img/doereview/Inchon.jpg',
	     	        '대전': '/assets/img/doereview/Daejeon.jpg',
	     	        '광주': '/assets/img/doereview/Gawngju.jpg',
	     	        '대구': '/assets/img/doereview/Daegu.jpg',
	     	        '울산': '/assets/img/doereview/Ulsan.jpg',
	     	        '부산': '/assets/img/doereview/busan.jpg',
	     	        '경북': '/assets/img/doereview/Gyeongbuk.png'
	     	    };
	    	 
	        
	     	 $("#img_title").text(doe_name);
	     	  $(".region_img").attr("src", regionImages[doe_name]);
	     	 $(".region_img").css({
	     	    "width": "100%",
	     	    "height": "300px"
	     	});
			
	     	$.ajax({
	     	    url: "/review/display",
	     	    type: 'POST',
	     	    contentType: "application/json; charset=UTF-8",
	     	    data: JSON.stringify(param),
	     	    dataType: "json",
	     	    success: function (data) {
	     	        if (data.result) {
	     	            var reviewListDiv = $('.reviewList');
	     	           reviewListDiv.empty();
	     	            var average = Math.round(data.doe.average);
	     	            console.log(average);
	     	            $(".avlStar .star-rating input[value='" + average + "']").prop("checked", true);
	     	            $(".avlStar .star-rating input").prop("disabled", true);
	     	            var reviewList = data.reviewList;

	     	            reviewList.forEach(function (e) {
	     	                var div = document.createElement("div");
	     	                $(div).addClass("review_area");

	     	                var member_id = document.createElement("div");
	     	                var member_img = document.createElement("img");
	     	               $(member_img).attr("src", "/assets/img/userReview.png");
	     	              $(member_img).css({
	     	            		"width" : "25px"  
	     	              })
	     	                var member_id_p = document.createElement("p");
	     	                $(member_id_p).text(e.member_id);
	     	                $(member_id).addClass("member_id_div");
		     	            $(member_id_p).addClass("member_id");
		     	            
		     	            $(member_id).append(member_img);
		     	            $(member_id).append(member_id_p);

	     	                var content = document.createElement("p");
	     	                $(content).addClass("content");
	     	                $(content).text(e.content);

	     	                var scoreSpan = document.createElement("span");
	     	                $(scoreSpan).text(e.score + "점");
	     	               $(scoreSpan).addClass("score_span");
	     	                
	     	                $(div).append(member_id);
	     	                $(div).append(content);
	     	                $(div).append(scoreSpan);

	     	                $(reviewListDiv).append(div);
	     	            });
	     	        }
	     	    }
	     	});
			
			
		}
		
	})
	
     </script>
     </body>
      </html>