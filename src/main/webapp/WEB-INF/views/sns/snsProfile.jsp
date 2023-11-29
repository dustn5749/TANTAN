<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" as="style" crossorigin
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css"/>
    <link rel="stylesheet" href="<c:url value="/assets/sns/css/profileReset.css"/>">
    <link rel="stylesheet" href="<c:url value="/assets/sns/css/proflieStyle.css"/>">

    <script src="<c:url value="/assets/js/jquery-1.11.0.min.js"/>"></script>
</head>

<body>
<div id="app">

    <!--좌측의 사이드바 -->
    <div class="sidebar-wrapper">
        <div class="sidebar">
            <div class="sidebar-inner">
                <div class="sidebar-menu">
                    <!--사이드바 버튼들 -->
                    <button type="button" class="sidebar-btn active">
                        <img src="<c:url value="/assets/sns/images/icon-home.svg"/>" alt="" class="icon">
                        <span class="txt">홈</span>
                    </button>
                    <button type="button" class="sidebar-btn active">
                        <img src="<c:url value="/assets/sns/images/icon-brand-safari.svg"/>" alt="" class="icon">
                        <span class="txt">일정</span>
                    </button>
                    <button type="button" class="sidebar-btn active">
                        <img src="<c:url value="/assets/sns/images/icon-send.svg"/>" alt="" class="icon">
                        <span class="txt">메세지</span>
                    </button>
                    <button type="button" class="sidebar-btn active">
                        <img src="<c:url value="/assets/sns/images/icon-heart.svg"/>" alt="" class="icon">
                        <span class="txt">알림</span>
                    <button type="button" class="sidebar-btn active">
                        <figure class="mini-thumnail">
                            <img src="<c:url value="/assets/sns/images/profile-img.jpeg"/>" alt="">
                        </figure>
                        <span class="txt">프로필</span>
                    </button>
                </div>

                <div class="sidebar-menu">
                    <!--             <button type="button" class="sidebar-btn active"> -->
                    <!--               <img src="/assets/sns/images/icon-list.svg" alt="" class="icon"> -->
                    <!--               <span class="txt">더보기</span> -->
                    <!--             </button> -->
                </div>
            </div>
        </div>
    </div>
    <!-- 메인 컨텐츠 영역 -->
    <div class="page-wrapper">
        <!--상단 프로필 영역 -->
        <div class="page-container profile-page">
            <div class="profile-top">
                <!--상단 프로필 영역 중 왼쪽 부분 -->
                <div class="profile-top-left">
                    <figure class="thumbnail">

		               <c:choose>
			              <c:when test="${empty member.profile_img}">
			                 <img alt="" src="<c:url value="/assets/sns/images/profile-img-default.png"/>">
			              </c:when>
			              <c:otherwise>
			                 <img src="<c:out value='${member.profile_img}'/>" alt="">
			              </c:otherwise>
		           </c:choose>
                    </figure>

                    <div class="profile-info">
                        <div class="name">
                            <h2>
                                <span>${member.nickname}</span>
                            </h2>
                            <c:if test="${principal.user.member_id != member.member_id}">
                                <button type="button" class="btn solid-btn blue-btn" onclick="chatRegister(null,'${member.member_id}')">메세지 보내기</button>
                            </c:if>
                        </div>
                        <div class="info01">
                            <dl>
                                <dt>게시물</dt>
                                <dd>${fn:length(boardList)}</dd>
                            </dl>
                            <dl>
                                <dt>친구수</dt>
                                <dd>${fn:length(friendList)}</dd>
                            </dl>                            
                        </div>
                        <div class="info02">
                            <p>안녕하세요~</p>
                        </div>
                        <div class="btn-wrap">
                            <c:choose>
                                <c:when test="${principal.user.member_id == member.member_id}">
                                    <button type="button" class="btn solid-btn gray-btn" onclick="snsProfileModify()">프로필 편집</button>
                                </c:when>
                                <c:when test="${alreadyReq == true}">
                                    <button type="button" class="btn solid-btn gray-btn" onclick="">요청 중</button>
                                </c:when>
                                <c:otherwise>
                                    <button type="button" class="btn solid-btn blue-btn" onclick="requestFriend('${member.member_id}')">친구 추가</button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <!--상단 프로필 영역 중 오른쪽 부분 -->
                <div class="profile-top-right">
                    <div class="profile-info">
                        <div class="info03">
                            <dl>
                                <dt>나이</dt>
                                <dd>${member.age}세</dd>
                            </dl>
                            <dl>
                                <dt>성별</dt>
                                 <dd>${member.gender}</dd>
                            </dl>
                            <dl>
                                <dt>소개글</dt>
                                <dd>안녕하세요~</dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 프로필 영역 아래 부분 -->
            <div class="profile-bottom">
                <div class="btn-wrap">
                    <button type="button" id="collectionBtn" class="btn txt-btn blue-btn">+ 새 컬렉션</button>
                    <span style="display: none;"><input id="boardFile" type="file" name="file"></span>
                </div>

                <!--게시물 목록 영역 -->
                <div class="grid-wrapper">
                    <c:forEach items="${boardList}" var="board">
                        <div class="grid">
                            <!-- 각 이미지 카드를 클릭시 JS함수와 연결 -->
                            <figure class="feed-item-card" onclick="openBoardModal(${board.boardNum})">
                                <img src="${board.realName}" alt="" class="thumbnail-img">
                                <!-- 마우스 오버시 하트와 메시지 아이콘 표시 -->
                                <div class="overlay">
                                    <div class="overlay-content">
                                        <dl class="icon-heart-txt">
                                            <dt>
                                                <img src="/assets/sns/images/icon-heart-filled-white.svg" alt=""
                                                     class="icon">
                                            </dt>
                                            <dd>${board.likeCount}</dd>
                                        </dl>

                                        <dl class="icon-msg-txt">
                                            <dt>
                                                <img src="/assets/sns/images/icon-message-circle-filled-white.svg"
                                                     alt=""
                                                     class="icon">
                                            </dt>
                                            <dd>${board.commentCount}</dd>
                                        </dl>
                                    </div>
                                </div>
                            </figure>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div id="feed-modal" class="modal-wrapper"></div>

    <div id="feed-ctrl-modal" class="modal-wrapper">
        <div class="modal-overlay" onclick="closeModal('feed-ctrl-modal')"></div>

        <div class="common-modal ctrl-modal">
            <button type="button" class="btn red-txt bold-txt">삭제</button>
            <button type="button" class="btn">수정</button>
            <button type="button" class="btn" onclick="closeModal('feed-ctrl-modal')">취소</button>
        </div>
    </div>
</div>

<script>

  $(function(){
    $('#collectionBtn').on('click',function(){
      $('#boardFile').trigger('click');
    });
    $('#boardFile').on('change',function(){
      var file = this.files[0];

      // FormData 객체 생성
      var formData = new FormData();
      formData.append("file", file);

      $.ajax({
        url: "/boards/upload",  // 원하는 엔드포인트로 수정
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
          console.log("File uploaded successfully:", response);
          location.reload();
        },
        error: function(error) {
          console.error("Failed to upload the file:", error);
        }
      });
    });
  })

    $('textarea[data-autoresize]').each(function () {
        var offset = this.offsetHeight - this.clientHeight;

        var resizeTextarea = function (el) {
            $(el).css('height', 'auto').css('height', el.scrollHeight + offset);
        };

        $(this).on('keyup input', function () {
            resizeTextarea(this);
        }).removeAttr('data-autoresize');
    })

    <!-- 특정 클래스(toggle-icon-btn)를 가진 요소를 클릭할 때, 해당 요소의 활성/비활성 상태를 전환함. active 클래스를 토글하여 아이콘의 모양이 변경될 수 있음. -->
    $('.toggle-icon-btn').on('click', function () {
        $(this).toggleClass('active');
    })
    <!--댓글의 답글을 펼치고 접기,  -->
    $('.toggle-recomment-btn').each(function () {
        if ($(this).parent().hasClass('open')) {
            $(this).html('답글 모두 숨기기');
        } else {
            $(this).html('답글 보기(' + $(this).attr('data-count') + '개)');
        }

        $(this).on('click', function () {
            $(this).parent().toggleClass('open');
            if ($(this).parent().hasClass('open')) {
                $(this).html('답글 모두 숨기기');
            } else {
                $(this).html('답글 보기(' + $(this).attr('data-count') + '개)');
            }
        })
    })

    function openBoardModal(id) {
        $('#feed-modal').load("/sns/board/detail/" + id, () => {
            $('#feed-modal').addClass('active');
        });
    }

    function closeModal(id) {
        $('#' + id).removeClass('active');
    }
    
    function snsProfileModify() {
        // 프로필 편집 페이지로 리다이렉션
        location.href = "/sns/profile/modify";
    }
    

    function requestFriend(id){
      $.ajax({
        url : '/friend/request/'+id,
        method : 'POST',
        success : function (data) {
            location.reload();
        }
      })
      $('#' + id).removeClass('active');
    }

    function fileChange(){

      //$('#boardFile').
    }
</script>
</body>

</html>