<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/assets/css/joinForm_member.css">
<style type="text/css">
	.joinForm_container{
		padding:30px;
		width: 90%;
		margin: 0 auto;
		justify-content: center;
		align-content: center;
		align-items: center;
		background-color:rgb(234, 241, 250);
	}
	.joinForm_inner{
		background-color:  rgb(244, 246, 248);
		width: 95%;
		margin: 0 auto;
		padding:4%;
		justify-content: center;
		align-content: center;
		align-items: center;
	}
	
</style>
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> 
</head>
<body>
	<div class="joinForm_container">
	<div class="joinForm_inner">
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
				<th colspan="2" id="memberDetail">회원정보</th>
			</tr>
			<tr>
				<td colspan="2" class="join_menu">*아이디</td>
			</tr>
			<tr class="inputTr">
				<td class="input_area"><input type="text" id="member_id" name="member_id" placeholder="아이디를 입력해주세요"></td>
				<td><input type="button" value="중복확인" id="id_check_btn"></td>
			</tr>
			<tr>
				<td colspan="2" class="join_menu">*비밀번호</td>
			</tr>
			<tr class="inputTr">
				<td colspan="2" class="input_area"><input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="2" class="join_menu">*이름</td>
			</tr>
			<tr class="inputTr">
				<td colspan="2" class="input_area"><input type="text" id="name" name="name" placeholder="이름을 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="2" class="join_menu">이메일</td>
			</tr>
			<tr class="inputTr">
				<td colspan="2" class="input_area"><input type="text" id="email" name="email" placeholder="@형태로 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="2" class="join_menu">*휴대폰 번호</td>
			</tr>
			<tr class="inputTr">
				<td colspan="2" class="input_area"><input type="tel" id="phone" name="phone" placeholder="-을 제외하고 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="2" class="join_menu">나이</td>
			</tr>
			<tr class="inputTr">
				<td colspan="2" class="input_area"><input type="number" id="age" name="age"></td>
			</tr>
			<tr>
				<td colspan="2" class="join_menu">성별</td>
			</tr>
			<tr class="inputTr">
				<td colspan="2" class="input_area">
				<select id="gender" name="gender">
			  		<option value="none">선택안함</option>
  					<option value="male">남성</option>
 					<option value="female">여성</option>
				</select>
				</td>
			</tr>
			<tr class="terms_area">
				<td colspan="2" class="input_area" id="temrs_td">
					약관동의하기
				</td>
			</tr>
			<tr>
				<td class="terms_input"><input type="checkbox" id="select_all"> 전체동의하기</td>
			</tr>
			<tr>
				<td  class="terms_input"><input type="checkbox" class="select_terms"> 같이갈래 이용 약관에 동의합니다. <span class="essential_terms">(필수)</span></td>
			</tr>
			<tr>
				<td  class="terms_input"><input type="checkbox" class="select_terms"> 개인정보 수집 및 이용에 동의합니다. <span class="essential_terms">(필수)</span></td>
			</tr>
			<tr>
				<td  class="terms_input"><input type="checkbox" class="select_terms"> 마케팅 활용 및 광고성 정보 수신에 동의합니다. <span id="selected">(선택)</span></td>
			</tr>
			</table>
			<div id="nextBtn_area"><input type="button" value="다음" id="nextBtn"></div>
		</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#nextBtn").on("click", function(){
			location.href="/member/joinProcess2.do";
		})
	</script>
</body>
</html>