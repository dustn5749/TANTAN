<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .us_container{
      width: 80%;
      margin: 0 auto;
      padding: 5%;
   }
    
    .content{
    padding : 4%;
    
    }
    .us_header_size{
     float: right;
/*     width: 300px;
 */    top: 80px;
    height: fit-content;
    background-color: rgb(255, 255, 255);
    display: flex;
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
   	width: 80%;
   }
   .fillter_btn_area {
   	  display: flex;
      width: 300px;
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
    width:100px !important;
    height: 40px;
    margin-right: 15px;
    margin-left: 0; 
    padding: 8px 14px;
    background: #0099ff;
    border: 1px solid rgb(233, 233, 233);
    border-radius: 10px;
}
	.right_btn_ul {
		position: relative;
		display: flex;
	}
	
	 .right_btn_li  {
		margin: 0 auto;
	}
	. right_btn_li >button {
		width: 150px !important;
	}
.city_btn1 {
    cursor: pointer;
    position: relative;
    display: inline-flex; 
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    width: 100px !important;
    height: 40px;
    margin-right: 15px;
    margin-left: 0; 
    padding: 8px 14px;
    border: 1px solid rgb(233, 233, 233);
    border-radius: 10px;
}

	button:hover {
		font-weight: bold;
		
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
        width: 94%; 
        margin: 0 auto; 
    }
 

	ul. {
	position: abd
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
                    <button class="schedule_btn" >
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
	  	     <li>
	  	     	<ul>
	  	     	<li><button class="city_btn" onclick="toggleCityFilter()">지역</button>
	  	     		<ul>
	  	     			<li>
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
	  	     			</li>
	  	     		</ul>
	  	     	</li>
	  	     	<li>
	  	     		<button class="city_btn1" onclick="window.location.href = 'detail'" style="cursor: pointer; position: relative; display: inline-flex; 			align-items: center; justify-content: center; box-sizing: border-box; width: auto; height: 40px; margin-right: 15px; margin-left: 0; 			padding: 8px 14px; background: rgb(255, 255, 255); border: 1px solid rgb(233, 233, 233); border-radius: 10px;">글쓰기</button>
	  	     	</li>
	  	     	</ul>
	  	     	</li>
	       </ul>
	    </div>


        <div class="fillter_btn_area" style="display: flex; justify-content: flex-end;">
            <button class="fillter_btn">댓글순</button>
            <button class="fillter_btn">조회순</button>
            <button class="fillter_btn">인기순</button>
        </div>
    </div>
        <section>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $40.00 - $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="hang">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="hang">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="hang">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="hang">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="hang">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $120.00 - $280.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="hang">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="hang">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="hang">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
   
   
   
<div class="sc-73e2cff1-0 ehUQiC">
	<button disabled="" class="sc-73e2cff1-1 fcWStM">
		<svg width="10" height="16" viewBox="0 0 10 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="cursor: pointer;">
				<path d="M8 2L2 8L8 14" stroke="#DBDBDB" stroke-width="2" stroke-linecap="square"></path>
		</svg>
	<svg width="10" height="16" viewBox="0 0 10 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="cursor: pointer;">
			<path d="M8 2L2 8L8 14" stroke="#DBDBDB" stroke-width="2" stroke-linecap="square"></path>
	</svg>
</button>
		<button disabled="" class="sc-73e2cff1-1 fdmLWW">
			<svg width="10" height="16" viewBox="0 0 10 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="cursor: pointer;">
		<path d="M8 2L2 8L8 14" stroke="#DBDBDB" stroke-width="2" stroke-linecap="square"></path>
	</svg>
</button>

<div class="sc-73e2cff1-2 ekMLCz">
	<button class="sc-73e2cff1-3 bwuLmH">1</button>
	<button class="sc-73e2cff1-3 bPLlTV">2</button>
	<button class="sc-73e2cff1-3 bPLlTV">3</button>
	<button class="sc-73e2cff1-3 bPLlTV">4</button>
	<button class="sc-73e2cff1-3 bPLlTV">5</button>
</div>
	<button class="sc-73e2cff1-1 fcPuDF">
		<svg width="10" height="16" viewBox="0 0 10 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="cursor: pointer;">
			<path d="M2 2L8 8L2 14" stroke="#00CE7C" stroke-width="2" stroke-linecap="square"></path>
		</svg>
</button>

<button class="sc-73e2cff1-1 fcPuDE">
	<svg width="10" height="16" viewBox="0 0 10 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="cursor: pointer;">
		<path d="M2 2L8 8L2 14" stroke="#00CE7C" stroke-width="2" stroke-linecap="square"></path>
	</svg>
	<svg width="10" height="16" viewBox="0 0 10 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="cursor: pointer;">
		<path d="M2 2L8 8L2 14" stroke="#00CE7C" stroke-width="2" stroke-linecap="square"></path>
	</svg>
</button>
</div>
</div>

</div>

<script>

function toggleCountry() {
    var koreaDiv = document.getElementById("korea");
    koreaDiv.innerHTML = "한국";
}


function toggleCityFilter() {
    var korea = document.getElementById("korea");
    if (korea.style.display === "none") {
        korea.style.display = "block"; // 보이도록 설정
    } else {
        korea.style.display = "none"; // 감추도록 설정
    }
}
</script>

<script>
document.querySelector(".schedule_btn").addEventListener("click", function () {
    location.href = "/board/schedule";
});
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 이 부분에 버튼 클릭 시의 작업 등을 정의
});


// 일정이동 버튼
document.querySelector(".schedule_btn").addEventListener("click", function () {
	location.href="/board/schedule";
}

)
function toggleCityFilter() {
    var filter = document.querySelector('.city_fillter_inner');
    filter.style.display = filter.style.display === 'none' ? 'block' : 'none';
}

function toggleKorea() {
    var koreaList = document.querySelector('.sub');
    koreaList.style.display = koreaList.style.display === 'none' ? 'block' : 'none';
}
		document.querySelector(".city_btn").addEventListener("click", function () {
    		console.log("click");

   		 document.querySelector(".mainItem").style.display="flex";
  		});

		document.querySelector(".mainTxt").addEventListener("click", function () {
    		console.log("click");

    	document.querySelector(".sub").classList.toggle("active");
  			});

   

document.addEventListener('DOMContentLoaded', function() {
  const createCompanionButton = document.getElementById('createCompanionButton');

  createCompanionButton.addEventListener('click', function() {
    window.location.href = "boardDetail.jsp"; 
  });
});

document.addEventListener("DOMContentLoaded", function() {
	  const selectRegion = document.querySelector('.select-region');
	  const koreaButton = document.querySelector('.sc-9280f9a9-0');

	  selectRegion.addEventListener('click', function() {
	    koreaButton.style.display = 'block';
	  });
	});

document.addEventListener('DOMContentLoaded', function() {
	  const buttons = document.querySelectorAll('.sc-9280f9a9-0.gpXqPI');

	  buttons.forEach(button => {
	    button.addEventListener('click', function() {
	      const region = this.textContent.trim(); // 클릭한 버튼의 텍스트 가져오기
	      const selectedRegion = document.querySelector('.selected-region');
	      selectedRegion.textContent = region; // 오른쪽 박스에 텍스트 추가
	    });
	  });
	});
	
document.addEventListener('DOMContentLoaded', function() {
    const selectRegion = document.querySelector('.select-region');
    const regionList = document.querySelector('.region-list');

    selectRegion.addEventListener('click', function() {
        regionList.classList.toggle('hidden');
    });

    // 각 지역 클릭 시 이벤트
    const regions = document.querySelectorAll('.region');
    regions.forEach(region => {
        region.addEventListener('click', function() {
            const selectedRegion = this.textContent;
            // 선택된 지역에 따른 도와 시 정보 표시
            // 예를 들어, 선택된 지역을 가져와 API 호출 또는 저장된 데이터를 통해 정보를 업데이트할 수 있습니다.
            displaySelectedLocationInfo(selectedRegion);
            regionList.classList.add('hidden'); // 선택 시 목록 숨김
        });
        
        
    });
});

function displaySelectedLocationInfo(selectedRegion) {
    const selectedLocationInfo = document.querySelector('.selected-location');
    // 선택된 지역에 따라 정보를 업데이트
    selectedLocationInfo.textContent = `선택된 지역: ${selectedRegion}`;
}

</script>
</body>
</html>