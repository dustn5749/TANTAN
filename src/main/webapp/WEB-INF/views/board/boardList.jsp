<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대보3기 게시판</title>
    <link rel="stylesheet" href="/assets/css/boardList.css">

</head>

<style>
.sc-6fd3897f-2 {
      display: none;
      
      /* CSS로 버튼 디자인 및 스타일링을 적용합니다. */
.custom-button {
  display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  background-color: #3498db;
  color: #ffffff;
  border: none;
  border-radius: 5px;
  text-align: center;
  text-decoration: none;
  transition: background-color 0.3s;
}

.custom-button:hover {
  background-color: #2980b9;
  cursor: pointer;
}
      
      
      </style>

<div class="sc-8276a693-3 fnsrxQ">
    <div class="sc-8276a693-4 hiyPAt"></div>
    <div class="sc-8276a693-6 cyzJKz">
        <div class="sc-6b89d0a2-0 fqFOsB">
            <div class="sc-6b89d0a2-1 jOzFyS">
                <div class="sc-6b89d0a2-2 eHXddr">
                    <div class="sc-6b89d0a2-3 gRnINB" style="left: 0%;"></div>
                    <button class="sc-6b89d0a2-4 hiCFUB">
                        <img src="/assets/img/women_holding_hands.png" alt="동행" class="sc-6b89d0a2-5 ddkKBo">동행
                    </button>
                    <button class="sc-6b89d0a2-4 jpNkys">
                        <img src="/assets/img/answer2_img02.png" alt="일정" class="sc-6b89d0a2-5 ddkKBo">일정
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

    

<main class="sc-8276a693-1 dtglEk">
  <div class="sc-6fd3897f-0 kNZvbZ">
    <div class="sc-6fd3897f-1 bgXato">
      <div class="sc-fe318b44-0 bPOjyX">
        <button class="sc-fe318b44-1 diPORg">최신 순</button>
        <button class="sc-fe318b44-1 diPORg">인기 순</button>
        <button class="sc-fe318b44-1 diPORg">많이 본 순</button>
        <button class="sc-fe318b44-1 eTYLaQ">댓글 순</button>
      </div>
    </div>
        
        
 
<!--     <div class="sc-b294d238-0 RYzmN"> -->
<!--       <div class="sc-b294d238-1 dEnAsw"> -->
<!--     <svg width="20" height="19" viewBox="0 0 20 19" fill="none" xmlns="http://www.w3.org/2000/svg"  -->
<!--     style="transition: transform 0.3s ease 0s; transform: rotate(0deg); cursor: pointer; display: inline-block;"> -->
    
<!--   <path fill-rule="evenodd" clip-rule="evenodd" d="M0.75 9.49252C0.75 9.19691 0.992057 8.95728 1.29065 8.95728H19.2094C19.5079 8.95728 19.75 9.19691 19.75 9.49252C19.75 9.78813 19.5079 10.0278 19.2094 10.0278H1.29065C0.992057 10.0278 0.75 9.78813 0.75 9.49252Z" fill="#6a6a6a"></path> -->
  
<!--   <path fill-rule="evenodd" clip-rule="evenodd" d="M0.75 3.2225C0.75 2.92689 0.992057 2.68726 1.29065 2.68726H19.2094C19.5079 2.68726 19.75 2.92689 19.75 3.2225C19.75 3.51811 19.5079 3.75775 19.2094 3.75775H1.29065C0.992057 3.75775 0.75 3.51811 0.75 3.2225Z" fill="#6a6a6a"></path> -->
  
<!--   <path fill-rule="evenodd" clip-rule="evenodd" d="M0.75 15.7625C0.75 15.4669 0.992057 15.2273 1.29065 15.2273H19.2094C19.5079 15.2273 19.75 15.4669 19.75 15.7625C19.75 16.0582 19.5079 16.2978 19.2094 16.2978H1.29065C0.992057 16.2978 0.75 16.0582 0.75 15.7625Z" fill="#6a6a6a"></path> -->
  
<!--   <path d="M8.62799 3.38083C8.62799 4.75331 7.50415 5.86592 6.11783 5.86592C4.7315 5.86592 3.60767 4.75331 3.60767 3.38083C3.60767 2.00836 4.7315 0.895752 6.11783 0.895752C7.50415 0.895752 8.62799 2.00836 8.62799 3.38083Z" fill="white"></path> -->
  
<!--   <path fill-rule="evenodd" clip-rule="evenodd" d="M6.11797 1.48977C5.06302 1.48977 4.20781 2.33643 4.20781 3.38085C4.20781 4.42526 5.06302 5.27192 6.11797 5.27192C7.17293 5.27192 8.02814 4.42526 8.02814 3.38085C8.02814 2.33643 7.17293 1.48977 6.11797 1.48977ZM3.00781 3.38085C3.00781 1.68031 4.40028 0.301758 6.11797 0.301758C7.83567 0.301758 9.22814 1.68031 9.22814 3.38085C9.22814 5.08138 7.83567 6.45993 6.11797 6.45993C4.40028 6.45993 3.00781 5.08138 3.00781 3.38085Z" fill="#6a6a6a"></path> -->
  
<!--   <path d="M8.62799 15.7898C8.62799 17.1622 7.50415 18.2749 6.11783 18.2749C4.7315 18.2749 3.60767 17.1622 3.60767 15.7898C3.60767 14.4173 4.7315 13.3047 6.11783 13.3047C7.50415 13.3047 8.62799 14.4173 8.62799 15.7898Z" fill="white"></path> -->
  
<!--   <path d="M16.8904 9.65085C16.8904 11.0233 15.7666 12.1359 14.3803 12.1359C12.994 12.1359 11.8701 11.0233 11.8701 9.65085C11.8701 8.27838 12.994 7.16577 14.3803 7.16577C15.7666 7.16577 16.8904 8.27838 16.8904 9.65085Z" fill="white"></path> -->
  
<!--   <path fill-rule="evenodd" clip-rule="evenodd" d="M14.3802 7.75979C13.3252 7.75979 12.47 8.60645 12.47 9.65087C12.47 10.6953 13.3252 11.5419 14.3802 11.5419C15.4351 11.5419 16.2903 10.6953 16.2903 9.65087C16.2903 8.60645 15.4351 7.75979 14.3802 7.75979ZM11.27 9.65087C11.27 7.95033 12.6625 6.57178 14.3802 6.57178C16.0979 6.57178 17.4903 7.95033 17.4903 9.65087C17.4903 11.3514 16.0979 12.73 14.3802 12.73C12.6625 12.73 11.27 11.3514 11.27 9.65087Z" fill="#6a6a6a"></path> -->
  
<!--   <path d="M8.48468 15.9211C8.48468 17.2936 7.36084 18.4062 5.97452 18.4062C4.58819 18.4062 3.46436 17.2936 3.46436 15.9211C3.46436 14.5486 4.58819 13.436 5.97452 13.436C7.36084 13.436 8.48468 14.5486 8.48468 15.9211Z" fill="white"></path> -->
  
<!--   <path fill-rule="evenodd" clip-rule="evenodd" d="M5.97442 14.0298C4.91947 14.0298 4.06426 14.8765 4.06426 15.9209C4.06426 16.9653 4.91947 17.812 5.97442 17.812C7.02937 17.812 7.88458 16.9653 7.88458 15.9209C7.88458 14.8765 7.02937 14.0298 5.97442 14.0298ZM2.86426 15.9209C2.86426 14.2204 4.25673 12.8418 5.97442 12.8418C7.69212 12.8418 9.08458 14.2204 9.08458 15.9209C9.08458 17.6214 7.69212 19 5.97442 19C4.25673 19 2.86426 17.6214 2.86426 15.9209Z" fill="#6a6a6a"></path> -->
<!-- </svg> -->

   
<!--  <style> -->
<!-- /*     .sc-6fd3897f-2 .sc-9280f9a9-0 { display: none; } */ -->
<!--   </style> -->
<!-- </head> -->

<div class="region-selector">
  <span class="select-region">지역</span>
  <div class="dropdown-icon"></div>

  <div class="sc-6fd3897f-2">
    <button class="sc-9280f9a9-0 iAUmuD" style="display: none;"><p class="sc-9280f9a9-1 jkexzH">한국</p></button>
  </div>
</div>

<button id="createCompanionButton" class="custom-button">동행 생성하기</button>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const createCompanionButton = document.getElementById('createCompanionButton');

  createCompanionButton.addEventListener('click', function() {
    window.location.href = "boardDetail.jsp"; 
  });
});
</script>



<div class="selected-location"></div>
		    </div>
		    <div class="sc-cf3dfdf6-1 dkbZSI">
		      <button class="sc-9280f9a9-0 gpXqPI">
		        <p class="sc-9280f9a9-1 kSLJX">울릉도</p>
		      </button>
		      <button class="sc-9280f9a9-0 gpXqPI">
		        <p class="sc-9280f9a9-1 kSLJX">전라도</p>
		      </button>
		 <button class="sc-9280f9a9-0 gpXqPI">
		        <p class="sc-9280f9a9-1 kSLJX">경상도</p>
		      </button>
		     <button class="sc-9280f9a9-0 gpXqPI">
		        <p class="sc-9280f9a9-1 kSLJX">충청도</p>
		      </button>
		      
<!-- 		     <button class="sc-9280f9a9-0 gpXqPI"> -->
<!-- 		        <p class="sc-9280f9a9-1 kSLJX">인천</p> -->
<!-- 		      </button> -->
<!-- 		       <button class="sc-9280f9a9-0 gpXqPI"> -->
<!-- 		        <p class="sc-9280f9a9-1 kSLJX">경기도</p> -->
<!-- 		      </button> -->
<!-- 		 <button class="sc-9280f9a9-0 gpXqPI"> -->
<!-- 		        <p class="sc-9280f9a9-1 kSLJX">부산</p> -->
<!-- 		      </button> -->
<!-- 		       <button class="sc-9280f9a9-0 gpXqPI"> -->
<!-- 		        <p class="sc-9280f9a9-1 kSLJX">제주도</p> -->
<!-- 		       <button class="sc-9280f9a9-0 gpXqPI"> -->
<!-- 		        <p class="sc-9280f9a9-1 kSLJX">강원도</p> -->
<!-- 		      </button> -->
<!-- 		       <button class="sc-9280f9a9-0 gpXqPI"> -->
<!-- 		        <p class="sc-9280f9a9-1 kSLJX">서울</p> -->
<!-- 		      </button> -->
		
		
<!-- 		    <BUTTON CLASS="SC-9280F9A9-0 KSLJX"> -->
<!-- 		        <P CLASS="SC-9280F9A9-1 KSLJX">서울특별시</P> -->
<!-- 		    </BUTTON> -->
<!-- 		    <BUTTON CLASS="SC-9280F9A9-0 KSLJX"> -->
<!-- 		        <P CLASS="SC-9280F9A9-1 KSLJX">부산광역시</P> -->
<!-- 		    </BUTTON> -->
		    
   
<!-- 			<BUTTON CLASS="SC-9280F9A9-0 GPXQPI"> -->
<!-- 		        <P CLASS="SC-9280F9A9-1 KSLJX">대구광역시</P> -->
<!-- 		    </BUTTON> -->
<!-- 		    <BUTTON CLASS="SC-9280F9A9-0 GPXQPI"> -->
<!-- 		        <P CLASS="SC-9280F9A9-1 KSLJX">인천광역시</P> -->
<!-- 		    </BUTTON> -->
<!-- 		    <BUTTON CLASS="SC-9280F9A9-0 GPXQPI"> -->
<!-- 		        <P CLASS="SC-9280F9A9-1 KSLJX">광주광역시</P> -->
<!-- 		    </BUTTON> -->
<!-- 		    <BUTTON CLASS="SC-9280F9A9-0 GPXQPI"> -->
<!-- 		        <P CLASS="SC-9280F9A9-1 KSLJX">대전광역시</P> -->
<!-- 		    </BUTTON> -->
<!-- 		    <BUTTON CLASS="SC-9280F9A9-0 GPXQPI"> -->
<!-- 		        <P CLASS="SC-9280F9A9-1 KSLJX">울산광역시</P> -->
<!-- 		    </BUTTON> -->
<!-- 		    <BUTTON CLASS="SC-9280F9A9-0 GPXQPI"> -->
<!-- 		        <P CLASS="SC-9280F9A9-1 KSLJX">세종특별자치시</P> -->
<!-- 		</BUTTON> -->
<!-- 		    <BUTTON CLASS="SC-9280F9A9-0 GPXQPI"> -->
<!-- 		        <P CLASS="SC-9280F9A9-1 KSLJX">경기도</P> -->
<!-- 		</BUTTON> -->
<!-- 		    <BUTTON CLASS="SC-9280F9A9-0 GPXQPI"> -->
<!-- 		        <P CLASS="SC-9280F9A9-1 KSLJX">강원도</P> -->
<!-- 		    </BUTTON> -->
<!-- 		</DIV> -->
	
	<div class="sc-6fd3897f-3 cjErMT">
	    <button width="93px" color="#fff" class="sc-1a19d32c-0 kZebzh">
	        <svg width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	            <path fill-rule="evenodd" clip-rule="evenodd" d="M19.6052 12C19.6052 15.5899 16.6951 18.5 13.1052 18.5V20C17.5235 20 21.1052 16.4183 21.1052 		12C21.1052 7.58172 17.5235 4 13.1052 4C8.68695 4 5.10522 7.58172 5.10522 12H6.60522C6.60522 8.41015 9.51537 5.5 13.1052 5.5C16.6951 5.5 19.6052 		8.41015 19.6052 12Z" fill="#00CE7C"></path>
	            <path d="M6.23389 15.6285C6.03593 15.8428 5.6973 15.8428 5.49934 15.6285L2.66746 12.5629C2.37163 12.2427 2.59877 11.7237 3.03473 		11.7237L8.6985 11.7237C9.13446 11.7237 9.3616 12.2427 9.06577 12.5629L6.23389 15.6285Z" fill="#00CE7C"></path>
	          
	            <circle cx="13.1052" cy="19.25" r="0.75" fill="#00CE7C"></circle>
	       		</svg> 초기화</button>
	    
	    <button width="calc(100% - 105px)" color="#fff" class="sc-1a19d32c-0 eOBcjJ">적용하기</button>
	</div>
	   
  
      
<script>
document.addEventListener("DOMContentLoaded", function() {
	  const selectRegion = document.querySelector('.select-region');
	  const koreaButton = document.querySelector('.sc-9280f9a9-0');

	  selectRegion.addEventListener('click', function() {
	    koreaButton.style.display = 'block';
	  });
	});
// document.addEventListener('DOMContentLoaded', function() {
// 	  const selectRegion = document.querySelector('.select-region');
// 	  const regionSelector = document.querySelector('.sc-6fd3897f-2');
// 	  const buttonKorea = document.querySelector('.sc-6fd3897f-2 .sc-9280f9a9-0');

// 	  let isRegionSelected = false;

// 	  selectRegion.addEventListener('click', function() {
// 	    if (!isRegionSelected) {
// 	      regionSelector.style.display = 'block';
// 	      isRegionSelected = true;
// 	    } else {
// 	      regionSelector.style.display = 'none';
// 	      isRegionSelected = false;
// 	    }
// 	  });
// 	});



//   buttonKorea.addEventListener('click', function() {
//     regionSelector.style.display = 'block';
//     buttonKorea.style.display = 'none';
//   });
// });

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
      </div>
    </div>
  </div>
</main>


<section class="sc-19abfb4d-0 gMqNL">
	<div class="sc-29bc4f98-0 fcEaCl">
		<div class="sc-29bc4f98-5 coaePv">
		<div class="sc-29bc4f98-6 lmnhGl">
		<img src="" class="sc-29bc4f98-7 lnUgzp">
		<div class="sc-29bc4f98-8 jyBUwE">
		<p color="#000000" class="sc-29bc4f98-3 bNQCRm"></p>
		<div class="sc-29bc4f98-4 fcbBSx">
		<p color="#008ff6" class="sc-29bc4f98-3 fxmbuM"></p>
		<div color="#008ff6" class="sc-29bc4f98-1 kAVbMF"></div>
		<p color="#008ff6" class="sc-29bc4f98-3 fxmbuM"></p>
		</div>
		</div>
	</div>
	
		<div class="sc-29bc4f98-2 llYPOV">
	</div>
		<div class="sc-29bc4f98-9 hRWitS">
		<div class="sc-29bc4f98-10 fXtNyN">
	</div>
	
	<div class="sc-29bc4f98-11 fVyVIL">
		<img src="" class="sc-29bc4f98-12 cZSBPp">
		<p class="sc-29bc4f98-13 cnWlyh"></p>
	</div>
	
		<div class="sc-29bc4f98-4 fcbBSv">
		<p color="#00CE7C" class="sc-29bc4f98-3 vVyyB">일</p>
		<div color="#00CE7C" class="sc-29bc4f98-1 bAChzx"></div>
		<p color="#00CE7C" class="sc-29bc4f98-3 hNtUmQ"></p>
		</div>
		</div>
	</div>
	
	<div class="sc-29bc4f98-14 grDCHa">
		<img src="" class="sc-29bc4f98-15 kbGHFj">
		<div class="sc-29bc4f98-16 gxQXjn">
		<div class="sc-29bc4f98-17 kpFUIh">
			<svg width="13" height="17" viewBox="0 0 13 17" fill="none" xmlns="http://www.w3.org/2000/svg">
			<path d="M12.7244 7.11371C12.7244 10.6866 6.49995 16.3557 6.49995 16.3557C6.49995 16.3557 0.275513 10.6866 0.275513 7.11371C0.275513 3.54077 3.06229 			0.644341 6.49995 0.644341C9.93761 0.644341 12.7244 3.54077 12.7244 7.11371Z" fill="#fff"></path>
			<ellipse cx="6.50063" cy="6.40462" rx="2.81106" ry="2.81106" fill="#008FF6"></ellipse>
			</svg>
		</div>
		
	<p color="#fff" class="sc-29bc4f98-18 kBBtA-D"></p>
	</div><div class="sc-29bc4f98-19 iwPKbY"><div class="sc-29bc4f98-20 dDVluB">
	<p class="sc-29bc4f98-21 jDYjaB"></p>
	<div color="#00CE7C" class="sc-29bc4f98-1 bAChzx"></div>
	<p class="sc-29bc4f98-21 jDYjaB"></p>
	</div>
	<div class="sc-29bc4f98-22 kOBvnc">
	<div class="sc-29bc4f98-23 jkGfHV">
	<img src="" class="sc-29bc4f98-24 kDkfpo">
	<p class="sc-29bc4f98-25 dOUlxh"></p></div><div class="sc-29bc4f98-23 jkGfHV">
	<img src="" class="sc-29bc4f98-24 kDkfpo">
	<p class="sc-29bc4f98-25 dOUlxh">0</p></div><div class="sc-29bc4f98-23 jBgfDo">
	<img src="" class="sc-29bc4f98-24 kDkfpo">
	<p class="sc-29bc4f98-25 dOUlxh">0</p>
	</div>
	</div>
	</div>
	</div>
	<div class="sc-29bc4f98-26 kHbskm">
	<p class="sc-29bc4f98-27 gTrsyi"></p>
	<p class="sc-29bc4f98-28 fLzFwe">
	</p>
	</div>
</div>





</section>

</body>

</html>

