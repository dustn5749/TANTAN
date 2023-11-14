<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="friend-list-grp">
  <!-- 친구 -->
  <!-- ↓ 만약에 활동중이면 status-active 클래스 달면 됨. status-active 클래스 달을 경우 좌측에 초록 동그라미가 뜸. -->
  <c:forEach items="${friendList}" var="friend">
    <div class="friend-list status-active">
      <!-- 친구 프사 & 이름 -->
      <div class="person-item">
        <figure class="mini-thumnail">
          <img src="<c:url value="/assets/sns/images/profile-img.jpeg"/>" alt="">
        </figure>
        <div class="person-profile">
          <div class="name-wrap">
            <h6 class="name">choi_seung_hyun_tttop</h6>
            <!-- 블루뱃지 -->
            <img src="<c:url value="/assets/sns/images/badge-certify.svg"/>" class="badge-certify" alt="">
          </div>
          <p class="intro-txt">소개글</p>
        </div>
      </div>
      <!-- END 친구 프사 & 이름 -->

      <!-- 메세지 보내기 & 삭제 버튼 -->
      <div class="btn-wrap">
        <button type="button" class="btn blue-btn">메세지 보내기</button>
        <button type="button" class="btn gray-btn">삭제</button>
      </div>
      <!-- END 메세지 보내기 & 삭제 버튼 -->
    </div>
  </c:forEach>
</div>