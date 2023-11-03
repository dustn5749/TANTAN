<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>같이갈래?</title>

  <link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
  <link rel="stylesheet" href="assets/sns/css/profileReset.css">
  <link rel="stylesheet" href="assets/sns/css/profileStyle.css">
  <link rel="stylesheet" href="assets/sns/css/message.css">
</head>

<body>
  <div class="pop">
  	<div class="popDim"></div>
  	<div class="popCont">
  	
<!-- 	  	<span class="popClose"> -->
<!-- 	  		<svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 384 512">! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc.<path d="M376.6 84.5c11.3-13.6 9.5-33.8-4.1-45.1s-33.8-9.5-45.1 4.1L192 206 56.6 43.5C45.3 29.9 25.1 28.1 11.5 39.4S-3.9 70.9 7.4 84.5L150.3 256 7.4 427.5c-11.3 13.6-9.5 33.8 4.1 45.1s33.8 9.5 45.1-4.1L192 306 327.4 468.5c11.3 13.6 31.5 15.4 45.1 4.1s15.4-31.5 4.1-45.1L233.7 256 376.6 84.5z"/></svg> -->
<!-- <!-- 	  		<svg xmlns="http://www.w3.org/2000/svg" height="2em" viewBox="0 0 512 512">! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc.<path d="M256 48a208 208 0 1 1 0 416 208 208 0 1 1 0-416zm0 464A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM175 175c-9.4 9.4-9.4 24.6 0 33.9l47 47-47 47c-9.4 9.4-9.4 24.6 0 33.9s24.6 9.4 33.9 0l47-47 47 47c9.4 9.4 24.6 9.4 33.9 0s9.4-24.6 0-33.9l-47-47 47-47c9.4-9.4 9.4-24.6 0-33.9s-24.6-9.4-33.9 0l-47 47-47-47c-9.4-9.4-24.6-9.4-33.9 0z"/></svg> --> -->
<!-- 	  	</span> -->
  	
	  	<button type="button" class="icon-btn close-btn" onclick="closeModal('feed-modal')">
        <img src="assets/sns/images/icon-close-white.svg" alt="">
      	</button>
	
		<div class="messageWrap">
			
			<section class="left">
				<section class="messageArea">
					<div class="top">
						<span class="tit">Messages</span>
						<div class="btn">
							<span><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M495.9 166.6c3.2 8.7 .5 18.4-6.4 24.6l-43.3 39.4c1.1 8.3 1.7 16.8 1.7 25.4s-.6 17.1-1.7 25.4l43.3 39.4c6.9 6.2 9.6 15.9 6.4 24.6c-4.4 11.9-9.7 23.3-15.8 34.3l-4.7 8.1c-6.6 11-14 21.4-22.1 31.2c-5.9 7.2-15.7 9.6-24.5 6.8l-55.7-17.7c-13.4 10.3-28.2 18.9-44 25.4l-12.5 57.1c-2 9.1-9 16.3-18.2 17.8c-13.8 2.3-28 3.5-42.5 3.5s-28.7-1.2-42.5-3.5c-9.2-1.5-16.2-8.7-18.2-17.8l-12.5-57.1c-15.8-6.5-30.6-15.1-44-25.4L83.1 425.9c-8.8 2.8-18.6 .3-24.5-6.8c-8.1-9.8-15.5-20.2-22.1-31.2l-4.7-8.1c-6.1-11-11.4-22.4-15.8-34.3c-3.2-8.7-.5-18.4 6.4-24.6l43.3-39.4C64.6 273.1 64 264.6 64 256s.6-17.1 1.7-25.4L22.4 191.2c-6.9-6.2-9.6-15.9-6.4-24.6c4.4-11.9 9.7-23.3 15.8-34.3l4.7-8.1c6.6-11 14-21.4 22.1-31.2c5.9-7.2 15.7-9.6 24.5-6.8l55.7 17.7c13.4-10.3 28.2-18.9 44-25.4l12.5-57.1c2-9.1 9-16.3 18.2-17.8C227.3 1.2 241.5 0 256 0s28.7 1.2 42.5 3.5c9.2 1.5 16.2 8.7 18.2 17.8l12.5 57.1c15.8 6.5 30.6 15.1 44 25.4l55.7-17.7c8.8-2.8 18.6-.3 24.5 6.8c8.1 9.8 15.5 20.2 22.1 31.2l4.7 8.1c6.1 11 11.4 22.4 15.8 34.3zM256 336a80 80 0 1 0 0-160 80 80 0 1 0 0 160z"/></svg></span>
							<span><svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0l57.4-43c23.9-59.8 79.7-103.3 146.3-109.8l13.9-10.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176V384c0 35.3 28.7 64 64 64H360.2C335.1 417.6 320 378.5 320 336c0-5.6 .3-11.1 .8-16.6l-26.4 19.8zM640 336a144 144 0 1 0 -288 0 144 144 0 1 0 288 0zm-76.7-43.3c6.2 6.2 6.2 16.4 0 22.6l-72 72c-6.2 6.2-16.4 6.2-22.6 0l-40-40c-6.2-6.2-6.2-16.4 0-22.6s16.4-6.2 22.6 0L480 353.4l60.7-60.7c6.2-6.2 16.4-6.2 22.6 0z"/></svg></span>
						</div>
					</div>
					<div class="searchWrap1">
						<input type="text" placeholder="Search Direct Message" class="inputTxt">
					</div>
					<div class="messageList">
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv on">
							<div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
						<div class="messageDiv">
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="sumBox">
								<p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
								<p class="msg">머해?</p>
							</div>
						</div>
					</div>
				</section>
				<section class="friendsList">
					<div class="tab">
						<div class="tit on">
							<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M144 0a80 80 0 1 1 0 160A80 80 0 1 1 144 0zM512 0a80 80 0 1 1 0 160A80 80 0 1 1 512 0zM0 298.7C0 239.8 47.8 192 106.7 192h42.7c15.9 0 31 3.5 44.6 9.7c-1.3 7.2-1.9 14.7-1.9 22.3c0 38.2 16.8 72.5 43.3 96c-.2 0-.4 0-.7 0H21.3C9.6 320 0 310.4 0 298.7zM405.3 320c-.2 0-.4 0-.7 0c26.6-23.5 43.3-57.8 43.3-96c0-7.6-.7-15-1.9-22.3c13.6-6.3 28.7-9.7 44.6-9.7h42.7C592.2 192 640 239.8 640 298.7c0 11.8-9.6 21.3-21.3 21.3H405.3zM224 224a96 96 0 1 1 192 0 96 96 0 1 1 -192 0zM128 485.3C128 411.7 187.7 352 261.3 352H378.7C452.3 352 512 411.7 512 485.3c0 14.7-11.9 26.7-26.7 26.7H154.7c-14.7 0-26.7-11.9-26.7-26.7z"/></svg>
							친구
						</div>
						<div class="tit">
							<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM504 312V248H440c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V136c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H552v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
							초대하기
						</div>
					</div>
					<div class="searchWrap2">
						<input type="text" placeholder="검색" class="inputTxt">
					</div>
					<div class="friendBox">
						<div class="friendDiv">
							<div class="chkDiv">
								<input type="checkbox" class="chk" value="">
							</div>
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="friendInfo">
								<p class="nick">Gee
								</p>
								<p class="txt">Toni Kroos</p>
								<button class="folBtn">메시지 보내기</button>
							</div>
						</div>
						<div class="friendDiv">
							<div class="chkDiv">
								<input type="checkbox" class="chk" value="">
							</div>
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="friendInfo">
								<p class="nick">Gee
									<span class="check">
								
									</span>
								</p>
								<p class="txt">Toni Kroos</p>
								<button class="folBtn">메시지 보내기</button>
							</div>
						</div>
						
						<div class="friendDiv">
							<div class="chkDiv">
								<input type="checkbox" class="chk" value="">
							</div>
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="friendInfo">
								<p class="nick">Gee									
								</p>
								<p class="txt">Toni Kroos</p>
								<button class="folBtn">메시지 보내기</button>
							</div>
						</div>
						<div class="friendDiv">
							<div class="chkDiv">
								<input type="checkbox" class="chk" value="">
							</div>
							<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
							<div class="friendInfo">
								<p class="nick">Gee
									
								</p>
								<p class="txt">Toni Kroos</p>
								<button class="folBtn">메시지 보내기</button>
							</div>
						</div>
					</div>
				</section>
			</section>
			
			<section class="chatArea">
				<div class="top">
					
					<h3>쥐</h3>
					<span class="info">
						<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
					</span>
				</div>
				<div class="chatWrap">
					<div class="userinfo">
						<div class="uImg"><img alt="" src="./assets/sns/images/mouse.jpg"></div>
						<p class="nick">쥐</p>				
					
					</div>
					<div class="chat">
						<div class="rtm"><span>ㅎㅇ</span></div>
						<div class="rtTime"><span>4:43 PMㆍSent</span></div>
						<div class="rtm"><span>머해?</span></div>
						<div class="rtTime"><span>4:44 PMㆍSent</span></div>
						<div class="ltm"><span>그냥있어</span></div>
						<div class="ltTime"><span>4:46 PMㆍreceived</span></div>
					</div>
				</div>
				<div class="sendMessage">
					<span class="addImg">
						<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M0 96C0 60.7 28.7 32 64 32H448c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96zM323.8 202.5c-4.5-6.6-11.9-10.5-19.8-10.5s-15.4 3.9-19.8 10.5l-87 127.6L170.7 297c-4.6-5.7-11.5-9-18.7-9s-14.2 3.3-18.7 9l-64 80c-5.8 7.2-6.9 17.1-2.9 25.4s12.4 13.6 21.6 13.6h96 32H424c8.9 0 17.1-4.9 21.2-12.8s3.6-17.4-1.4-24.7l-120-176zM112 192a48 48 0 1 0 0-96 48 48 0 1 0 0 96z"/></svg>
					</span>
					<input type="text" placeholder="Start a new message" class="inputTxt">
					<span class="sendIco">
						<svg xmlns="assets/sns/images/icon-send.svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M16.1 260.2c-22.6 12.9-20.5 47.3 3.6 57.3L160 376V479.3c0 18.1 14.6 32.7 32.7 32.7c9.7 0 18.9-4.3 25.1-11.8l62-74.3 123.9 51.6c18.9 7.9 40.8-4.5 43.9-24.7l64-416c1.9-12.1-3.4-24.3-13.5-31.2s-23.3-7.5-34-1.4l-448 256zm52.1 25.5L409.7 90.6 190.1 336l1.2 1L68.2 285.7zM403.3 425.4L236.7 355.9 450.8 116.6 403.3 425.4z"/></svg>
					</span>
				</div>
			</section>
			
		</div>
  	</div>

  </div>
</body>

</html>