<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>

<c:forEach items="${chatRoomList}" var="chatRoom">
    <div id="chat-list${chatRoom}" class="chat-list" onclick="openChatDetailModal(${chatRoom.roomNum})">
        <figure class="mini-thumnail">
				 <img src="<c:url value="${chatRoom.profileImg}"/>" alt="">
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
