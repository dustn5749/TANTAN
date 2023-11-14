<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal-overlay" onclick="closeModal('friend-list-modal')"></div>

<div class="common-modal narrow-modal">
    <!-- 닫기버튼 -->
    <button type="button" class="icon-btn close-btn" onclick="closeModal('friend-list-modal')">
        <img src="<c:url value="/assets/sns/images/icon-close.svg"/>" alt="">
    </button>
    <!-- END 닫기버튼 -->

    <!-- 친구이름 검색 & 채팅초대 버튼 -->
    <div class="friend-modal-hd">
        <input type="text" class="search-inp" placeholder="이름을 검색하세요.." />
        <button class="btn" onclick="openModal('chat-invite-modal')">
            <img src="<c:url value="/assets/sns/images/message-circle-plus.svg"/>" alt="" class="icon">
        </button>
    </div>
    <!-- END 친구이름 검색 & 채팅초대 버튼 -->

    <!-- 친구 목록과 / 친구 요청 탭 버튼 -->
    <div class="friend-modal-tabs">
        <!-- ↓ 활성화된 탭은 active 달면 됨 -->
        <div class="friend-modal-tab active" data-show="tab-friend-list">
            <p>친구 <span>${friendSize}</span>명</p>
        </div>
        <div class="friend-modal-tab" data-show="tab-friend-invite">
            친구요청
        </div>
    </div>
    <!-- END 친구 목록과 / 친구 요청 탭 버튼 -->

    <!-- 친구 목록과 / 친구 요청 탭 컨텐츠 -->
    <div class="friend-modal-contents">
        <!-- 01) 친구목록 -->
        <div id="tab-friend-list" class="friend-modal-content">

        </div>
        <!-- END 01) 친구목록 -->

        <!-- 02) 친구요청 탭 -->
        <div id="tab-friend-invite" class="friend-modal-content">

        </div>
        <!-- END 02) 친구요청 -->
    </div>
    <!-- END 친구 목록과 / 친구 요청 탭 컨텐츠 -->
</div>
<script type="text/javascript">
    $(function(){

      $('#tab-friend-list').load('/page/friend/list').addClass('active');

      // 친구 목록에서 탭버튼 활성화
      $(".friend-modal-tab").on('click', function () {
        var showTabContent = $(this).attr('data-show');

        $('.friend-modal-tab').removeClass('active');
        $(this).addClass('active');

        $('.friend-modal-content').removeClass('active');

        if(showTabContent === 'tab-friend-list') {
          $('#tab-friend-list').load('/page/friend/list').addClass('active');
        } else {
          $('#tab-friend-invite').load('/page/friend/request').addClass('active');
        }

        // $('#' + showTabContent).addClass('active');
      });

    });
</script>