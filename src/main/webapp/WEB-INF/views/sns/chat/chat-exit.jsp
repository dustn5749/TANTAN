<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<div class="modal-overlay" onclick="closeChatModal('chat-exit-confirm-modal')"></div>

<div class="common-modal system-modal">
    <h6 class="system-modal-hd">채팅방 나가기</h6>
    <div class="system-modal-content">
        <p class="txt">${chatRoom.roomName}에서 나가시겠습니까?</p>
    </div>
    <div class="system-modal-btn-wrap">
        <button type="button" id='exitChatRoom' class="btn gray-btn" onclick="closeChatModal('chat-exit-confirm-modal');">취소</button>
        <button type="button" class="btn blue-btn" onclick="chatRoomOut(${chatRoom.roomNum})">확인</button>
    </div>
</div>

<script>

  function chatRoomOut(roomNum){
    $.ajax({
      url : '/chat/room/'+roomNum+'/out',
      method : 'POST',
      success : function (){
        closeChatModal('chat-exit-confirm-modal');
        closeChatModal('chat-view');
        openChatModal();
      }
    })

  }

  function exitChatRoom(roomNum){
    $.ajax({
      url : '/chat/room/'+roomNum,
      method : 'DELETE',
      success : function (data){
        closeChatModal('chat-exit-confirm-modal');
        closeChatModal('chat-view');
        openChatModal();
      }
    });
  }
</script>