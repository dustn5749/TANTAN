<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<script type="text/javascript">

// 채팅참여자 목록 모달 열고닫기 기능
function chatParticipants(roomNum,status) {
    var view = $('#chat-participants');
    view.load('/page/chat/participant?roomNum='+roomNum,function(){
      if (status === 'open') {
        if (view.hasClass('inactive')) {
          view.removeClass('inactive');
        }
        view.addClass('active');
      }

      if (status === 'close') {
        view.addClass('inactive');
      }

      if (status === 'go-list') {
        view.addClass('inactive');
        chatView('close');
      }
    });
}

// 채팅창 열고닫기 기능
function chatView(status) {
    var view = $('#chat-view');

    if (status === 'open') {
        view.addClass('active');
    }

    if (status === 'close') {
        view.removeClass('active');
    }
}

$(function (){
  // 채팅 초대 친구목록 2명 이상일 시 버튼 활성화
    $('input[name="chat-friend"]').change(function () {
        if ($('input:checkbox[name="chat-friend"]:checked').length >= 2) {
            $('.chat-modal-confirm-btn').addClass('active').attr('disabled', false);
        } else {
            $('.chat-modal-confirm-btn').removeClass('active').attr('disabled', true);
        }
    });

    // 대화 그룹대화 / 1:1대화 목록에서 탭버튼 활성화
    $(".common-tabs .tab").on('click', function () {
        var showTabContent = $(this).attr('data-show');
        var data = $(this).data('search-txt');

        $('.common-tabs .tab').removeClass('active');
        $(this).addClass('active');

        $('.common-tab-content').removeClass('active');

        let url = '/page/chat/1on1';

        if (showTabContent === 'tab-chat-group'){
          url = '/page/chat/group';
        }

        if(data && data !== '' && data !== 'undefined'){
          url = url + "?searchTxt="+data;
        }
        $('#' + showTabContent).load(url).addClass('active');
    });

  $('#tab-chat-group').load('/page/chat/group').addClass('active');

  $('#chatRoomSearchTxt').on('keydown',function (event){
    let value = $('#chatRoomSearchTxt').val();
    $('.common-tabs .tab.active').data({
      'search-txt' : value
    })
    if(event.keyCode === 13){
      $('.common-tabs .tab.active').trigger('click');
    }
  });

});

function openChatDetailModal(chatRoomId) {
  $('#chat-view').load('/page/chat/detail/'+chatRoomId).addClass('active');
}

</script>

<div class="modal-overlay" onclick="closeModal('chat-modal')"></div>

<div class="common-modal narrow-modal chat-modal-container">
    <!-- 채팅목록 -->
    <div id="chat-list" class="chat-list-wrapper">
        <div class="container">
            <div class="container-hd">
                <!-- 제목 + 닫기버튼 -->
                <div class="common-modal-top">
                    <h2 class="ttl">대화목록</h2>
                    <div class="btn-wrap">
                        <!-- 닫기버튼 -->
                        <button type="button" class="icon-btn" onclick="closeModal('chat-modal')">
                            <img src="<c:url value="/assets/sns/images/icon-close.svg"/>" alt="">
                        </button>
                        <!-- END 닫기버튼 -->
                    </div>
                </div>
                <!-- END 제목 + 닫기버튼 -->

                <!-- 친구이름 검색 & 채팅초대 버튼 -->
                <div class="common-search-inp-grp">
                    <input type="text" class="search-inp" placeholder="이름을 검색하세요.." id="chatRoomSearchTxt" />
                    <button class="btn" onclick="openInviteModal()">
                        <img src="<c:url value="/assets/sns/images/message-circle-plus.svg"/>" alt="" class="icon">
                    </button>
                </div>
                <!-- END 친구이름 검색 & 채팅초대 버튼 -->

                <!-- 그룹 대화 / 1:1 대화 탭 버튼 -->
                <div class="common-tabs">
                    <!-- ↓ 활성화된 탭은 active 달면 됨 -->
                    <div class="tab active" data-show="tab-chat-group">
                        <span class="txt-badge">그룹대화</span>
                    </div>
                    <div class="tab" data-show="tab-chat-private">
                        <span class="txt-badge">1:1 대화</span>
                    </div>
                </div>
                <!-- END 그룹 대화 / 1:1 대화 탭 버튼 -->
            </div>

            <div class="container-content">
                <!-- 탭/그룹대화) 그룹대화시 보이는 내용 -->
                <div id="tab-chat-group" class="common-tab-content chat-list-grp active">

                </div>

                <!-- 탭/1:1대화) 1:1 대화시 보이는 내용 -->
                <div id="tab-chat-private" class="common-tab-content chat-list-grp">

                </div>
            </div>
        </div>
    </div>
    <!-- END 채팅목록 -->

    <!-- 채팅창 -->
    <div id="chat-view" class="chat-view-wrapper">

    </div>
    <!-- END 채팅창 -->

    <!-- 채팅참여자 목록 -->
    <div id="chat-participants" class="chat-participants-wrapper">

    </div>
    <!-- END 채팅참여자 목록 -->
</div>