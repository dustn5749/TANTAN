<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="UTF-8">
<title>일정 목록 조회</title>
<style>
@font-face {
   font-family: 'Pretendard-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff')
      format('woff');
   font-weight: 400;
   font-style: normal;
}
.schedule_container {
	margin: 0 auto;
	text-align: center;
}
.schedule_container_inner{
	width: 700px;
}


input, button, div, span, h2, p, h5{
 font-family: 'Pretendard-Regular';
}

.mainItem {
   display: none;
}

.mainItem.active {
   display: block;
}

.sub.active {
   display: block;
}

ul>li {
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
   color: white !important;
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




/* Center the modal content horizontally */

.close {
   color: #aaa;
   float: right;
   font-size: 28px;
   font-weight: bold;
}

.close:hover, .close:focus {
   color: black;
   text-decoration: none;
   cursor: pointer;
}

.contents {
   text-align: center; /* 부모 요소를 가운데 정렬하는 스타일 */
}

/* 더보기 버튼 스타일 수정 */
#moreView {
   display: block;
   margin: 0 auto; /* 가운데 정렬을 위해 추가 */
   padding: 10px 20px;
   background-color: #3498db;
   color: #fff;
   text-decoration: none;
   border-radius: 4px;
   transition: background-color 0.3s ease;
}

#moreView:hover {
   background-color: #2980b9;
}

.btn-sm {
   padding: 0.2rem 0.5rem;
   font-size: 80%;
   border-radius: 0.2rem;
   width: 100px;
}

.button-container {
   text-align: center;
}
.card.box-shadow{
	height: 450px;
}
.schedule_detail {
	height: 130px;
	margin-top: 20px;
	margin-bottom: 20px;
}
.detail_btn_area {
	margin-top: 20px;
	height: 50px;
}
.detailBtn{
	background: white;
	border: none;
	width: 100px;
	height: 40px;
	border-radius: 7px;
}
.detailBtn:hover{
	background: black;
	color: white;
}

/* 페이징 처리 */
.nav_div {
	margin-top: 30px;
	margin-bottom: 30px;
	
}

.nav_div > a {
	font-size: 20px !important;
	cursor: pointer !important;
}
.nav_div > a:hover {
	color : red;
}
.nav_div  > strong {
	font-size: 24px !important;
	background-color: rgb(248, 248, 248);
}
.nav_div> a,strong {
	margin-left: 10px;
}
.col-md-3.mb-4{
	width: 300px;
	float: left;
}

</style>
</head>

<body>

   <div class="schedule_container">

         <div class="schedule_container_inner">
             <!-- Schedule Content -->
             <c:forEach var="schedule" items="${result.scheduleList}">
                  <div class="col-md-3 mb-4">
                      <div class="card box-shadow">
                          <div class="card-body p-4" tyle="border-radius: 30px;">
                              <div class="text-center" style="position: relative;">
                                <!-- Image Container -->
                                 <!-- Heart Icon -->
						        <svg id="heartIcon" class="heartIcon" viewBox="0 0 32 32"
								     aria-hidden="true" role="presentation" focusable="false"
								     data-schedule-num="${schedule.schedule_Num }"
								     style="position: absolute; top: 0; left: 0; fill: rgb(255, 0, 0); height: 24px; width: 24px; stroke: var(--f-mkcy-f); stroke-width: 2; overflow: visible;">
								    <path d="M16 28c7-4.73 14-10 14-17a6.98 6.98 0 0 0-7-7c-1.8 0-3.58.68-4.95 2.05L16 8.1l-2.05-2.05a6.98 6.98 0 0 0-9.9 0A6.98 6.98 0 0 0 2 11c0 7 7 12.27 14 17z"></path>
								</svg>
                                </a> 
                                <img src="/assets/img/local/${schedule.doe_img}" style="max-width: 100%; height: 200px; object-fit: cover;">
                                <input type="hidden" name="memberId" value="${schedule.member_id}">  
                                <input type="hidden" name="schedule_Num" value="${schedule.schedule_Num}">
                                   <div class="schedule_detail">
                                       <h5 class="fw-bolder">${schedule.title}</h5>
                                        <p>${schedule.member_id}</p>
                                        <p>지역:${schedule.doe_Name}</p>
                                        <p>여행시작:${schedule.start_Num != null ? schedule.start_Num : ""}</p>
                                        <p>여행끝:${schedule.end_Date != null ? schedule.end_Date : ""}</p>
	                                        <input type="hidden" name="regDate" value="${schedule.reg_Date != null ? schedule.reg_Date : ""}">
	                                        <input type="hidden" value="${schedule.schedule_Num}" class="schedule_num">
                                    </div>
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                       <div class="detail_btn_area">
                                            <input type="button" value="상세보기" class="detailBtn">
                                        </div>
                                     </div>
                                </div>
                             </div>
                          </div>
                      </div>
                  </c:forEach>
            </div>


         <form name="pageForm" id="pageForm" action="/schedule/list"
            method="post">
            <input type="hidden" name="pageNo" id="pageNo"
               value="${result.schedule.pageNo}">
            <%--<input type="hidden" id="pageNo2" name="pageNo" value="${result.schedule.pageNo}">--%>
         </form>
      </div>

 
         <!-- 페이징 처리 -->
<%--          <div class="nav_div" style="text-align: center; margin-top: 10px;">
            <c:if test="${result.schedule.navStart != 1}">
               <a href="#" onclick="jsPageNo(${result.schedule.navStart-1})"
                  class="pageArrow">&lt;</a>
            </c:if>


            <c:forEach var="item" begin="${result.schedule.navStart}"
               end="${result.schedule.navEnd}">
               <c:choose>
                  <c:when test="${result.schedule.pageNo != item}">
                     <a href="#" onclick="jsPageNo(${item})" class="pageNum">${item}</a>
                  </c:when>
                  <c:otherwise>
                     <strong>${item}</strong>
                  </c:otherwise>
               </c:choose>
            </c:forEach>


            <c:if test="${result.schedule.navEnd != result.schedule.totalPageSize}">
               <a href="#" onclick="jsPageNo(${result.schedule.navEnd+1})"
                  class="pageArrow">&gt;</a>
            </c:if>
 	 </div>
 --%>


   <script>
    function jsPageNo(pageNo) {
       console.log("pageNo" + pageNo);
        document.getElementById("pageNo").value = pageNo;
        document.getElementById("pageForm").submit();
    }

   function loadMoreData(start) {
    var member_Id = "member_id"; 
    var doe_Name = "doe_name"; 
    var schedule_Num = "schedule_num"; 
    var end_Date = "end_date";
    var reg_Date = "reg_date"; 

    $.ajax({
        type: "POST",
        url: "/schedule/list",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
            start: start,
            member_id: member_Id,
            doe_Name: doe_Name,
            schedule_Num: schedule_Num,
            end_Date: end_Date,
            reg_Date: reg_Date
        }),
        success: function (response) {
        },
        error: function (xhr, textStatus, errorThrown) {
            console.error("AJAX 요청 중 오류 발생:", textStatus, errorThrown);
        }
    });
}
            function moveToSelectedRegion() {
                window.location.href = '/schedule/list';
            }

            $(document).ready(function () {
                $('.heartIcon').click(function () {
                    var scheduleNum = $(this).data('schedule-num');
                    var heartIcon = $(this);
                    var currentColor = heartIcon.css('fill');
                    
                    console.log(scheduleNum)
                    var isLike = true;
                    if (currentColor == ('rgb(255, 0, 0)')) {   // 하트가 빨간색이면 (좋아요가 눌려있으면)
                       heartIcon.css('fill', 'rgba(0, 0, 0, 0.5)');   // 좋아요 취소
                       isLike = false;
                       
                       var scheduleContainer = heartIcon.closest('.schedule_container_inner');
                       heartIcon.closest('.col-md-3.mb-4').remove();

                    } else {
                       heartIcon.css('fill', 'rgb(255, 0, 0');
                       
                    }
                    
                    $.ajax({
                        url: '/schedule/updateHeartColor',
                        method: 'POST',
                        data: { scheduleNum: scheduleNum, isLike: isLike},
                        success: function (response) {
                            
                        },
                        error: function () {
                            console.error('Error during AJAX request.');
                        }
                    });
                });

              
                function jsPageNo(pageNo) {
                    document.getElementById("pageNo").value = pageNo;
                    document.getElementById("pageForm").submit();
                }

                
                //일정목록으로 이동 
                document.querySelector(".us_btn").addEventListener("click", function () {
                    location.href = "/us/list";
                });

                
                //상세보기
                $(".detailBtn").on("click", function (e) {
                    console.log("상세보기");

                    const schedule_num_element = e.currentTarget.closest(".card").querySelector(".schedule_num");

                    if (schedule_num_element) {
                        const schedule_num = schedule_num_element.value;

                        if (schedule_num.trim() !== "") {
                            console.log("Redirecting to: /detail?schedule_Num=" + schedule_num);
                            location.href = "/schedule/detail?schedule_Num=" + schedule_num;
                        } else {
                            console.error("schedule_num이 비어 있습니다.");
                        }
                    } else {
                        console.error("schedule_num 요소를 찾을 수 없습니다.");
                    }
                });
                
                // 지역 필터
                $('.location-filter').on('click', function() {
                    var modal = document.getElementById("myModal");
                    modal.style.display = "block";
                });
            });

   function moveRegion() {
      var value = $('[name=deo_name]:checked').val();
      
      if (value == 'all') {
         location.href = '/schedule/list';
      } else {
         location.href = '/schedule/list?doe_Name=' + value;
      }
   }
   
   function order(orderName) {
      location.href = '/schedule/list?order=' + orderName;
   }

</script>
</body>
</html>