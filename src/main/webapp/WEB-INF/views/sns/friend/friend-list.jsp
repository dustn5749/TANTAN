<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="friend-list-grp">
  <!-- 친구 -->
  <!-- ↓ 만약에 활동중이면 status-active 클래스 달면 됨. status-active 클래스 달을 경우 좌측에 초록 동그라미가 뜸. -->
  <c:forEach items="${friendList}" var="friend">
    <div id='friend-list${friend.id}' class="friend-list">
      <!-- 친구 프사 & 이름 -->
      <div class="person-item">
        <figure class="mini-thumnail">
          <img src="<c:url value="${friend.profileImg}"/>" alt="">
        </figure>
        <div class="person-profile">
          <div class="name-wrap">
            <a href="/sns/profile/${friend.regId}">
              <h6 class="name">${empty friend.nickname ? friend.regId : friend.nickname}</h6>
            </a>
          </div>
          <p class="intro-txt">소개글</p>
        </div>
      </div>
      <!-- END 친구 프사 & 이름 -->

      <!-- 메세지 보내기 & 삭제 버튼 -->
      <div class="btn-wrap">
        <button type="button" class="btn blue-btn" onclick="chatRegister(null,'${friend.regId}')">메세지 보내기</button>
        <button type="button" class="btn gray-btn" onclick="friendDelete('${friend.id}')">삭제</button>
      </div>
      <!-- END 메세지 보내기 & 삭제 버튼 -->
    </div>
  </c:forEach>
</div>

<script>
  function friendDelete(deleteId){
    $.ajax({
      url : '/friend/'+deleteId,
      method : 'DELETE',
      success : function (){
        $('#friend-list'+deleteId).remove();
      }
    })
  }
</script>