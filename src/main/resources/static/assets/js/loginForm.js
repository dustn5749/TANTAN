//회원가입창으로 이동
$("#joinBtn").on("click",function(){
	location.href="/member/joinForm.do";
})

// 일반 로그인하기
$("#loginBtn").on("click", function(){
	var member_id = $("#member_id").val();
	var pwd =  $("#pwd").val()
	var send = {
		member_id : member_id,
		pwd : pwd
	};
	console.log(send)
	$.ajax({
		url : "/member/login.do",
	    type: 'POST',
	    contentType:   "application/json; charset=UTF-8",
	    data: JSON.stringify(send),
	    dataType: "json",
	    success: function (data) {
			if(data.result){
				alert("로그인 성공");
				location.href="/main.do";
			}
		}
	})
})

// 소셜 로그인하기
$