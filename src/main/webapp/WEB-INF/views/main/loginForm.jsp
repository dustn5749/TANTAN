<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
<link rel="stylesheet" href="/assets/css/loginForm.css">
</head>
<body>
	<!-- 로그인 form 시작 -->
	<div class="loginForm_container">
		<div class="loginForm_inner">
			<div class="login_table_div">
				<!-- 로그인 정보가 들어가있는 table -->
				<table id="loginTb">
					<tr>
					<th colspan="2" id="table_title">로그인</th>
					</tr>
					<tr>
						<td colspan="2" class="loginInput"><input type="text" placeholder="아이디를 입력하세요" name="member_id" id="member_id"></td>
					</tr>
					<tr>
						<td colspan="2" class="loginInput"><input type="password" placeholder="비밀번호를 입력하세요" name="pwd" id="pwd"></td>
					</tr>
					<tr>
						<td colspan="2" class="loginInput"><input type="submit" id="loginBtn" value="로그인"></td>
					</tr>
					<tr>
						<td colspan="2" class="loginInput"><input type="button" id="joinBtn" value="회원가입"></td>
					</tr>
					<tr>
						<td class="searchTd"><a id="search_area_id">아이디 찾기</a></td>
						<td class="searchTd"><a id="search_area_pwd">비밀번호찾기</a></td>
					</tr>
				</table>
				<hr>
				<table id="oauthBtnTb">
					<tr>
						<td colspan="2">소셜 로그인하기</td>
					</tr>
					<tr>
						<td colspan="2"  class="btnArea"><button id="kakao_loginBtn"><img src="/assets/img/kakao_logo.png"></button></td>
					</tr>
				
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/assets/js/loginForm.js"></script>
</body>
</html>