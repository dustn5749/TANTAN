<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri= "http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
  $(function(){

  });

  function readAll(){
    $.ajax({
      url : '/alim/read',
      method : 'PUT',
      success : function (data){
        alert('알림을 전부 확인 했습니다.');
        closeModal('alarm-modal');
      }
    });
  }

  function readAlim(id){
    $.ajax({
      url : '/alim/read/'+id,
      method : 'PUT',
      success : function (data){
        $('#alim'+id).remove();
        // alert('알림을 전부 확인 했습니다.');
        //closeModal('alarm-modal');
      }
    });
  }
</script>

<div class="modal-overlay" onclick="closeModal('alarm-modal')"></div>
<div class="common-modal narrow-modal w-400">
  <!-- 제목 + 닫기버튼 -->
  <div class="common-modal-top">
    <h2 class="ttl">알림</h2>
    <div class="btn-wrap">
      <!-- 비우기버튼 -->
      <button type="button" class="icon-btn" onclick="readAll()">
        <img src="<c:url value="/assets/sns/images/icon-trash.svg"/>" alt="">
      </button>
      <!-- END 비우기버튼 -->
      <!-- 닫기버튼 -->
      <button type="button" class="icon-btn" onclick="closeModal('alarm-modal')">
        <img src="<c:url value="/assets/sns/images/icon-close.svg"/>" alt="">
      </button>
      <!-- END 닫기버튼 -->
    </div>
  </div>
  <!-- END 제목 + 닫기버튼 -->

  <!-- 알림 모달 내용들 -->
  <div class="alarm-modal-contents">
    <!-- 날짜 + 알림 목록들 -->
    <div class="alarm-content">
      <!-- 날짜 -->
<%--      <div class="alarm-list-grp-top-ttl">어제</div>--%>
      <!-- END 날짜 -->
      <!-- 알림 목록들 -->
      <div class="alarm-list-grp">
        <!-- 알람 리스트 -->
        <c:forEach items="${alimList}" var="alim">
        <div id='alim${alim.alimId}' class="alarm-list">
            <div class="alarm-item">
              <figure class="mini-thumnail">
                <img src="<c:url value="${alim.profileImg}"/>" alt="">
              </figure>

              <div class="alarm-txt-grp">
                <p class="txt">
                <span class="name">
                ${alim.nickname}
                </span>
                  ${alim.content}
                </p>
                <span class="date">${alim.time}</span>
              </div>
            </div>

            <c:if test="">

            </c:if>
            <img src="<c:url value="/assets/sns/images/thumbnail-img03.png"/>" alt="" class="alarm-preview-img">

            <button type="button" class="alarm-del-btn" onclick="readAlim('${alim.alimId}')">
              <span class="txt-hidden">이 알람 삭제</span>
              <img src="<c:url value="/assets/sns/images/icon-trash-white.svg"/>" alt="">
            </button>
        </div>
        </c:forEach>
        <!-- END 알람 리스트 -->
      </div>
      <!-- END 알림 목록들 -->
    </div>
    <!-- END 날짜 + 알림 목록들 -->
  </div>
  <!-- END 알림 모달 내용들 -->
</div>