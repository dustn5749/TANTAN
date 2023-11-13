<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="UTF-8">
<title>일정 목록 조회</title>
<style>

@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
   .us_container{
      width: 80%;
      margin: 0 auto;
      padding: 3%;
   }
    
    
    .us_header_size{
    float: right;
    width: 27%;
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
/*        padding: 0px 0px 20px;
       background-color: rgb(255, 255, 255); */
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
    color: black;
    border-radius: 20px;
    transition: color 0.1s ease-out 0.4s;
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
    background-color: black;
    color : white;
   }
   .us_fillter {
       PADDING: 10PX; 
   }
 .fillter_btn_area {
   position: relative;
   left: -820px; 
   width: 78%;
}
   .fillter_btn {
      width: 80px;
      height: 40px;
      border-radius: 10px;
      background-color: black;
      color: white;
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
     .us_btn:hover {
     	background-color: black !important;
     	color : white !important;
     }
     
     .py-5 {
     padding: 10px;
     
     }
 .schedule_container {
        width: 94%; 
        margin: 0 auto; 
    }
    
      #korea {
            display: none; 
        }
     
   /* 일정 상세보기 버튼 */
   .detailButton {
   		background: white;
   		width: 120px;
   		height: 45px;
   		border: none;
   		border-radius: 8px;
   		font-family: 'Pretendard-Regular' !important;
   		
   }
   .detailButton:hover {
   		background: black;
   		color:white;
   }
	.schedule_container > input, button, p, span, div, ul, li {
   		font-family: 'Pretendard-Regular' !important;		
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
    </div>

    <div class="us_fillter">
        <div class="us_header_size">
            <ul>
                <button class="city_btn" onclick="toggleCityFilter()">지역</button>
            </ul>
            <div class="city_fillter" id="koreanCities" style="display: none;">
                <ul>
                    <li>서울</li>
                    <li>강원도</li>
                    <li>제주</li>
                    <li>부산</li>
                    <li>경기도</li>
                    <li>충청도</li>
                    <li>경상도</li>
                    <li>전라도</li>
                    <li>울릉도</li>
                </ul>
            </div>
            <button class="city_btn1" onclick="window.location.href ='write'" style="cursor: pointer; position: relative; display: inline-flex; align-items: center; justify-content: center; box-sizing: border-box; width: auto; height: 40px; margin-right: 15px; margin-left: 0; padding: 0px; background: rgb(255, 255, 255); border: 1px solid rgb(233, 233, 233); border-radius: 10px;">글쓰기</button>
        </div>
        <div class="fillter_btn_area" style="display: flex; justify-content: flex-end;">
            <button class="fillter_btn">댓글순</button>
            <button class="fillter_btn">조회순</button>
            <button class="fillter_btn">인기순</button>
        </div>
      <div class="container">
   
   
    <div class="row">
        <c:forEach var="schedule" items="${result.scheduleList}">
            <div class="col-md-3 mb-4">
                <div class="card box-shadow">
                    <div class="card-body p-4">
                        <div class="text-center">
                            <h5 class="fw-bolder">${schedule.member_Id}</h5>
                            <p>${schedule.schedule_Num}</p>
                            <p>${schedule.doe_Name}</p>
                               <p>${schedule.start_Num != null ? schedule.start_Num : ""}</p>
                                <p>${schedule.end_Date != null ? schedule.end_Date : ""}</p>
                            <p>${schedule.reg_Date != null ? schedule.reg_Date : ""}</p>
                            <p>${schedule.memo != null ? schedule.memo : ""}</p>
                           <button value="${result.list[item].schedule_Num}" class="detailButton">상세보기 </button>
                     </div>
                     </div>
                   </div>
            </div>
        </c:forEach>
    </div>
</div>
      

   <form id="mForm" action="/schedule/list/method" method="POST">
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
</div>
</div>
<script>
function jsPageNo(pageNo) {
    document.getElementById("pageNo").value = pageNo;
    document.getElementById("mForm").submit();
}

document.querySelector(".us_btn").addEventListener("click", function () {
	location.href="/us/list";
}
)
// function toggleCityFilter() {
//     var filter = document.querySelector('.city_fillter_inner');
//     filter.style.display = filter.style.display === 'none' ? 'block' : 'none';
// }

// function toggleKorea() {
//     var koreaList = document.querySelector('.sub');
//     koreaList.style.display = koreaList.style.display === 'none' ? 'block' : 'none';
// }
// 		document.querySelector(".city_btn").addEventListener("click", function () {
//     		console.log("click");

//    		 document.querySelector(".mainItem").style.display="flex";
//   		});

// 		document.querySelector(".mainTxt").addEventListener("click", function () {
//     		console.log("click");

//     	document.querySelector(".sub").classList.toggle("active");
//   			});

   

document.addEventListener('DOMContentLoaded', function() {
  const createCompanionButton = document.getElementById('createCompanionButton');

  createCompanionButton.addEventListener('click', function() {
    window.location.href = "detail"; 
  });
});

// document.addEventListener("DOMContentLoaded", function() {
// 	  const selectRegion = document.querySelector('.select-region');
// 	  const koreaButton = document.querySelector('.sc-9280f9a9-0');

// 	  selectRegion.addEventListener('click', function() {
// 	    koreaButton.style.display = 'block';
// 	  });
// 	});

// document.addEventListener('DOMContentLoaded', function() {
// 	  const buttons = document.querySelectorAll('.sc-9280f9a9-0.gpXqPI');

// 	  buttons.forEach(button => {
// 	    button.addEventListener('click', function() {
// 	      const region = this.textContent.trim(); // 클릭한 버튼의 텍스트 가져오기
// 	      const selectedRegion = document.querySelector('.selected-region');
// 	      selectedRegion.textContent = region; // 오른쪽 박스에 텍스트 추가
// 	    });
// 	  });
// 	});
	
// document.addEventListener('DOMContentLoaded', function() {
//     const selectRegion = document.querySelector('.select-region');
//     const regionList = document.querySelector('.region-list');

//     selectRegion.addEventListener('click', function() {
//         regionList.classList.toggle('hidden');
//     });

//     // 각 지역 클릭 시 이벤트
//     const regions = document.querySelectorAll('.region');
//     regions.forEach(region => {
//         region.addEventListener('click', function() {
//             const selectedRegion = this.textContent;
//             // 선택된 지역에 따른 도와 시 정보 표시
//             // 예를 들어, 선택된 지역을 가져와 API 호출 또는 저장된 데이터를 통해 정보를 업데이트할 수 있습니다.
//             displaySelectedLocationInfo(selectedRegion);
//             regionList.classList.add('hidden'); // 선택 시 목록 숨김
//         });
        
        
//     });
// });


</script>
      </div>
    </div>
</body>
</html>

