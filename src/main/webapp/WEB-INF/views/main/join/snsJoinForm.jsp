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
	#join_sns_process{
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
	
	/* 회원가입 테이블 div */
	.join_inner {
		margin: 30px auto;
		width: 60%;
		 padding: 10px;
		 border: 1px dashed rgb(225, 225, 225);
		 border-radius: 10px;
	}
	/* 회원가입 테이블 */
	#join_table{
		margin: 30px auto;
    font-family: 'Pretendard-Regular';
  	  width: 70%;
	}

	#memberDetail {
		font-size: 30px;
	}
	/* 회원가입 정보 안내(아이디, 비밀번호...)  */
	.join_menu {
		color: gray;	
		font-size: 14px !important;	
		
	}
	/* 회원가입 정보 입력창 */
	.input_area {
		width: 80%;
		align-items: center;
		align-content: center;
	}
	#nickname{
		width: 90%;
		border: none;
		font-size: 15px !important;
    font-family: 'Pretendard-Regular';
	}
	.inputTr{
		border-bottom: 1px dotted rgb(190, 190, 190);
		height: 50px;
	}
	/* introduce 설정  */
	#introduce {
	 	width: 100%;
	 	height: 200px;
    font-family: 'Pretendard-Regular';
		font-size: 15px;
		padding: 10px;
	}
	/* 중복확인 버튼 */
	#nickname_check_btn{
    font-family: 'Pretendard-Regular';
		background: rgb(200, 246, 254);
		border-radius: 5px;
		border: 1px solid rgb(175, 237, 248);
	}
	#nickname_check_btn:hover {
		color: white;
		background-color: rgb(86, 149, 244);
	}
	.account_yn{
		margin: 10px;
    font-family: 'Pretendard-Regular';
	}
	
	/* 첨부파일 설정 */
	#profile_img{
    font-family: 'Pretendard-Regular';
	 	font-size: 15px;
	}
	
	/* 이전 버튼 div */
	#prevBtn_area{
		margin: 20px auto;
		width: 90%;
		text-align: right;	
			
	}
	#prevBtn , #nextBtn{
		width:100px;
		height: 40px;
		border-radius: 5px;
		background-color:  rgb(86, 149, 244);
		border: none;
		box-shadow: 1px 1px 1px 1px rgb(225, 225, 225);
		color : white;
    font-family: 'Pretendard-Regular';
	}
	#prevBtn:hover,
	#nextBtn:hover
	 {
		background-color: rgb(200, 246, 254);
		color: black;
	}
	tr {
		height: 40px;
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
			<table id="join_table">
			<tr>
				<th colspan="2" id="memberDetail">SNS정보</th>
			</tr>
			<tr>
				<td colspan="2" class="join_menu">*닉네임</td>
			</tr>
			<tr class="inputTr">
				<td class="input_area"><input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요"></td>
				<td><input type="button" value="중복확인" id="nickname_check_btn"></td>
			</tr>

			<tr>
				<td colspan="2" class="join_menu">*계정 공개 유무</td>
			</tr>
			<tr class="inputTr">
				<td colspan="2" class="input_area">
				<input type="radio" name="account_yn" value="y" class="account_yn">공개
				<input type="radio" name="account_yn" value="n"  class="account_yn">비공개
				</td>
			</tr>
			<tr>
				<td colspan="2" class="join_menu">소개글</td>
			</tr>
			<tr class="inputTr">
				<td colspan="2" class="input_area"><textarea id="introduce" name="introduce" placeholder="소개글을 입력해주세요"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" class="join_menu">프로필 이미지</td>
			</tr>
			<tr>
				<td><input type="file" name="profile_img" id="profile_img"></td>
			</tr>
			</table>
			<div id="prevBtn_area">
			<input type="button" value="이전" id="prevBtn">
			<input type="button" value="다음" id="nextBtn">
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#prevBtn").on("click", function(){
			location.href="/member/joinForm.do";
		})
		
		$("#nextBtn").on("click", function(){
			location.href="/member/joinComplete.do";
		})
	</script>
</body>
</html>