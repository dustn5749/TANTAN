<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>

<c:forEach items="${chatRoomList}" var="chatRoom">
    <div class="chat-list" onclick="openChatDetailModal(${chatRoom.roomNum})">
        <figure class="mini-thumnail">
            <img src="<c:url value="/assets/sns/images/profile-img-jessica.png"/>" alt="">
        </figure>
        <div class="chat-info-grp">
            <div class="chat-ttl-wrap">
                <p>${chatRoom.roomName}</p>
                <span class="num">${chatRoom.memberCnt}</span>
            </div>
            <p id='chat-txt${chatRoom.roomNum}' class="chat-txt">
                    ${chatRoom.lastText}
            </p>
            <div class="chat-date" >
                <span id='chat-date${chatRoom.roomNum}' class="txt">${chatRoom.lastTime}</span>
            </div>
        </div>
    </div>
</c:forEach>

<script type="text/javascript">
$(function (){

  const sock = new SockJS("<c:url value='/ws-stomp'/>");
  const ws = Stomp.over(sock);

  const subscribe = () => {
    subscription = ws.subscribe("<c:url value='/sub/chat/new/${principal.user.member_id}'/>"
        , message => {
          const recv = JSON.parse(message.body);
          recvNewChat(recv);
        }, {}
    );
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

  let subscription = null;


  ws.connect({}, function(frame) {
    //메시지 수신 이벤트 핸들러 등록
    subscribe();
  }, error => {
    // alert("error " + error);
  });

});
</script>