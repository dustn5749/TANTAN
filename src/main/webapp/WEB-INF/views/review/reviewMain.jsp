<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!DOCTYPE html> <html> <head> <meta charset="UTF-8"> <title>리뷰페이지</title> <style> @font-face {
     font-family: 'Pretendard-Regular';
     src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
     font-weight: 400;
     font-style: normal;
}
 .review_container {
     margin: 0 auto;
     padding: 10px;
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
    }
     .star-rating input {
         display: none;
    }
     .star-rating label {
         color: #ccc;
         cursor: pointer;
    }
     .star-rating :checked ~ label {
         color: #f90;
    }
     .star-rating label:hover, .star-rating label:hover ~ label {
         color: #fc0;
    }
    /* 등록 버튼 */
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
     </style> </head> <body> <div class="review_container"> <div class="container px-4 px-lg-5 my-5"> <div class="row gx-4 gx-lg-5 align-items-center"> <div class="col-md-6" id="map_div" style="margin: 0;
     width: 300px;
     top: 100px;
    "> <div class="map_div_inner" > <a href='./bbs/board.php?bo_table=m101&sca=전남' onfocus='this.blur()' onmouseover=mus_on('mus1') onmouseout=mus_off('mus1') onclick=smenu_click('mus1')> <img src='/assets/img/map2/m061.gif' alt='' border='0' name='mus1' class='list1' ></a> <a href='./bbs/board.php?bo_table=m101&sca=전북' onfocus='this.blur()' onmouseover=mus_on('mus2') onmouseout=mus_off('mus2') onclick=smenu_click('mus2')><img src='/assets/img/map2/m063.gif' alt='' border='0' name='mus2' class='list2' ></a><a href='./bbs/board.php?bo_table=m101&sca=경남' onfocus='this.blur()' onmouseover=mus_on('mus3') onmouseout=mus_off('mus3') onclick=smenu_click('mus3')><img src='/assets/img/map2/m055.gif' alt='' border='0' name='mus3' class='list3' ></a><a href='./bbs/board.php?bo_table=m101&sca=강원' onfocus='this.blur()' onmouseover=mus_on('mus4') onmouseout=mus_off('mus4') onclick=smenu_click('mus4')><img src='/assets/img/map2/m033.gif' alt='' border='0' name='mus4' class='list4' ></a><a href='./bbs/board.php?bo_table=m101&sca=충남' onfocus='this.blur()' onmouseover=mus_on('mus5') onmouseout=mus_off('mus5') onclick=smenu_click('mus5')><img src='/assets/img/map2/m041.gif' alt='' border='0' name='mus5' class='list5' ></a><a href='./bbs/board.php?bo_table=m101&sca=경기' onfocus='this.blur()' onmouseover=mus_on('mus6') onmouseout=mus_off('mus6') onclick=smenu_click('mus6')><img src='/assets/img/map2/m031.gif' alt='' border='0' name='mus6' class='list6' ></a><a href='./bbs/board.php?bo_table=m101&sca=충북' onfocus='this.blur()' onmouseover=mus_on('mus7') onmouseout=mus_off('mus7') onclick=smenu_click('mus7')><img src='/assets/img/map2/m043.gif' alt='' border='0' name='mus7' class='list7' ></a><a href='./bbs/board.php?bo_table=m101&sca=경북' onfocus='this.blur()' onmouseover=mus_on('mus8') onmouseout=mus_off('mus8') onclick=smenu_click('mus8')><img src='/assets/img/map2/m054.gif' alt='' border='0' name='mus8' class='list8' ></a><a href='./bbs/board.php?bo_table=m101&sca=제주' onfocus='this.blur()' onmouseover=mus_on('mus9') onmouseout=mus_off('mus9') onclick=smenu_click('mus9')><img src='/assets/img/map2/m064.gif' alt='' border='0' name='mus9' class='list9' ></a><a href='./bbs/board.php?bo_table=m101&sca=서울' onfocus='this.blur()' onmouseover=mus_on('mus10') onmouseout=mus_off('mus10') onclick=smenu_click('mus10')><img src='/assets/img/map2/m02.gif' alt='' border='0' name='mus10' class='list10' ></a><a href='./bbs/board.php?bo_table=m101&sca=인천' onfocus='this.blur()' onmouseover=mus_on('mus11') onmouseout=mus_off('mus11') onclick=smenu_click('mus11')><img src='/assets/img/map2/m032.gif' alt='' border='0' name='mus11' class='list11' ></a><a href='./bbs/board.php?bo_table=m101&sca=대전' onfocus='this.blur()' onmouseover=mus_on('mus12') onmouseout=mus_off('mus12') onclick=smenu_click('mus12')><img src='/assets/img/map2/m042.gif' alt='' border='0' name='mus12' class='list12' ></a><a href='./bbs/board.php?bo_table=m101&sca=광주' onfocus='this.blur()' onmouseover=mus_on('mus13') onmouseout=mus_off('mus13') onclick=smenu_click('mus13')><img src='/assets/img/map2/m062.gif' alt='' border='0' name='mus13' class='list13' ></a><a href='./bbs/board.php?bo_table=m101&sca=대구' onfocus='this.blur()' onmouseover=mus_on('mus14') onmouseout=mus_off('mus14') onclick=smenu_click('mus14')><img src='/assets/img/map2/m053.gif' alt='' border='0' name='mus14' class='list14' ></a><a href='./bbs/board.php?bo_table=m101&sca=울산' onfocus='this.blur()' onmouseover=mus_on('mus15') onmouseout=mus_off('mus15') onclick=smenu_click('mus15')><img src='/assets/img/map2/m052.gif' alt='' border='0' name='mus15' class='list15' ></a><a href='./bbs/board.php?bo_table=m101&sca=부산' onfocus='this.blur()' onmouseover=mus_on('mus16') onmouseout=mus_off('mus16') onclick=smenu_click('mus16')><img src='/assets/img/map2/m051.gif' alt='' border='0' name='mus16' class='list16' ></a> </div> </div> <div class="col-md-6" style="text-align: center;
 "> <div class="boardmap_container" style="background-color: #f2f2f2;
 padding: 20px;
 border-radius: 8px;
 display: inline-block;
 "> <div class="search_bar" > <input type="text" placeholder="지역을 검색해보세요" id="search_bar_input" style="margin-bottom: 10px;
 "> <button id="search_btn"> <img src="/assets/img/search.png" width="30px"> </button> </div> <div class="seachcity" style="margin-bottom: 10px;
 "></div> <div class="row"> <input type="hidden" name="rate" id="rate" value="0" style="margin-bottom: 10px;
 "> <div class="warning_msg" >별점을 선택해 주세요</div> <div class="star-rating"> <input type="radio" id="5-stars" name="rating" value="5" /> <label for="5-stars" class="star">&#9733;
 </label> <input type="radio" id="4-stars" name="rating" value="4" /> <label for="4-stars" class="star">&#9733;
 </label> <input type="radio" id="3-stars" name="rating" value="3" /> <label for="3-stars" class="star">&#9733;
 </label> <input type="radio" id="2-stars" name="rating" value="2" /> <label for="2-stars" class="star">&#9733;
 </label> <input type="radio" id="1-star" name="rating" value="1" /> <label for="1-star" class="star">&#9733;
 </label> </div> <div class="review_contents" style="margin-bottom: 10px;
 "> <div class="warning_msg_comment">5자 이상으로 작성해 주세요.</div> <textarea rows="10" class="review_textarea" style="width: 100%;
 "></textarea> </div> <div class="cmd"> <input type="button" name="save" id="save" value="등록"> </div> </div> </div> </div> </div> </div> </div> <script> let rating = new Rating();
    //별점 인스턴스 생성document.addEventListener('DOMContentLoaded', function(){
         //별점선택 이벤트 리스너 document.querySelector('.rating').addEventListener('click',function(e){
             let elem = e.target;
             if(elem.classList.contains('rate_radio')){
                 rating.setRate(parseInt(elem.value));
            }
        }
        ) 
    }
    );
     //상품평 작성 글자수 초과 체크 이벤트 리스너 document.querySelector('.review_textarea').addEventListener('keydown',function(){
         //리뷰 400자 초과 안되게 자동 자름 let review = document.querySelector('.review_textarea');
         let lengthCheckEx = /^.{
            400,
        }
        $/;
         if(lengthCheckEx.test(review.value)){
             //400자 초과 컷 review.value = review.value.substr(0,400);
        }
    }
    );
     //저장 전송전 필드 체크 이벤트 리스너 document.querySelector('#save').addEventListener('click', function(e){
         //별점 선택 안했으면 메시지 표시 if(rating.rate == 0){
             rating.showMessage('rate');
             return false;
        }
         //리뷰 5자 미만이면 메시지 표시 if(document.querySelector('.review_textarea').value.length < 5){
             rating.showMessage('review');
             return false;
        }
         //폼 서밋 
    }
    );
     function calculateAverageRating(ratings) {
         if (ratings.length === 0) {
             return 0;
             // 기본적으로 0 리턴 
        }
         const sum = ratings.reduce((total, rating) => total + rating, 0);
         const average = sum / ratings.length;
         // 별점들의 합을 평균으로 계산 const maxRating = 5;
         // 별점 최대값 const percentage = (average / maxRating) * 100;
         // 별점을 백분율로 변환 return percentage;
    }
     function submitReview() {
         const comment = document.getElementById('comment').value;
         if (comment.trim() !== '') {
             addComment(comment);
             document.getElementById('comment').value = '';
             // 입력 필드 초기화 
        }
    }
     // 후기 목록에 새로운 후기 추가 function addComment(comment) {
         const commentList = document.getElementById('commentList');
         const li = document.createElement('li');
         li.classList.add('comment');
         li.innerText = comment;
         commentList.appendChild(li);
    }
     // 별점 리스트 예시 (1에서 5까지의 값) const ratings = [3, 4, 5, 2, 4];
     // 별점 리스트를 기반으로 평균 백분율 계산 const averageRatingPercentage = calculateAverageRating(ratings);
     console.log('Average Rating Percentage:', averageRatingPercentage);
     </script> <script> mus1on = new Image( );
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
     function smenu_click(musName){
         cMuName=musName;
         document [musName].src = eval(musName + 'on.src');
    }
     window.onload = function() {
         for (i = 1;
         i < 17;
         i++) {
             if ('<%=request.getParameter("req")%>' == exx[i]) {
                 cMuName = 'mus' + i;
                 document[cMuName].src = eval(cMuName + 'on.src');
                 onclick = smenu_click(cMuName);
            }
        }
    }
     </script> </body> </html>