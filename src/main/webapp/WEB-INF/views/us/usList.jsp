<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
<title>동행 목록조회</title>
<style>
   .us_container{
         width: 94%; 
        margin: 0 auto; 
   }
    .content{
    padding : 4%;
    }
    .us_header_size{
     float: right;
/*     width: 237px; */
    top: 80px;
    height: fit-content;
    background-color: rgb(255, 255, 255);
    display: flex;
}
      }
   .us_header {
      position: sticky;
       z-index: 9;
       top: 80px;
       height: fit-content;
       background-color: rgb(255, 255, 255);
       transition: all 0.1s ease-in-out 0.3s;
   }
   .us_header2 {
       background-color: rgb(255, 255, 255);
   }
   .us_header3 {
      display: flex;
       -webkit-box-pack: center;
       justify-content: center;
       -webkit-box-align: center;
       align-items: center;
       position: sticky;
       z-index: 9;
       top: 80px;
       width: 100%;
       height: 44px;
       margin-top: 20px;
       padding: 0px 0px 20px;
       background-color: rgb(255, 255, 255);
   }
   .us_header4 {
   z-index: 9;
    box-sizing: border-box;
    width: 260px;
    height: 38px;
    padding: 0px 18px;
    background: rgba(0, 0, 0, 0);
   }   
   
   .us_header5{
   position: relative;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    box-sizing: border-box;
    width: 100%;
    height: 100%;
    padding: 6px;
    background-color: rgb(248, 248, 248);
    border-radius: 50px;
   }
   .us_header6 {
       position: relative;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    box-sizing: border-box;
    width: 100%;
    height: 100%;
    border-radius: 50px;
   
   }
   .us_inner {
       position: absolute;
    left: 0px;
    width: 50%;
    height: 34px;
    background-color: rgb(37, 37, 37);
    border-radius: 20px;
    box-shadow: rgba(0, 0, 0, 0.2) 0px 4px 6px 0px;
   }
   .us_btn{
     position: relative;
    box-sizing: border-box;
    width: 50%;
    height: 34px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    font-size: 15px;
    font-weight: 500;
    color: rgb(255, 255, 255);
    border-radius: 20px;
    transition: color 0.1s ease-out 0.4s;
    background-color: black;
    color: white;
   }
   .us_img {
       width: 16px;
    height: 16px;
    margin-right: 4px;
   }
   .schedule_btn{
       position: relative;
    box-sizing: border-box;
    width: 50%;
    height: 34px;
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    font-size: 15px;
    font-weight: 500;
    color: rgb(106, 106, 106);
    border-radius: 20px;
    transition: color 0.1s ease-out 0.4s;

   }
   /* 동행 생성하기 버튼 div */
   .make_us {
   		display: flex;
   		float: right;
   		width: 90%;
   }
   .make_us > button {
   		width: 150px;
   		height: 35px;
   		background-color: rgb(81, 174, 255);
   		border-radius: 7px;
   }
   .us_fillter {
   	margin: 0 auto;
   	width: 1260px;
   }
   .fillter_btn_area {
   	  display: flex;
      width: 300px;
/*       magin:100px; */
   }
   .fillter_btn {
      width: 80px;
      height: 40px;
      border-radius: 10px;
      background-color: black;
      color: white;
   }
   .fillter_btn +.fillter_btn  {
   	margin: 0 10px;
   }
   .fillter_btn:hover {
      background-color: white;
      color : black;
   }

.city_btn {
    cursor: pointer;
    position: relative;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    width: 80px !important;
    height: 40px;
    margin-right: 15px;
    margin-left: 0; 
    padding: 8px 14px;
    background: #0099ff;
    border: 1px solid rgb(233, 233, 233);
    border-radius: 10px;
}
.city_btn1 {
    cursor: pointer;
    position: relative;
    display: inline-flex; 
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    width: 80px !important;
    height: 40px;
    margin-right: 15px;
    margin-left: 0; 
     padding: 0px; 
    background: #0099ff;
    border: 1px solid rgb(233, 233, 233);
    border-radius: 10px;
}
   .city_fillter_inner {
       display: flex;
      
   }
       .mainItem {
      display : none;
      }
      .mainItem.active {
         display : block;
      }
      .sub.active {
        display: block;
      }
      ul > li {
         list-style: none;
      }
      .ehUQiC {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    width: 100%;
    height: 32px;
    margin: 108px 0px 140px;
    padding: 0px;
}
.bPLlTV {
    cursor: pointer;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    margin: 0px 5px;
    font-size: 16px;
    color: rgb(0, 0, 0);
    background-color: rgb(255, 255, 255);
}
.fcPuDF {
    cursor: pointer;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    width: 38px;
    height: 38px;
    margin: 0px 5px;
    padding-right: 0px;
    padding-left: 2px;
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(238, 238, 238);
    border-radius: 50px;
}.bPLlTV {
    cursor: pointer;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    margin: 0px 5px;
    font-size: 16px;
    color: rgb(0, 0, 0);
    background-color: rgb(255, 255, 255);
}
.fcPuDF {
    cursor: pointer;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    width: 38px;
    height: 38px;
    margin: 0px 5px;
    padding-right: 0px;
    padding-left: 2px;
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(238, 238, 238);
    border-radius: 50px;
}
.ekMLCz {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    width: auto;
    height: 32px;
    margin: 0px 10px;
}

.fdmLWW {
    cursor: pointer;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    width: 38px;
    height: 38px;
    margin: 0px 5px;
    padding-right: 1px;
    padding-left: 0px;
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(238, 238, 238);
    border-radius: 50px;
}
    .mainTxt {
            position: relative;
        }
   .sub {
            position: absolute;
            index: 1;
            left: 0;
            bottom: 0;
            display: none;
            list-style: none;
        }
     .schedule_btn {
     		cursor: pointer !important;
     }
     .schedule_btn:hover {
     		background-color: black !important;
     		color : white !important;
     }
     .py-5 {
     		padding: 10px;
     }
	 .schedule_container {
        width: 70%; 
        margin: 0 auto; 
    }
	ul > li {
	position:relative;
	}
	ul. {
	position: abd
	}
	
	
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

/* 사용자 정의 스타일 */
.dropdown-menu {
    background-color: #f8f9fa; /* 배경색 */
    border: none; /* 기본 테두리 제거 */
    width: auto; /* 필요에 따라 너비 조절 */
}

.dropdown-menu .nav-ul {
    list-style: none;
    padding: 0;
}

.dropdown-menu .nav-li {
    padding: 8px 20px;
}

.dropdown-menu .nav-li a {
    text-decoration: none;
    color: #333; /* 텍스트 색상 */
    display: block;
}

.dropdown-menu .nav-li a:hover {
    background-color: #cce5ff; /* 호버 색상 */
    color: #0069d9; /* 호버 텍스트 색상 */
}

</style>
</head>

<body>
<div class="schedule_container">
    <div class="us_header">
        <div class="us_header2"></div>
        <div class="us_header3">
            <div class="us_header4">
                <div class="us_header5">
                    <div class="us_header6">
                        <div class="us_inner" style="left: 0%;"></div>
                        <button class="us_btn">
                            <img src="/assets/img/women_holding_hands.png" alt="동행" class="us_img">동행
                        </button>
                        <button class="schedule_btn">
                            <img src="/assets/img/answer2_img02.png" alt="일정" class="us_img">일정
    
                        </button>
                    </div>
                </div>
            </div>
        </div>


<div class="container mt-5">
    <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            한국
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <ul class="nav-ul" id="koreaList">
                <li class="nav-li"><a href="javascript:void(0);">서울</a></li>
                <li class="nav-li"><a href="javascript:void(0);">부산</a></li>
                <li class="nav-li"><a href="javascript:void(0);">제주</a></li>
            </ul>
        </div>
    </div>
</div>
    
    <div class="city_btn_wrap" style="text-align: right;">
<button class="city_btn1" onclick="city_btn1()" style="cursor: pointer;">글쓰기</button>
        </div>
        
        <div class="fillter_btn_area" style="display: flex; justify-content: flex-end;">
            <button class="fillter_btn">댓글순</button>
            <button class="fillter_btn">조회순</button>
            <button class="fillter_btn">인기순</button>
        </div>
        
  <div class="row">
    <c:forEach var="item" begin="0" end="19"> 
        <div class="col-md-3 mb-4">
            <div class="card box-shadow">
                <div class="card-body p-4">
                    <div class="text-center">
                        <h5 class="fw-bolder">${result.list[item].title}</h5>
                        <p>${result.list[item].writer}</p>
                        <p>${result.list[item].regdate}</p>
                        <p>${result.list[item].start_Date}</p>
                        <p>${result.list[item].end_Date}</p>
                        <p>${result.list[item].us_cnt}</p>
                       <p id="us_num2">${result.list[item].us_num}</p>
                    </div>
                </div>
                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                    <div class="text-center">
                        <input type="button" value="상세보기" class="btn btn-outline-dark mt-auto" id="detailButton">
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

       		 
        </div>
<form id="mForm" action="/us/list" method="POST">
    <input type="hidden" id="pageNo" name="pageNo" value="" />
</form>

<div class="sc-73e2cff1-0 ehUQiC">
    <button disabled="" class="sc-73e2cff1-1 fcWStM">
        <!-- 이전 버튼 SVG 아이콘 -->
        <svg width="10" height="16" viewBox="0 0 10 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="cursor: pointer;">
            <path d="M8 2L2 8L8 14" stroke="#DBDBDB" stroke-width="2" stroke-linecap="square"></path>
        </svg>
    </button>
    <button disabled="" class="sc-73e2cff1-1 fdmLWW">
        <!-- 다음 버튼 SVG 아이콘 -->
        <svg width="10" height="16" viewBox="0 0 10 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="cursor: pointer;">
            <path d="M8 2L2 8L8 14" stroke="#DBDBDB" stroke-width="2" stroke-linecap="square"></path>
        </svg>
    </button>

    <!-- 페이지 이동 -->
    <div class="sc-73e2cff1-2 ekMLCz">
        <button class="sc-73e2cff1-3 bwuLmH" onclick="jsPageNo(1)">1</button>
        <button class="sc-73e2cff1-3 bPLlTV" onclick="jsPageNo(2)">2</button>
        <button class="sc-73e2cff1-3 bPLlTV" onclick="jsPageNo(3)">3</button>
        <button class="sc-73e2cff1-3 bPLlTV" onclick="jsPageNo(4)">4</button>
        <button class="sc-73e2cff1-3 bPLlTV" onclick="jsPageNo(5)">5</button>
    </div>
</div>

<script>
function city_btn1() {
    window.location.href = '/us/write';
}

    function jsPageNo(pageNo) {
        document.getElementById("pageNo").value = pageNo;
        document.getElementById("mForm").submit();
    }

    document.addEventListener("DOMContentLoaded", function() {
        var scheduleBtn = document.querySelector(".schedule_btn");

        if (scheduleBtn) {
            scheduleBtn.addEventListener("click", function(event) {
                location.href = "/schedule/list";
            });
        }
    });

  
    	document.getElementById('detailButton').addEventListener('click', function() {
    	    const us_num2Element = document.getElementById('us_num2');
    	    const us_num = us_num2Element.innerText;
    	    console.log("us_num" + us_num);
    	    const param = {
    	        us_num: us_num
    	    };
    	    console.log("param" + param);
    	    fetch("/us/Detail", {
    	            method: "POST",
    	            headers: {
    	                "Content-Type": "application/json; charset=UTF-8",
    	            },
    	            body: JSON.stringify(param)
    	        })
    	        .then(response => response.json())
    	        .then(json => {
    	         
    	        	location.href = "/us/Detail"; 
    	        })
    	        .catch(error => {
    	            console.error("오류 발생:", error);
    	        });
    	});

    
</script> 

</body>
</html>