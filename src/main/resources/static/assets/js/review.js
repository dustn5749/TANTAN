  // 평점클릭 이벤트 
/*	  $(".row .star-rating input").on("click", function() {
	    var score = $(".row .star-rating input:checked").val();
	    $("#rate").val(score);
	});*/
  

  
  function insertReview(){
	  var doe_name = $("#img_title").text();
	  
  }
   // 평점 등록하기
		$("#save").on("click", function(){
		    var doe_name = $("#img_title").text();
		    var score = $(".row .star-rating input:checked").val();
		    
			//  var content = $(".review_textarea").val();
		    
		    if(doe_name == ""){
		        alert("지역을 먼저 선택해주세요");
		        if(content == ""){
		            alert("리뷰 내용을 입력해주세요");
		        } else {
		            var param = {
		                doe_name: doe_name,
		                score: score,
		                content: content
		            };
		
		            $.ajax({
		                url: "/review/insert",
		                contentType: "application/json; charset=UTF-8",
		                data: JSON.stringify(param),
		                dataType: "json",
		                success: function(data){
		                 
		                }
		            });
		        }
		    }
		});


  
  
  
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
     	        '강원': '/assets/img/doereview/Gandwon.jpg',
     	        '충남': '/assets/img/doereview/chungnam.jpg',
     	        '경기': '/assets/img/doereview/Gyeonggi.jpg',
     	        '충북': '/assets/img/doereview/Chungbok.jpg',
     	        '제주': '/assets/img/doereview/jeju.jpg',
     	        '서울': '/assets/img/doereview/Seoul.jpg',
     	        '인천': '/assets/img/doereview/Inchon.jpg',
     	        '대전': '/assets/img/doereview/Daejeon.jpg',
     	        '광주': '/assets/img/doereview/Gwangju.jpg',
     	        '대구': '/assets/img/doereview/Daegu.jpg',
     	        '울산': '/assets/img/doereview/Ulsan.jpg',
     	        '부산': '/assets/img/doereview/Busan.jpg',
     	        '경북': '/assets/img/doereview/Gyeongbuk.jpg'
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
     	            $(".avlStar .star-rating input[value='" + average + "']").prop("checked", true);
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
     
	