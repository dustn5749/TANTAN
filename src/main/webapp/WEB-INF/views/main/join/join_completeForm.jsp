<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
@charset "UTF-8";


@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}


	/* 회원가입 container 시작*/
	.joinForm_container {
		margin: 0 auto;	
		width: 90%;
		padding: 3%;
	}
	/* 회원가입 진행 창 */
	.jogin_process {
		margin: 0 auto;
		text-align: center;
		align-content: center;
		align-items: center;
		width: 65%;
	}
	#join_end{
		background-color: rgb(183, 226, 250);
	}
	.jogin_process > div{
		display: inline-block;
		width: 30%;
		margin: 0 auto;
		text-align: center;
		align-content: center;
		align-items: center;
    font-family: 'Pretendard-Regular';
		font-size: 20px !important;
		border: 1px solid rgb(197, 228, 246);
		border-radius: 5px !important;
		background: rgb(244, 251, 255);
	}
	/* 회원가입 진행창 진행 완료 이미지 */
	.check_img {
 	 	visibility: hidden;  
		width: 70px;
	}
	
	/* 회원완료 div */
	.join_inner {
		margin: 30px auto;
		width: 60%;
		 padding: 10px;
		 border: 1px dashed rgb(225, 225, 225);
		 border-radius: 10px;
		align-content: center;
		align-items: center;
		text-align: center;
		justify-content: center;
	}
	/* 회원가입 완료 h1 */
	.join_inner >h1 {
    font-family: 'Pretendard-Regular';
		font-size: 50px;
		color: rgb(53, 53, 53);
		margin: 20px;
	}
	/* 이미지 */
	#rabbit {
		margin: 30px;
	}
	/* 회원가입 완료 메세지 */
	#text_div{
		width: 80%;
		margin: 10px auto;
		border-radius: 5px;
		background-color:rgb(245, 244, 244);
		padding: 30px;
	}
	#text1{

	}

	/* 이전 버튼 div */
	#homeBtn_area{
		margin: 20px auto;
		width: 90%;
		text-align: center;	
			
	}
	#homeBtn {
		width:300px;
		height: 50px;
		border-radius: 5px;
		background-color:  rgb(86, 149, 244);
		border: none;
		box-shadow: 1px 1px 1px 1px rgb(225, 225, 225);
		color : white;
    font-family: 'Pretendard-Regular';
	}
	#homeBtn:hover {
		background-color: rgb(200, 246, 254);
		color: black;
	}

</style>
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> 
</head>
<body>
	<div class="joinForm_container">
		<div class="jogin_process">
			<div id="join_member_process">회원정보 설정
				<img src="/assets/img/check.png" class="check_img">
			</div>
			<div id="join_sns_process">SNS정보 설정
				<img src="/assets/img/check.png" class="check_img">
			</div>
			<div id="join_end">완료
				<img src="/assets/img/check.png" class="check_img">
			</div>
		</div>
		
		<div class="join_inner">
			<h1>회원가입 완료</h1>
			<img  src="/assets/img/rabbit.png" id="rabbit">
			<div id="text_div">
			<p id="text1">같이갈래의 회원이 되신 걸 축하드립니다!!<br></p>
			<p id="text2">이제부터 같이갈래의 서비스를 이용하실 수 있습니다.</p>
			</div>
			<div id="homeBtn_area">
			<input type="button" value="홈으로" id="homeBtn">
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#homeBtn").on("click", function(){
			location.href="/main.do";
		})
	</script>
</body>
</html>