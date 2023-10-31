<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
a{
margin:auto;
text-align:center;
}
  .list0 { clear:both; position: relative; z-index: 1; top: -35px; left: -5px; } 
  .list1 { clear:both; position: absolute; z-index: 1; top: 260px; left: 20px; }
  .list2 { clear:both; position: absolute; z-index: 2; top: 215px; left: 52px; } 
  .list3 { clear:both; position: absolute; z-index: 3; top: 232px; left: 115px; } 
  .list4 { clear:both; position: absolute; z-index: 4; top: 050px; left: 88px; } 
  .list5 { clear:both; position: absolute; z-index: 5; top: 154px; left: 35px; } 
  .list6 { clear:both; position: absolute; z-index: 6; top: 074px; left: 63px; } 
  .list7 { clear:both; position: absolute; z-index: 7; top: 143px; left: 98px; } 
  .list8 { clear:both; position: absolute; z-index: 8; top: 147px; left: 128px; } 
  .list9 { clear:both; position: absolute; z-index: 9; top: 368px; left: 40px; } 
  .list10 { clear:both; position: absolute; z-index: 10; top: 112px; left: 72px; } 
  .list11 { clear:both; position: absolute; z-index: 11; top: 101px; left: 39px; } 
  .list12 { clear:both; position: absolute; z-index: 12; top: 192px; left: 96px; } 
  .list13 { clear:both; position: absolute; z-index: 13; top: 275px; left: 62px; } 
  .list14 { clear:both; position: absolute; z-index: 14; top: 223px; left: 157px; } 
  .list15 { clear:both; position: absolute; z-index: 15; top: 242px; left: 189px; } 
  .list16 { clear:both; position: absolute; z-index: 16; top: 263px; left: 179px; }
    .star-rating {
      border: solid 1px #ccc;
                  justify-content: flex-end; /* 별점을 오른쪽으로 이동 */
      
      display: flex;
      flex-direction: row-reverse;
      font-size: 1.5em;
      justify-content: space-around;
      padding: 0 .2em;
      text-align: center;
      width: 5em;
    }
/* 레이아웃 외곽 너비 400px 제한*/
.wrap{
    max-width: 480px;
    margin: 0 auto; /* 화면 가운데로 */
    background-color: #fff;
    height: 100%;
    padding: 20px;
    box-sizing: border-box;

}
.reviewform textarea{
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
}
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('./img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}

.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
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

    .star-rating label:hover,
    .star-rating label:hover ~ label {
      color: #fc0;
    }
  </style>
  
</head>
<body>

    <div class="row">
  		<div class="col-md-12 pb-6">
  			<a href='./bbs/board.php?bo_table=m101&sca=전남' onfocus='this.blur()' onmouseover=mus_on('mus1') onmouseout=mus_off('mus1') onclick=smenu_click('mus1')><img src='/assets/img/map/m061.gif' alt='' border='0' name='mus1' class='list1' ></a><a href='./bbs/board.php?bo_table=m101&sca=전북' onfocus='this.blur()' onmouseover=mus_on('mus2') onmouseout=mus_off('mus2') onclick=smenu_click('mus2')><img src='/assets/img/map/m063.gif' alt='' border='0' name='mus2' class='list2' ></a><a href='./bbs/board.php?bo_table=m101&sca=경남' onfocus='this.blur()' onmouseover=mus_on('mus3') onmouseout=mus_off('mus3') onclick=smenu_click('mus3')><img src='/assets/img/map/m055.gif' alt='' border='0' name='mus3' class='list3' ></a><a href='./bbs/board.php?bo_table=m101&sca=강원' onfocus='this.blur()' onmouseover=mus_on('mus4') onmouseout=mus_off('mus4') onclick=smenu_click('mus4')><img src='/assets/img/map/m033.gif' alt='' border='0' name='mus4' class='list4' ></a><a href='./bbs/board.php?bo_table=m101&sca=충남' onfocus='this.blur()' onmouseover=mus_on('mus5') onmouseout=mus_off('mus5') onclick=smenu_click('mus5')><img src='/assets/img/map/m041.gif' alt='' border='0' name='mus5' class='list5' ></a><a href='./bbs/board.php?bo_table=m101&sca=경기' onfocus='this.blur()' onmouseover=mus_on('mus6') onmouseout=mus_off('mus6') onclick=smenu_click('mus6')><img src='/assets/img/map/m031.gif' alt='' border='0' name='mus6' class='list6' ></a><a href='./bbs/board.php?bo_table=m101&sca=충북' onfocus='this.blur()' onmouseover=mus_on('mus7') onmouseout=mus_off('mus7') onclick=smenu_click('mus7')><img src='/assets/img/map/m043.gif' alt='' border='0' name='mus7' class='list7' ></a><a href='./bbs/board.php?bo_table=m101&sca=경북' onfocus='this.blur()' onmouseover=mus_on('mus8') onmouseout=mus_off('mus8') onclick=smenu_click('mus8')><img src='/assets/img/map/m054.gif' alt='' border='0' name='mus8' class='list8' ></a><a href='./bbs/board.php?bo_table=m101&sca=제주' onfocus='this.blur()' onmouseover=mus_on('mus9') onmouseout=mus_off('mus9') onclick=smenu_click('mus9')><img src='/assets/img/map/m064.gif' alt='' border='0' name='mus9' class='list9' ></a><a href='./bbs/board.php?bo_table=m101&sca=서울' onfocus='this.blur()' onmouseover=mus_on('mus10') onmouseout=mus_off('mus10') onclick=smenu_click('mus10')><img src='/assets/img/map/m02.gif' alt='' border='0' name='mus10' class='list10' ></a><a href='./bbs/board.php?bo_table=m101&sca=인천' onfocus='this.blur()' onmouseover=mus_on('mus11') onmouseout=mus_off('mus11') onclick=smenu_click('mus11')><img src='/assets/img/map/m032.gif' alt='' border='0' name='mus11' class='list11' ></a><a href='./bbs/board.php?bo_table=m101&sca=대전' onfocus='this.blur()' onmouseover=mus_on('mus12') onmouseout=mus_off('mus12') onclick=smenu_click('mus12')><img src='/assets/img/map/m042.gif' alt='' border='0' name='mus12' class='list12' ></a><a href='./bbs/board.php?bo_table=m101&sca=광주' onfocus='this.blur()' onmouseover=mus_on('mus13') onmouseout=mus_off('mus13') onclick=smenu_click('mus13')><img src='/assets/img/map/m062.gif' alt='' border='0' name='mus13' class='list13' ></a><a href='./bbs/board.php?bo_table=m101&sca=대구' onfocus='this.blur()' onmouseover=mus_on('mus14') onmouseout=mus_off('mus14') onclick=smenu_click('mus14')><img src='/assets/img/map/m053.gif' alt='' border='0' name='mus14' class='list14' ></a><a href='./bbs/board.php?bo_table=m101&sca=울산' onfocus='this.blur()' onmouseover=mus_on('mus15') onmouseout=mus_off('mus15') onclick=smenu_click('mus15')><img src='/assets/img/map/m052.gif' alt='' border='0' name='mus15' class='list15' ></a><a href='./bbs/board.php?bo_table=m101&sca=부산' onfocus='this.blur()' onmouseover=mus_on('mus16') onmouseout=mus_off('mus16') onclick=smenu_click('mus16')><img src='/assets/img/map/m051.gif' alt='' border='0' name='mus16' class='list16' ></a>        
		<div class="wrap" style=float:right;margin:auto;>
    		<h1>후기</h1>
    		<form name="reviewform" class="reviewform" method="post" action="/save" >
        		<input type="hidden" name="rate" id="rate" value="0"/>
        		<p class="title_star">별점과 리뷰를 남겨주세요.</p>
            	<div class="warning_msg">별점을 선택해 주세요.</div>
       			<div class="star-rating">
				    <input type="radio" id="5-stars" name="rating" value="5" />
				    <label for="5-stars" class="star">&#9733;</label>
				    <input type="radio" id="4-stars" name="rating" value="4" />
				    <label for="4-stars" class="star">&#9733;</label>
				    <input type="radio" id="3-stars" name="rating" value="3" />
				    <label for="3-stars" class="star">&#9733;</label>
				    <input type="radio" id="2-stars" name="rating" value="2" />
				    <label for="2-stars" class="star">&#9733;</label>
				    <input type="radio" id="1-star" name="rating" value="1" />
				    <label for="1-star" class="star">&#9733;</label>
 					</div>
		        <div class="review_contents">
		            <div class="warning_msg">5자 이상으로 작성해 주세요.</div>
		            <textarea rows="10" class="review_textarea"></textarea>
		        </div>   
	        <div class="cmd">
	            <input type="button" name="save" id="save" value="등록">
	        </div>
		    </form>
		</div>
		</div>
	</div>
  <script>
  
  let rating = new Rating();//별점 인스턴스 생성document.addEventListener('DOMContentLoaded', function(){
      //별점선택 이벤트 리스너
      document.querySelector('.rating').addEventListener('click',function(e){
          let elem = e.target;
          if(elem.classList.contains('rate_radio')){
              rating.setRate(parseInt(elem.value));
          }
      })
  });    //상품평 작성 글자수 초과 체크 이벤트 리스너
      document.querySelector('.review_textarea').addEventListener('keydown',function(){
          //리뷰 400자 초과 안되게 자동 자름
          let review = document.querySelector('.review_textarea');
          let lengthCheckEx = /^.{400,}$/;
          if(lengthCheckEx.test(review.value)){
              //400자 초과 컷
              review.value = review.value.substr(0,400);
          }
      });

      //저장 전송전 필드 체크 이벤트 리스너
      document.querySelector('#save').addEventListener('click', function(e){
          //별점 선택 안했으면 메시지 표시
          if(rating.rate == 0){
              rating.showMessage('rate');
              return false;
          }
          //리뷰 5자 미만이면 메시지 표시
          if(document.querySelector('.review_textarea').value.length < 5){
              rating.showMessage('review');
              return false;
          }
          //폼 서밋
      });

    function calculateAverageRating(ratings) {
      if (ratings.length === 0) {
        return 0; // 기본적으로 0 리턴
      }

      const sum = ratings.reduce((total, rating) => total + rating, 0);
      const average = sum / ratings.length; // 별점들의 합을 평균으로 계산
      const maxRating = 5; // 별점 최대값
      const percentage = (average / maxRating) * 100; // 별점을 백분율로 변환

      return percentage;
    }
    function submitReview() {
        const comment = document.getElementById('comment').value;
        if (comment.trim() !== '') {
            addComment(comment);
            document.getElementById('comment').value = ''; // 입력 필드 초기화
        }
    }

    // 후기 목록에 새로운 후기 추가
    function addComment(comment) {
        const commentList = document.getElementById('commentList');
        const li = document.createElement('li');
        li.classList.add('comment');
        li.innerText = comment;
        commentList.appendChild(li);
    }
    // 별점 리스트 예시 (1에서 5까지의 값)
    const ratings = [3, 4, 5, 2, 4];

    // 별점 리스트를 기반으로 평균 백분율 계산
    const averageRatingPercentage = calculateAverageRating(ratings);
    console.log('Average Rating Percentage:', averageRatingPercentage);
  </script>
  <script>
  //-----------------------------------------------------------------------------------------
  /* 메뉴를 늘이거나 줄일때 추가~삭제하세요. 쌍으로 구성되어있습니다. */
  mus1on  = new Image( );
  mus1off = new Image( );
  mus2on  = new Image( );
  mus2off = new Image( );
  mus3on  = new Image( );
  mus3off = new Image( );
  mus4on  = new Image( );
  mus4off = new Image( );
  mus5on  = new Image( );
  mus5off = new Image( );
  mus6on  = new Image( );
  mus6off = new Image( );
  mus7on  = new Image( );
  mus7off = new Image( );
  mus8on  = new Image( );
  mus8off = new Image( );
  mus9on  = new Image( );
  mus9off = new Image( );
  mus10on  = new Image( );
  mus10off = new Image( );
  mus11on  = new Image( );
  mus11off = new Image( );
  mus12on  = new Image( );
  mus12off = new Image( );
  mus13on  = new Image( );
  mus13off = new Image( );
  mus14on  = new Image( );
  mus14off = new Image( );
  mus15on  = new Image( );
  mus15off = new Image( );
  mus16on  = new Image( );
  mus16off = new Image( );
  /* 메뉴를 늘이거나 줄일때 추가~삭제하세요. 쌍으로 구성되어있습니다. */
  mus1off.src = '/assets/img/map/m061.gif';
  mus2off.src = '/assets/img/map/m063.gif';
  mus3off.src = '/assets/img/map/m055.gif';
  mus4off.src = '/assets/img/map/m033.gif';
  mus5off.src = '/assets/img/map/m041.gif';
  mus6off.src = '/assets/img/map/m031.gif';
  mus7off.src = '/assets/img/map/m043.gif';
  mus8off.src = '/assets/img/map/m054.gif';
  mus9off.src = '/assets/img/map/m064.gif';
  mus10off.src = '/assets/img/map/m02.gif';
  mus11off.src = '/assets/img/map/m032.gif';
  mus12off.src = '/assets/img/map/m042.gif';
  mus13off.src = '/assets/img/map/m062.gif';
  mus14off.src = '/assets/img/map/m053.gif';
  mus15off.src = '/assets/img/map/m052.gif';
  mus16off.src = '/assets/img/map/m051.gif';
  mus1on.src  = '/assets/img/map/m061o.gif';
  mus2on.src  = '/assets/img/map/m063o.gif';
  mus3on.src  = '/assets/img/map/m055o.gif';
  mus4on.src  = '/assets/img/map/m033o.gif';
  mus5on.src  = '/assets/img/map/m041o.gif';
  mus6on.src  = '/assets/img/map/m031o.gif';
  mus7on.src  = '/assets/img/map/m043o.gif';
  mus8on.src  = '/assets/img/map/m054o.gif';
  mus9on.src  = '/assets/img/map/m064o.gif';
  mus10on.src  = '/assets/img/map/m02o.gif';
  mus11on.src  = '/assets/img/map/m032o.gif';
  mus12on.src  = '/assets/img/map/m042o.gif';
  mus13on.src  = '/assets/img/map/m062o.gif';
  mus14on.src  = '/assets/img/map/m053o.gif';
  mus15on.src  = '/assets/img/map/m052o.gif';
  mus16on.src  = '/assets/img/map/m051o.gif';
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
    if(cMuName!=musName)
       document [musName].src = eval(musName + 'off.src');
  }
  
  function smenu_click(musName){
       cMuName=musName;
       document [musName].src = eval(musName + 'on.src');
  }
  
  //-----------------------------------------------------------------------------------------
  </script>
  
  <script>
  window.onload = function() {
     for (i = 1; i < 17; i++) {
       if ('<%=request.getParameter("req")%>' == exx[i]) {
         cMuName = 'mus' + i;
         document[cMuName].src = eval(cMuName + 'on.src');
         onclick = smenu_click(cMuName);
       }
     }
   }
  </script>
</body>
</html>