<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>같이갈래?</title>

    <link rel="stylesheet" as="style" crossorigin
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css"/>
    <link rel="stylesheet" href="/assets/sns/css/profileReset.css">
    <link rel="stylesheet" href="/assets/sns/css/profileStyle.css">
    <link rel="stylesheet" href="/assets/sns/css/message.css">
    <link rel="stylesheet" href="/assets/sns/css/modal.css">
</head>

<body>
<div id="message-modal" class="pop">
    <!-- 모달 오버레이 -->
    <div class="modal-overlay" onclick="closeModal('message-modal')"></div>
    <div class="popDim"></div>
    <div class="popCont">
        <!-- 닫기버튼 -->
        <button type="button" class="icon-btn close-btn" onclick="closeModal('message-modal')">
            <img src="/assets/sns/images/icon-close.svg" alt="">
        </button>
        <!-- END 닫기버튼 -->

        <div class="messageWrap">
            <section class="left">
                <section class="messageArea">
                    <div class="top">
                        <span class="tit">Messages</span>
                        <button class="btn" onclick="openModal('chat-invite-modal')">
                            <img src="/assets/sns/images/message-circle-plus.svg" alt="" class="icon">
                        </button>
                    </div>
                    <div class="searchWrap1">
                        <input type="text" placeholder="닉네임 검색" class="inputTxt">
                    </div>
                    <div class="messageList">
                        <div class="messageDiv">
                            <div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
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
                            <div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
                            <div class="sumBox">
                                <p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
                                <p class="msg">머해?</p>
                            </div>
                        </div>
                        <div class="messageDiv">
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
                            <div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
                            <div class="sumBox">
                                <p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
                                <p class="msg">머해?</p>
                            </div>
                        </div>
                        <div class="messageDiv">
                            <div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
                            <div class="sumBox">
                                <p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
                                <p class="msg">머해?</p>
                            </div>
                        </div>
                        <div class="messageDiv">
                            <div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
                            <div class="sumBox">
                                <p class="nick">쥐<span class="">ㆍ</span><span class="time">3s</span></p>
                                <p class="msg">머해?</p>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="friendsList">
                    <div class="tab">
                        <button type="button" class="friend">
						    <span class="friendIcon">
						      <img src="/assets/sns/images/friendBtn.png" alt="친구 아이콘" class="icon2">
						    </span>
                        </button>
                    </div>
                    <div class="searchWrap2">
                        <input type="text" placeholder="닉네임 검색" class="inputTxt">
                    </div>
                    <div class="friendBox">
                        <div class="friendDiv">

                            <div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
                            <div class="friendInfo">
                                <p class="nick">Gee</p>
                                <p class="txt">Toni Kroos</p>
                                <button type="button" class="folBtn">
								    <span class="friendSendMsgBtn">
								      <img src="/assets/sns/images/sendMessageBtn.png" alt="전송 아이콘" class="icon">
								    </span>
                                </button>
                            </div>
                        </div>
                        <div class="friendDiv">

                            <div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
                            <div class="friendInfo">
                                <p class="nick">Gee</p>
                                <p class="txt">Toni Kroos</p>
                                <button type="button" class="folBtn">
								    <span class="friendSendMsgBtn">
								      <img src="/assets/sns/images/sendMessageBtn.png" alt="전송 아이콘" class="icon">
								    </span>
                                </button>
                            </div>
                        </div>

                        <div class="friendDiv">

                            <div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
                            <div class="friendInfo">
                                <p class="nick">Gee</p>
                                <p class="txt">Toni Kroos</p>
                                <button type="button" class="folBtn">
								    <span class="friendSendMsgBtn">
								      <img src="/assets/sns/images/sendMessageBtn.png" alt="전송 아이콘" class="icon">
								    </span>
                                </button>
                            </div>
                        </div>
                        <div class="friendDiv">

                            <div class="uImg"><img alt="" src="/assets/sns/images/mouse.jpg"></div>
                            <div class="friendInfo">
                                <p class="nick">Gee</p>
                                <p class="txt">Toni Kroos</p>
                                <button type="button" class="folBtn">
								    <span class="friendSendMsgBtn">
								      <img src="/assets/sns/images/sendMessageBtn.png" alt="전송 아이콘" class="icon">
								    </span>
                                </button>
                            </div>
                        </div>
                    </div>
                </section>
            </section>

            <section class="chatArea">
                <div class="top">

                    <h3>쥐</h3>

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

                <div class="message-container">
                    <button type="button" class="imgBtn">
				    <span class="addImg">
				      <img src="/assets/sns/images/sendMessageBtn.png" alt="이미지 아이콘" class="icon">
				    </span>
                    </button>
                    <div class="message-content">
                        <div class="input_area">
                            <textarea id="message_content" name="message_content" placeholder="내용을 입력하세요"></textarea>
                        </div>
                    </div>
                    <button type="button" class="sendMessageBtn">
				    <span class="sendIco">
				      <img src="/assets/sns/images/sendMessageBtn.png" alt="전송 아이콘" class="icon">
				    </span>
                    </button>
                </div>


            </section>

        </div>
    </div>

</div>


<script>
    function openModal(id) {
        $('#' + id).addClass('active');
    }

    function closeModal(id) {
        $('#' + id).removeClass('active');
    }
</script>

</body>

</html>