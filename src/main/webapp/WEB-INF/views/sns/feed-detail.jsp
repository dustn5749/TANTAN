<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--게시글 상세보기 -->

<!-- 모달 오버레이 -->
<div class="modal-overlay" onclick="closeModal('feed-modal')"></div>
<!-- 모달 닫기 버튼 -->
<button type="button" class="icon-btn close-btn" onclick="closeModal('feed-modal')">
    <img src="<c:url value="/assets/sns/images/icon-close-white.svg"/>" alt="">
</button>
<!-- 이전 항목으로 이동하는 버튼 -->
<button type="button" class="feed-ctrl-btn prev">
    <img src="<c:url value="/assets/sns/images/icon-chevron-left.svg"/>" alt="" class="icon">
</button>
<!-- 모달 내용 -->
<div class="common-modal feed-modal">
    <!-- 큰 이미지 컨테이너 -->
    <div class="lg-thumbnail-container">
        <!--큰 이미지-->
        <div class="lg-thumbnail">
            ${board}

            <c:if test="${board.files != null}">
                <div class="thumnail-img-box">
                    <img src="<c:url value="${board.files[0].uploadName}"/>" alt="">
                </div>
            </c:if>

            <!--저장하기 버튼 -->
            <div class="thumnail-ctrl-bar">
                <button type="button" class="icon-btn toggle-icon-btn">
                    <span class="txt-hidden">저장하기</span>
                    <img src="<c:url value="/assets/sns/images/icon-bookmark.svg"/>" alt="" class="icon icon-inactive">
                    <img src="<c:url value="/assets/sns/images/icon-bookmark-filled.svg"/>" alt=""
                         class="icon icon-active">
                </button>
            </div>
        </div>
    </div>
    <!--우측 댓글 영역 -->
    <div class="content-container">
        <!--컨테이너 상단의 게시물 작성자의 프로필 이미지와 닉네임, 뱃지 -->
        <div class="content-container-top">
            <div class="name-wrap">
                <figure class="mini-thumnail">
                    <img src="/assets/sns/images/profile-img.jpeg" alt="">
                </figure>
                <h4>choi_seung_hyun_tttop</h4>
                <img src="/assets/sns/images/badge-certify.svg" alt="" class="badge-certify">
            </div>

            <button type="button" class="btn icon-btn" onclick="openModal('feed-ctrl-modal')">
                <span class="txt-hidden">더보기</span>
                <img src="/assets/sns/images/icon-dots.svg" class="icon" alt="">
            </button>
        </div>
        <!--댓글 영역-->
        <div class="content-container-middle-bottom">
            <!--댓글 목록 영역-->
            <div class="content-container-middle">

                <c:choose>
                    <c:when test="${empty board.comments}">
                        <!-- 댓글이 없을 경우 -->
                        <div class="nothing">
                            <h5>아직 댓글이 없습니다.</h5>
                            <p>댓글을 남겨보세요</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div>
                            <ul class="comment-list-grp">
                                <!-- 댓글 들 -->
                                <li class="comment-list">
                                    <div class="comment-item-container">
                                        <div class="comment-item">
                                            <figure class="mini-thumnail">
                                                <img src="/assets/sns/images/profile-img.jpeg" alt="">
                                            </figure>
                                            <div class="comment-content">
                                                <div class="name-content-wrap">
                                                    <div class="name-wrap">
                                                        <h6 class="name">choi_seung_hyun_tttop</h6>
                                                        <img src="/assets/sns/images/badge-certify.svg"
                                                             class="badge-certify" alt="">
                                                    </div>
                                                    <p>내용입니다.</p>
                                                </div>
                                                <p class="status-wrap">
                                                    <span class="gray-txt">1주</span>
                                                    <span class="gray-txt">좋아요 1개</span>
                                                    <button type="button" class="gray-txt txt-btn">답글 달기</button>
                                                </p>
                                            </div>
                                            <div class="heart-wrap">
                                                <button type="button" class="icon-btn toggle-icon-btn">
                                                    <img src="/assets/sns/images/icon-heart.svg" alt=""
                                                         class="icon icon-inactive">
                                                    <img src="/assets/sns/images/icon-heart-filled-red.svg" alt=""
                                                         class="icon icon-active">
                                                </button>
                                            </div>
                                        </div>
                                        <div class="recomment-wrap">
                                            <!-- open 클래스 달리면 답댓글들 다 보임 -->
                                            <div class="recomment-top open">
                                                <button type="button" data-count="299"
                                                        class="toggle-recomment-btn gray-txt txt-btn">답글
                                                    보기(299개)
                                                </button>
                                            </div>

                                            <div class="recomment-bottom">
                                                <ul class="recomment-list-grp">
                                                    <!-- 답댓글 -->
                                                    <li class="recomment-list">
                                                        <div class="comment-item">
                                                            <figure class="mini-thumnail">
                                                                <img src="/assets/sns/images/profile-img.jpeg" alt="">
                                                            </figure>
                                                            <div class="comment-content">
                                                                <div class="name-content-wrap">
                                                                    <div class="name-wrap">
                                                                        <h6 class="name">choi_seung_hyun_tttop</h6>
                                                                        <img src="/assets/sns/images/badge-certify.svg"
                                                                             class="badge-certify" alt="">
                                                                    </div>
                                                                    <p>내용입니다.</p>
                                                                </div>
                                                                <p class="status-wrap">
                                                                    <span class="gray-txt">1주</span>
                                                                    <span class="gray-txt">좋아요 1개</span>
                                                                    <button type="button" class="gray-txt txt-btn">답글
                                                                        달기
                                                                    </button>
                                                                </p>
                                                            </div>
                                                            <div class="heart-wrap">
                                                                <button type="button" class="icon-btn toggle-icon-btn">
                                                                    <img src="/assets/sns/images/icon-heart.svg" alt=""
                                                                         class="icon icon-inactive">
                                                                    <img src="/assets/sns/images/icon-heart-filled-red.svg"
                                                                         alt="" class="icon icon-active">
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <!-- 답댓글 -->
                                                    <li class="recomment-list">
                                                        <div class="comment-item">
                                                            <figure class="mini-thumnail">
                                                                <img src="/assets/sns/images/profile-img.jpeg" alt="">
                                                            </figure>
                                                            <div class="comment-content">
                                                                <div class="name-content-wrap">
                                                                    <div class="name-wrap">
                                                                        <h6 class="name">choi_seung_hyun_tttop</h6>
                                                                        <img src="/assets/sns/images/badge-certify.svg"
                                                                             class="badge-certify" alt="">
                                                                    </div>
                                                                    <p>내용입니다.</p>
                                                                </div>
                                                                <p class="status-wrap">
                                                                    <span class="gray-txt">1주</span>
                                                                    <span class="gray-txt">좋아요 1개</span>
                                                                    <button type="button" class="gray-txt txt-btn">답글
                                                                        달기
                                                                    </button>
                                                                </p>
                                                            </div>
                                                            <div class="heart-wrap">
                                                                <button type="button" class="icon-btn toggle-icon-btn">
                                                                    <img src="/assets/sns/images/icon-heart.svg" alt=""
                                                                         class="icon icon-inactive">
                                                                    <img src="/assets/sns/images/icon-heart-filled-red.svg"
                                                                         alt="" class="icon icon-active">
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <!-- 답댓글 -->
                                                    <li class="recomment-list">
                                                        <div class="comment-item">
                                                            <figure class="mini-thumnail">
                                                                <img src="/assets/sns/images/profile-img-default.png"
                                                                     alt="">
                                                            </figure>
                                                            <div class="comment-content">
                                                                <div class="name-content-wrap">
                                                                    <div class="name-wrap">
                                                                        <h6 class="name">userhonggildong</h6>
                                                                    </div>
                                                                    <p>홍길동 유저의 댓글 내용입니다 홍길동 유저의 댓글 내용입니다 홍길동 유저의 댓글
                                                                        내용입니다 홍길동 유저의 댓글 내용입니다</p>
                                                                </div>
                                                                <p class="status-wrap">
                                                                    <span class="gray-txt">1주</span>
                                                                    <span class="gray-txt">좋아요 1개</span>
                                                                    <button type="button" class="gray-txt txt-btn">답글
                                                                        달기
                                                                    </button>
                                                                </p>
                                                            </div>
                                                            <div class="heart-wrap">
                                                                <button type="button" class="icon-btn toggle-icon-btn">
                                                                    <img src="/assets/sns/images/icon-heart.svg" alt=""
                                                                         class="icon icon-inactive">
                                                                    <img src="/assets/sns/images/icon-heart-filled-red.svg"
                                                                         alt="" class="icon icon-active">
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <!-- 댓글 -->
                                <li class="comment-list">
                                    <div class="comment-item-container">
                                        <div class="comment-item">
                                            <figure class="mini-thumnail">
                                                <img src="/assets/sns/images/profile-img-default.png" alt="">
                                            </figure>
                                            <div class="comment-content">
                                                <div class="name-content-wrap">
                                                    <div class="name-wrap">
                                                        <h6 class="name">user03</h6>
                                                    </div>
                                                    <p>장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다.
                                                        장문의 내용입니다. 장문의 내용입니다.
                                                        장문의 내용입니다.</p>
                                                </div>
                                                <p class="status-wrap">
                                                    <span class="gray-txt">1주</span>
                                                    <span class="gray-txt">좋아요 1개</span>
                                                    <button type="button" class="gray-txt txt-btn">답글 달기</button>
                                                </p>
                                            </div>
                                            <div class="heart-wrap">
                                                <button type="button" class="icon-btn toggle-icon-btn">
                                                    <img src="/assets/sns/images/icon-heart.svg" alt=""
                                                         class="icon icon-inactive">
                                                    <img src="/assets/sns/images/icon-heart-filled-red.svg" alt=""
                                                         class="icon icon-active">
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <!-- 댓글 -->
                                <li class="comment-list">
                                    <div class="comment-item-container">
                                        <div class="comment-item">
                                            <figure class="mini-thumnail">
                                                <img src="/assets/sns/images/profile-img.jpeg" alt="">
                                            </figure>
                                            <div class="comment-content">
                                                <div class="name-content-wrap">
                                                    <div class="name-wrap">
                                                        <h6 class="name">choi_seung_hyun_tttop</h6>
                                                        <img src="/assets/sns/images/badge-certify.svg"
                                                             class="badge-certify" alt="">
                                                    </div>
                                                    <p>내용입니다.</p>
                                                </div>
                                                <p class="status-wrap">
                                                    <span class="gray-txt">1주</span>
                                                    <span class="gray-txt">좋아요 1개</span>
                                                    <button type="button" class="gray-txt txt-btn">답글 달기</button>
                                                </p>
                                            </div>
                                            <div class="heart-wrap">
                                                <button type="button" class="icon-btn toggle-icon-btn">
                                                    <img src="/assets/sns/images/icon-heart.svg" alt=""
                                                         class="icon icon-inactive">
                                                    <img src="/assets/sns/images/icon-heart-filled-red.svg" alt=""
                                                         class="icon icon-active">
                                                </button>
                                            </div>
                                        </div>
                                        <div class="recomment-wrap">
                                            <!-- open 클래스 달리면 답댓글들 다~보임 -->
                                            <div class="recomment-top">
                                                <button type="button" data-count="4"
                                                        class="toggle-recomment-btn gray-txt txt-btn">답글 보기(4개)
                                                </button>
                                            </div>

                                            <div class="recomment-bottom">
                                                <ul class="recomment-list-grp">
                                                    <!-- 답댓글 -->
                                                    <li class="recomment-list">
                                                        <div class="comment-item">
                                                            <figure class="mini-thumnail">
                                                                <img src="/assets/sns/images/profile-img.jpeg" alt="">
                                                            </figure>
                                                            <div class="comment-content">
                                                                <div class="name-content-wrap">
                                                                    <div class="name-wrap">
                                                                        <h6 class="name">choi_seung_hyun_tttop</h6>
                                                                        <img src="/assets/sns/images/badge-certify.svg"
                                                                             class="badge-certify" alt="">
                                                                    </div>
                                                                    <p>내용입니다.</p>
                                                                </div>
                                                                <p class="status-wrap">
                                                                    <span class="gray-txt">1주</span>
                                                                    <span class="gray-txt">좋아요 1개</span>
                                                                    <button type="button" class="gray-txt txt-btn">답글
                                                                        달기
                                                                    </button>
                                                                </p>
                                                            </div>
                                                            <div class="heart-wrap">
                                                                <button type="button" class="icon-btn toggle-icon-btn">
                                                                    <img src="/assets/sns/images/icon-heart.svg" alt=""
                                                                         class="icon icon-inactive">
                                                                    <img src="/assets/sns/images/icon-heart-filled-red.svg"
                                                                         alt="" class="icon icon-active">
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <!-- 답댓글 -->
                                                    <li class="recomment-list">
                                                        <div class="comment-item">
                                                            <figure class="mini-thumnail">
                                                                <img src="/assets/sns/images/profile-img.jpeg" alt="">
                                                            </figure>
                                                            <div class="comment-content">
                                                                <div class="name-content-wrap">
                                                                    <div class="name-wrap">
                                                                        <h6 class="name">choi_seung_hyun_tttop</h6>
                                                                        <img src="/assets/sns/images/badge-certify.svg"
                                                                             class="badge-certify" alt="">
                                                                    </div>
                                                                    <p>내용입니다.</p>
                                                                </div>
                                                                <p class="status-wrap">
                                                                    <span class="gray-txt">1주</span>
                                                                    <span class="gray-txt">좋아요 1개</span>
                                                                    <button type="button" class="gray-txt txt-btn">답글
                                                                        달기
                                                                    </button>
                                                                </p>
                                                            </div>
                                                            <div class="heart-wrap">
                                                                <button type="button" class="icon-btn toggle-icon-btn">
                                                                    <img src="/assets/sns/images/icon-heart.svg" alt=""
                                                                         class="icon icon-inactive">
                                                                    <img src="/assets/sns/images/icon-heart-filled-red.svg"
                                                                         alt="" class="icon icon-active">
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <!-- 댓글 -->
                                <li class="comment-list">
                                    <div class="comment-item-container">
                                        <div class="comment-item">
                                            <figure class="mini-thumnail">
                                                <img src="/assets/sns/images/profile-img-default.png" alt="">
                                            </figure>
                                            <div class="comment-content">
                                                <div class="name-content-wrap">
                                                    <div class="name-wrap">
                                                        <h6 class="name">user03</h6>
                                                    </div>
                                                    <p>장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다. 장문의 내용입니다.
                                                        장문의 내용입니다. 장문의 내용입니다.
                                                        장문의 내용입니다.</p>
                                                </div>
                                                <p class="status-wrap">
                                                    <span class="gray-txt">1주</span>
                                                    <span class="gray-txt">좋아요 1개</span>
                                                    <button type="button" class="gray-txt txt-btn">답글 달기</button>
                                                </p>
                                            </div>
                                            <div class="heart-wrap">
                                                <button type="button" class="icon-btn toggle-icon-btn">
                                                    <img src="/assets/sns/images/icon-heart.svg" alt=""
                                                         class="icon icon-inactive">
                                                    <img src="/assets/sns/images/icon-heart-filled-red.svg" alt=""
                                                         class="icon icon-active">
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </c:otherwise>

                </c:choose>


                <!-- 댓글이 있을 경우 -->

            </div>

            <div class="content-container-bottom">
                <div class="comment-opt-bar display-flex f-space-between gap-20">
                    <div class="display-flex gap-15">
                        <!-- 눌렀을 시 active 클래스 토글 -->
                        <button type="button" class="btn icon-btn toggle-icon-btn">
                            <span class="txt-hidden">좋아요</span>
                            <img src="/assets/sns/images/icon-heart.svg" class="icon icon-inactive" alt="">
                            <img src="/assets/sns/images/icon-heart-filled.svg" class="icon icon-active" alt="">
                        </button>
                        <button type="button" class="btn icon-btn">
                            <span class="txt-hidden">댓글</span>
                            <img src="/assets/sns/images/icon-message-circle.svg" class="icon icon-inactive"
                                 alt="">
                        </button>
                        <!--                   <button type="button" class="btn icon-btn"> -->
                        <!--                     <span class="txt-hidden">메세지</span> -->
                        <!--                     <img src="/assets/sns/images/icon-send.svg" class="icon icon-inactive" alt=""> -->
                        <!--                   </button> -->
                    </div>
                    <div class="display-flex gap-15">
                        <!-- 눌렀을 시 active 클래스 토글 -->
                        <button type="button" class="btn icon-btn toggle-icon-btn">
                            <span class="txt-hidden">저장됨</span>
                            <img src="/assets/sns/images/icon-bookmark.svg" class="icon icon-inactive" alt="">
                            <img src="/assets/sns/images/icon-bookmark-filled.svg" class="icon icon-active"
                                 alt="">
                        </button>
                    </div>
                </div>
                <!-- 좋아요 있을 경우 -->
                <!-- <div class="comment-status-bar">
                  <p class="txt"><b>좋아요 200개</b></p>
                  <p class="sm-txt gray-txt">3시간 전</p>
                </div> -->
                <!-- 좋아요 없을 경우 -->
                <div class="comment-status-bar">
                    <p class="txt">가장 먼저 <b>좋아요</b>를 눌러보세요</p>
                    <p class="sm-txt gray-txt">3시간 전</p>
                </div>
                <div class="create-comment-bar">
                    <figure class="mini-thumnail">
                        <img src="/assets/sns/images/profile-img.jpeg" alt="">
                    </figure>
                    <textarea data-autoresize placeholder="댓글 달기..." rows="1" class="txtarea"></textarea>
                    <button type="button" class="btn txt-btn">게시</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 우측상단 게시물 상세 편집 버튼 -->
<button type="button" class="feed-ctrl-btn next">
    <img src="/assets/sns/images/icon-chevron-right.svg" alt="" class="icon">
</button>
</div>
