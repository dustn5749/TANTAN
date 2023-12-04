<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<div class="overlay" onclick="chatParticipants(${chatRoom.roomNum}, 'close');"></div>

<div class="container">
    <div class="container-hd">
        <!-- 제목 + 닫기버튼 -->
        <div class="common-modal-top">
            <div class="left-ttl-wrap">
                <div class="ttl">
                    <p>${chatRoom.roomName}</p>
                </div>
            </div>
            <div class="btn-wrap">
                <!-- 닫기버튼  -->
                <button type="button" class="icon-btn" onclick="chatParticipants(${chatRoom.roomNum},'close');">
                    <img src="<c:url value="/assets/sns/images/icon-close.svg"/>" alt="">
                </button>
                <!-- END 닫기버튼  -->
            </div>
        </div>
        <!-- END 제목 + 닫기버튼  -->
    </div>

    <div class="container-content">
        <div class="ptc-count-view">
            <span class="txt">현재 대화 참여자 ${fn:length(chatRoom.chatters)}명</span>
        </div>
        <div class="ptc-list-view">
            <div class="friend-list-grp">
                <c:forEach items="${chatRoom.chatters}" var="chatter">
                    <!-- 친구 -->
                    <div class="friend-list">
                        <!-- 친구 프사 & 이름 -->
                        <div class="person-item">
                            <figure class="mini-thumnail">
                                <img src="${empty chatter.profileImg ? "/assets/sns/images/profile-img-default.png" : chatter.profileImg}" alt="">
                            </figure>
                            <div class="person-profile">
                                <div class="name-wrap">
                                    <h6 class="name">${chatter.nickname}</h6>                                   
                                </div>
                            </div>
                        </div>
                        <!-- END 친구 프사 & 이름 -->

                        <!-- 버튼 -->
                        <c:if test="${principal.user.member_id == chatter.memberId}">
                            <div class="btn-wrap">
                                <button type="button" class="btn blue-btn" onclick="openExitModal(${chatRoom.roomNum})">나가기</button>
                            </div>
                        </c:if>

                        <!-- END 버튼 -->
                    </div>

                </c:forEach>
            </div>
        </div>
        <div class="ptc-btn-view">
            <button type="button" class="btn go-list-btn" onclick="chatParticipants(${chatRoom.roomNum},'go-list')">목록으로</button>
        </div>
    </div>
</div>

<script>
  function openExitModal(roomNum){
    $('#chat-exit-confirm-modal').load('/page/chat/exit?roomNum='+roomNum,function( ){
      $('#chat-exit-confirm-modal').addClass('active');
    })
  }
    $(function (){

    });
</script>