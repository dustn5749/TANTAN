<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>
<div class="modal-overlay" onclick="closeChatModal('chat-invite-modal')"></div>

<div class="common-modal narrow-modal">
    <!-- 닫기버튼 -->
    <button type="button" class="icon-btn close-btn" onclick="closeChatModal('chat-invite-modal')">
        <img src="<c:url value="/assets/sns/images/icon-close.svg"/>" alt="">
    </button>
    <!-- END 닫기버튼 -->

    <!-- 팝업 제목 -->
    <div class="common-modal-ttl">
        <h3>대화상대 선택</h3>
    </div>
    <!-- END 팝업 제목 -->

    <!-- 스크롤 영역 -->
    <div class="chat-modal-content">
        <!-- 친구이름 검색 -->
        <div class="friend-modal-hd">
            <input type="text" class="search-inp" placeholder="이름을 검색하세요.." />
        </div>
        <!-- END 친구이름 검색 -->

        <div class="gray-txt-wrap">
            <h6 class="gray-txt">친구 <span>${fn:length(friendList)}</span>명</h6>
        </div>

        <!-- 친구 목록 -->
        <div class="friend-list-grp">
            <!-- 친구 -->
            <!-- * 중요 * 아래의 checkbox input과 바로 뒤의 label 태그 friend-list는 세트 -->
            <c:forEach items="${friendList}" var="friend">
                <input type="checkbox" name="chat-friend" id="friend${friend.regId}" value="${friend.regId}" class="friend-list-checkbox">
                <label class="friend-list" for="friend${friend.regId}">
                    <!-- 친구 프사 & 이름 -->
                    <span class="person-item">
                <span class="mini-thumnail">
                  <img src="<c:url value="/assets/sns/images/profile-img.jpeg"/>" alt="">
                </span>
                <span class="person-profile">
                  <span class="name-wrap">
                    <span class="name">${empty friend.nickname ? friend.regId : friend.nickname}</span>
                      <!-- 블루뱃지 있을 경우 하단 주석을 푸세요 -->
                    <img src="<c:url value="/assets/sns/images/badge-certify.svg"/>" class="badge-certify" alt="">
                  </span>
                </span>
              </span>
                    <span class="checkbox"></span>
                    <!-- END 체크박스 -->
                </label>
            </c:forEach>
        </div>
        <!-- END 친구 목록 -->
    </div>
    <!-- END 스크롤 영역 -->

    <div class="chat-modal-bottom">
        <!-- 선택한 친구가 2명 이상이면 active 클래스가 추가됩니다. -->
        <button id="applyChatRoom" type="button" class="btn active confirm-btn chat-modal-confirm-btn" onclick="">확인</button>
        <button type="button" class="btn" onclick="closeChatModal('chat-invite-modal')">취소</button>
    </div>
</div>



<script type="text/javascript">
    $(function (){

        $('#applyChatRoom').on('click',function () {
          console.log(11);


          let selectedCheckboxes = $('.friend-list-checkbox:checked');
          // Get values of selected checkboxes
          let selectedValues = selectedCheckboxes.map(function() {
            return this.value;
          }).get();

          if (Array.isArray(selectedValues) &&  selectedValues.length > 0) {
            if (selectedValues.length > 1) {

              $('#chat-name-setting-modal').html(
                  `<div class="modal-overlay" onclick="closeNameSettingModal('chat-name-setting-modal')"></div>
                    <div class="common-modal narrow-modal namesetting-modal">
                        <!-- 제목 + 닫기버튼 -->
                        <div class="common-modal-top">
                            <h2 class="ttl">그룹채팅방 정보 설정</h2>
                            <div class="btn-wrap">
                                <!-- 닫기버튼 -->
                                <button type="button" class="icon-btn" onclick="closeNameSettingModal('chat-name-setting-modal')">
                                    <img src="/assets/sns/images/icon-close.svg" alt="">
                                </button>
                                <!-- END 닫기버튼 -->
                            </div>
                        </div>
                        <!-- END 제목 + 닫기버튼 -->

                        <div class="namesetting-modal-content">
                            <div class="participant-txt">
                                <%--                   <p>대화참여자 2명</p>--%>
                            </div>

                            <div class="inp-unit">
                                <input id="text-box" type="text" class="inp" maxlength="50">
                                <span class="unit">
                                  <span class="text-count">0</span><span>/50</span>
                                </span>
                            </div>

                            <div class="bottom-btn-wrap">
                                <button type="button" class="btn gray-btn" onclick="closeNameSettingModal('chat-name-setting-modal')">취소</button>
                                <button type="button" class="btn blue-btn active" id="chat-name-setting-modal-setting-btn">확인</button>
                            </div>
                        </div>
                    </div>`).addClass('active').on('click',
                        '#chat-name-setting-modal-setting-btn', function () {

                      let value = $('#text-box').val();
                      chatRegister(value, selectedValues);
                    });


            } else {
              chatRegister(null, selectedValues);
            }
          }
        })
    });
</script>
