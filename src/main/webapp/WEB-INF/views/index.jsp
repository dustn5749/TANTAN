<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
       
<!DOCTYPE html>
<html>
<head>
    <title>[여행동행모집] 같이갈래?</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="/image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="/assets/css/fontawesome.min.css">
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <!-- Google tag (gtag.js) -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-H529RT4PZC"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'G-H529RT4PZC');
  </script>
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
<style type="text/css">

/* 마우스 커서에 대한 설정 */
/*  body {
    cursor: url('/assets/img/cursor2.png'), auto !important;
   }

   a:hover {
       cursor: url('/assets/img/cursor.png'), auto !important;       
   } */



/* 토끼 아이콘 DIV */
.bg {
    z-index: 100;
    position: fixed;
    right: 0;
    top: 300px; /* 수정된 값 */
    width: 290px;
    height: 240px;
    text-align: center;
    display: flex;     
}

.bg:hover img {
    transform: scale(1.1);
    transition: transform 0.3s; /* 선택적인 트랜지션을 추가하여 부드럽게 확대/축소 가능 */
 
}

#rabbit_img{
	cursor: pointer;
}
</style>

</head>

<body>
   

 	<div id="container">
 	
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="content">
		   	<div class="bg">
			  <img src="/assets/img/rabbit.png" id="rabbit_img">	
		   	</div>
		<tiles:insertAttribute name="body"/>
		</div>
		<div id="footer">
		<tiles:insertAttribute name="footer"/>
		</div>
		<c:choose>
		    <c:when test="${empty principal}">
		        <input type="hidden" value="${principal.user.member_id}" class="member">			
		    </c:when>
		    <c:otherwise>
		        <input type="hidden" value="null" class="member">
		    </c:otherwise>		
		</c:choose>

	</div>
	


    <!-- Start Script -->
    <script src="/assets/js/jquery-1.11.0.min.js"></script>
    <script src="/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/assets/js/templatemo.js"></script>
    <!-- End Script -->
    
    <script type="text/javascript">
	/* 토끼 눌렀을때 sns 페이지로 연동 */
	$("#rabbit_img").on("click",function(){
		if($(".member").val()!=""){
			location.href="/sns/profile";		
		} else {
			alert("로그인 후 이용해주세요")
		}
	})
	
	</script>
	
	<!-- 관리자 사용자 데이터 가져오기 -->
	<script>
//  	(async function() {
//  		const res = await fetch('https://www.googleapis.com/analytics/v3/data/ga?ids=ga%3A296855898&dimensions=ga%3Asource%2Cga%3Akeyword&metrics=ga%3Ausers%2Cga%3AavgSessionDuration%2Cga%3AavgTimeOnPage%2Cga%3AsearchResultViews%2Cga%3AavgPageLoadTime&start-date=7daysAgo&end-date=yesterday');
//  		const data = await res.json();
		
//  		console.log(data);
//  	})();
 	</script> 
</body>
</html>