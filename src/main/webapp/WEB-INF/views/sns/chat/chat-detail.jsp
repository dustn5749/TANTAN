<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<div class="container">
    <div class="container-hd">
        <!-- 뒤로가기버튼 + 제목 + 목록버튼 -->
        <div class="common-modal-top">
            <div class="left-ttl-wrap">
                <!-- 뒤로가기버튼 -->
                <button type="button" class="icon-btn" id='icon-btn-chat-view-close'>
                    <img src="<c:url value="/assets/sns/images/icon-chevron-left.svg"/>" alt="">
                </button>
                <!-- END 뒤로가기버튼 -->

                <div class="ttl">
                    <p>${chatRoom.roomName}</p>
                    <span id="chatter${chatRoom.roomNum}" class="num">${fn:length(chatter)}</span>
                </div>
            </div>
            <div class="btn-wrap">
                <!-- 목록버튼 -->
                <button type="button" class="icon-btn" onclick="chatParticipants(${chatRoom.roomNum},'open');">
                    <img src="<c:url value="/assets/sns/images/icon-list-black.svg"/>" alt="">
                </button>
                <!-- END 목록버튼 -->
            </div>
        </div>
        <!-- END 뒤로가기버튼 + 제목 + 목록버튼 -->
    </div>

    <div class="container-content">
        <!-- 채팅화면 -->
        <div id="chat-view-scroll" class="chat-view">
            <c:forEach items="${chatItemList}" var="item">
                <c:choose>
                    <c:when test="${item.messageType == 'MESSAGE'}">
                        <c:choose>
                            <c:when test="${principal.user.member_id == item.senderId}">
                                <div class="chat-bubble-wrapper send">
                                    <div class="chat-bubble-grp">
                                        <!-- 말풍선 & 보낸시간 -->
                                        <div class="chat-bubble">
                                            <div class="bubble-wrap">
                                                <div class="bubble">${item.contents}</div>
                                                <span class="date">${item.sendTimeStr}</span>
                                            </div>
                                        </div>
                                        <!-- END 말풍선 & 보낸시간 -->
                                    </div>
                                </div>

                            </c:when>
                            <c:otherwise>
                                <div class="chat-bubble-wrapper">
                                    <div class="chat-bubble-grp">
                                        <!-- 상대방 프사 (본인일 때는 안보임) -->
                                        <figure class="mini-thumnail">
                                            <img src="${empty item.profileImg ? "/assets/sns/images/profile-img-default.png" : item.profileImg}" alt="">
                                        </figure>
                                        <!-- END 상대방 프사 (본인일 때는 안보임) -->

                                        <!-- 말풍선 & 보낸시간 -->
                                        <div class="chat-bubble">
                                            <!-- 닉네임 (본인일 때는 안보임) -->
                                            <div class="name-wrap">
                                                <h6 class="name">${empty item.senderNickName ? item.senderId : item.senderNickName}</h6>
                                            </div>
                                            <!-- END 닉네임 (본인일 때는 안보임) -->

                                            <div class="bubble-wrap">
                                                <div class="bubble">${item.contents}</div>
                                                <span class="date">${item.sendTimeStr}</span>
                                            </div>
                                        </div>
                                        <!-- END 말풍선 & 보낸시간 -->
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </c:when>
                    <c:when test="${item.messageType == 'ENTER'}">
                        <div class="status-txt">
                           ${item.senderNickName}님이 들어왔습니다.
                        </div>
                    </c:when>
                    <c:when test="${item.messageType == 'LEAVE'}">
                        ${item.senderNickName}님이 나갔습니다.
                    </c:when>
                </c:choose>
            </c:forEach>
        </div>
        <!-- END 채팅화면 -->

        <!-- 채팅 입력 -->
        <div class="chat-create">
<!--             <button type="button" class="btn file-btn"> -->
<%--                 <img src="<c:url value="/assets/sns/images/icon-file-blue.svg"/>" alt=""> --%>
<!--             </button> -->

            <div class="create-wrap">
                  <textarea id="chat-textarea" rows="1" data-autoresize placeholder="대화를 입력하세요..."
                            class="textarea"></textarea>
                <button id="send-btn" type="button" class="btn send-btn" disabled>
                    <img src="<c:url value="/assets/sns/images/icon-send-before.svg"/>" alt="" class="icon icon-before">
                    <img src="<c:url value="/assets/sns/images/icon-send-after.svg"/>" alt="" class="icon icon-after">
                </button>
            </div>
        </div>
        <!-- END 채팅 입력 -->
    </div>
</div>

<script type="text/javascript">
$(function (){

      let id = '#chat-view-scroll';
      $(id).scrollTop($(id).prop("scrollHeight"));

      // 채팅창에서 입력할 때 높이 높아지는거
      $('#chat-textarea').on('input', function () {
        if ($(this).val()) {
          $(this).siblings('.send-btn').addClass('active');
          $(this).siblings('.send-btn').attr('disabled', false);
        } else {
          $(this).siblings('.send-btn').removeClass('active');
          $(this).siblings('.send-btn').attr('disabled', true);
        }
      });

      $('textarea[data-autoresize]').each(function () {
        let offset = this.offsetHeight - this.clientHeight;

        let resizeTextarea = function (el) {
          $(el).css('height', 'auto').css('height', el.scrollHeight + offset);
        };

        $(this).on('keyup input', function () { resizeTextarea(this); }).removeAttr('data-autoresize');
      })

      const sock = new SockJS("<c:url value='/ws-stomp'/>");
      const ws = Stomp.over(sock);
      const roomId = '${roomId}';
      const sender = '${principal.user.member_id}';

      let subscription = null;

      // pub/sub 이벤트 설정
      ws.connect({}, function(frame) {
        //메시지 수신 이벤트 핸들러 등록
        subscribe();
      }, error => {
        console.log("error " + error);
        //alert("error " + error);
      });

      $("#chat-textarea").on("keydown", e => {
        if (e.keyCode === 13) {
          sendMessage();
          return false;
        }

      });

      $("#send-btn").on("click", e => {
        sendMessage();
      });

      //메시지 수신 이벤트 핸들러 등록
      //구독을 등록한다
      const subscribe = () => {
        subscription = ws.subscribe("<c:url value='/sub/chat/room/${roomId}'/>"
            , message => {
              const recv = JSON.parse(message.body);
              recvMessage(recv);
            }, {sender:sender});
      }

      //메시지 수신를 해제 한다
      //구독을 해제한다
      const unsubscribe = () => {
        console.log("subscription", subscription);

        if(subscription != null) {
          subscription.unsubscribe();
          subscription = null;
        }
      }

      //채팅방에 입장한 사용자수
      const displayEnterUserCount = userCount => {
        $("#userCount").text(userCount);
      }

      //서버에 메시지를 전송한다
      const sendMessage = () => {
        let message = $("#chat-textarea").val();
        $.ajax({
          url : "<c:url value='/chat/message'/>",
          method : 'POST',
          data : JSON.stringify({messageType:'MESSAGE', roomNum:roomId, memberId:sender, contents: message}),
          contentType : 'application/json',
          success : function (){
            $("#chat-textarea").val("");
          }
        });
      };

      const recvMessage = recv =>  {

        if (recv.messageType === 'ENTER') {
          $(`<div class="status-txt">`).text((recv.senderNickName ? recv.senderId : recv.senderNickName)+"님이 들어왔습니다.").appendTo($('#chat-view-scroll'));

          let text = Number($('#chatter'+recv.roomNum).text());
          $('#chatter'+recv.roomNum).text(text+1);

        } else if(recv.messageType === 'LEAVE') {
          $(`<div class="status-txt">`).text((recv.senderNickName ? recv.senderId : recv.senderNickName)+"님이 나갔습니다.").appendTo($('#chat-view-scroll'));
          let text = Number($('#chatter'+recv.roomNum).text());
          $('#chatter'+recv.roomNum).text(text-1);
        } else {
          if(recv.senderId === sender){
            let element = $(`<div class="chat-bubble-wrapper send">
                <div class="chat-bubble-grp">
                    <!-- 말풍선 & 보낸시간 -->
                    <div class="chat-bubble">
                        <div class="bubble-wrap">

                        </div>
                    </div>
                    <!-- END 말풍선 & 보낸시간 -->
                </div>
            </div>`).appendTo($('#chat-view-scroll'));

            let dd = $(`<div class="bubble"></divㅇ`).text(recv.contents);
            let sendTimeStr = $(`<span class="date"></span>`).text(recv.sendTimeStr);

            element.find('.bubble-wrap').append(dd).append(sendTimeStr);
          } else {
            let imgurl = recv.profileImg;
            let element =
                    $(`<div class="chat-bubble-wrapper">\
                            <div class="chat-bubble-grp">\
                                <figure class="mini-thumnail">\
                                    <img src="`+recv.profileImg+`" alt="">\
                                </figure>\
                                <div class="chat-bubble">\
                                    <div class="name-wrap">\
                                    </div>\
                                    <div class="bubble-wrap">\
                                    </div>\
                                </div>\
                            </div>\
                        </div>`).appendTo($('#chat-view-scroll'));

            let name = $(`<h6 class="name"></h6>`).text(recv.senderNickName ? recv.senderNickName : recv.senderId);
            element.find('.name-wrap').append(name);

            let dd = $(`<div class="bubble"></div>`).text(recv.contents);
            let sendTimeStr = $(`<span class="date"></span>`).text(recv.sendTimeStr);

            element.find('.bubble-wrap').append(dd).append(sendTimeStr);
          }
          let id = '#chat-view-scroll';

          $(id).scrollTop($(id).prop("scrollHeight"));
        }
      }
      //채팅방의 정보를 얻는다

      $(window).on("beforeunload", e => {
        //구독을 해제 한다
        unsubscribe();
        ws.disconnect(() => {
          console.log("stomp 연결 종료")
        }, {});
      });

      $('#icon-btn-chat-view-close').on('click',function(){
        unsubscribe();
        chatView('close');
      });

    });


</script>