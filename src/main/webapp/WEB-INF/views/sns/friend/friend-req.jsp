<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="friend-list-grp">
    <!-- 친구 -->
    <c:forEach items="${friendList}" var="friend">
        <div class="friend-list">
            <!-- 친구 프사 & 이름 -->
            <div class="person-item">
                <figure class="mini-thumnail">
                    <img src="<c:url value="/assets/sns/images/profile-img-jessica.png"/>" alt="">
                </figure>
                <div class="person-profile">
                    <div class="name-wrap">
                        <h6 class="name">${friend.sendNickName}</h6>
                        <!-- 블루뱃지 -->
<%--                        <img src="<c:url value="/assets/sns/images/badge-certify.svg"/>" class="badge-certify" alt="">--%>
                    </div>
                    <p class="intro-txt">소개</p>
                </div>
            </div>
            <!-- END 친구 프사 & 이름 -->

            <!-- 확인 & 요청 삭제 버튼 -->
            <div class="btn-wrap">
                <button type="button" class="btn blue-btn">확인</button>
                <button type="button" class="btn gray-btn">요청 삭제</button>
            </div>
            <!-- END 확인 & 요청 삭제 버튼 -->
        </div>
    </c:forEach>
</div>