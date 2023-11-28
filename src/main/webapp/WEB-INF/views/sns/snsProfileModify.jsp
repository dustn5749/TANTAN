<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="/assets/sns/css/profileReset.css">
    <link rel="stylesheet" href="/assets/sns/css/proflieStyle.css">
    <script src="/assets/js/jquery-3.6.1.min.js"></script>
    <style>
        .page-wrapper {
            margin: 0 atuo !important;
        }

        .page-wrapper-inner {
            margin: 0 auto;
            padding: 50px;

        }

        /* 프로필 편집 타이틀 부분 */
        .profile_title {
            width: 100%;
            justify-content: center;
            padding-bottom: 25px;
        }

        #profile_title_modify {
            font-size: 35px;
        }

        /* 프로필 이미지 부분 */
        .profile_img_name {
            position: relative;
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .img_area {
            width: 210px;
            /*    		align-content: center;
                       align-items: center;*/
            justify-content:
        }

        .thumbnail {
            width: 130px !important;
            margin-right: 10px !important;
            height: 130px !important;
            margin-left: 60px !important;
        }


        #nickname_area {
            font-size: 22px !important;
            font-weight: bold !important;
            margin-bottom: 5px;
        }

        /* 프로필 사진바꾸기 a태그 */
        .profile_img_modify {
            color: rgb(39, 176, 244);
        }

        .profile_img_modify:hover {
            color: rgb(2, 31, 148);
        }

        /* 각 설정별 행 div */
        .profile_menu {
            position: relative;
            display: flex;
            width: 100%;
            margin-bottom: 20px;

        }

        /* 설정 menu  */
        .profile_menu_title {
            width: 200px;
            text-align: right;
            margin-right: 20px;
        }

        .menu_bold {
            font-size: 22px !important;
            font-weight: bold !important;
            color: rgb(99, 98, 98) !important;
        }

        /* 설정 content */
        .detail_content {
            padding: 5px;

        }

        .input_area {
            justify-content: center;
            align-content: center;
            align-items: center;
            margin-bottom: 10px;
            font-size: 22px !important;
        }

        .input_area > input {
            margin-right: 10px;
        }

        /* 소개 textarea */
        #introduce {
            width: 500px;
            height: 300px;
        }

        /* 편집 나가기 div  */
        .btn_area {
            width: 100%;
            align-content: center;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin: 0 auto;
        }

        .back_btn {
            width: 180px;
            height: 40px;
            border: none;
            background-color: rgb(142, 191, 247);
            box-shadow: 1px 1px 1px 1px rgb(120, 180, 249);
            border-radius: 8px;
        }

        .back_btn:hover {
            background-color: rgb(21, 128, 249);
            color: white;
        }
    </style>
</head>

<body>
<div id="app">
    <!--좌측의 사이드바 -->
    <div class="sidebar-wrapper">
        <div class="sidebar">
            <div class="sidebar-inner">
                <div class="sidebar-menu">
                    <!--사이드바 버튼들 -->
                    <button type="button" class="sidebar-btn">
                        <img src="/assets/sns/images/icon-home.svg" alt="" class="icon">
                        <span class="txt">홈</span>
                    </button>
                    <button type="button" class="sidebar-btn">
                        <img src="/assets/sns/images/icon-brand-safari.svg" alt="" class="icon">
                        <span class="txt">일정</span>
                    </button>
                    <button type="button" class="sidebar-btn">
                        <img src="/assets/sns/images/icon-send.svg" alt="" class="icon">
                        <span class="txt">메세지</span>
                    </button>
                    <button type="button" class="sidebar-btn">
                        <img src="/assets/sns/images/icon-heart.svg" alt="" class="icon">
                        <span class="txt">알림</span>
                    </button>
                    <button type="button" class="sidebar-btn">
                        <figure class="mini-thumnail">
                            <img src="/assets/sns/images/profile-img.jpeg" alt="">
                        </figure>
                        <span class="txt">프로필</span>
                    </button>
                </div>

                <div class="sidebar-menu">
                    <button type="button" class="sidebar-btn">
                        <img src="/assets/sns/images/icon-list.svg" alt="" class="icon">
                        <span class="txt">더보기</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- 메인 컨텐츠 영역 -->
    <div class="page-wrapper">
        <!-- 메인 컨텐츠 하위 영역-->
        <div class="page-wrapper-inner">
            <!-- 프로필 편집 header  -->
            <div class="profile_title">
                <h1 id="profile_title_modify">프로필 편집</h1>
            </div>
            <!--프로필  상세 영역  -->
            <div class="profile_detaile">
                <!-- 프로필 사진 + 이름  -->
                <div class="profile_img_name">
                    <div class="img_area">
                        <figure class="thumbnail">
                            <img src="${member.profile_img}" alt="">
                        </figure>
                    </div>
                    <div class="name">
                        <h2>
                            <p id="nickname_area">${member.nickname}</p>
                        </h2>
                        <a class="profile_img_modify" href="#" onclick="modifyProfile();">프로필 사진 바꾸기</a>
                        <span style="display: none;"><input id="boardFile" type="file" name="file"></span>
                    </div>
                </div>

                <!-- 프로필 공개 설정  -->
                <div class="profile_menu">
                    <div class="profile_menu_title">
                        <p class="menu_bold">프로필 공개</p>
                    </div>
                    <div class="detail_content">
                        <div class="input_area" id="account">
                            <input type="radio" name="account_open_yn" value="y" checked>공개
                            <input type="radio" name="account_open_yn" value="n">비공개
                        </div>
                        <div class="detail_content_inner">
                            <p class="inner_text">링크 수정은 모바일에서만 가능합니다.<br> 앱으로 이동하여 프로필의 소개에서 웹사이트를 변경하여 수정하세요.</p>
                        </div>
                    </div>
                </div>

                <!-- 소개 -->
                <div class="profile_menu">
                    <div class="profile_menu_title">
                        <p class="menu_bold">소개</p>
                    </div>
                    <div class="detail_content">
                        <div class="input_area">
                            <textarea id="introduce" name="introduce"></textarea>
                        </div>
                    </div>
                </div>

                <!-- 성별 설정  -->
                <div class="profile_menu">
                    <div class="profile_menu_title">
                        <p class="menu_bold">성별</p>
                    </div>
                    <div class="detail_content">
                        <div class="input_area" id="gender">
                            <input type="radio" name="gender_open_yn" value="y" checked>공개
                            <input type="radio" name="gender_open_yn" value="n">비공개
                        </div>
                    </div>
                </div>


                <!-- 지역 설정  -->
                <div class="profile_menu">
                    <div class="profile_menu_title">
                        <p class="menu_bold">지역</p>
                    </div>
                    <div class="detail_content">
                        <div class="input_area" id="city">
                            <input type="radio" name="city_open_yn" value="y" checked>공개
                            <input type="radio" name="city_open_yn" value="n">비공개
                        </div>
                    </div>
                </div>

                <!-- 나이 설정  -->
                <div class="profile_menu">
                    <div class="profile_menu_title">
                        <p class="menu_bold">나이</p>
                    </div>
                    <div class="detail_content">
                        <div class="input_area" id="age">
                            <input type="radio" name="age_open_yn" value="y" checked>공개
                            <input type="radio" name="age_open_yn" value="n">비공개
                        </div>
                    d</div>
                </div>
            </div>
            <!-- 편집 나가기 버튼 -->
            <div class="btn_area">
                <button type="button" class="back_btn" onclick="ModifyComplete()">편집 끝내기</button>
            </div>
        </div>
    </div>
</div>

<script>
	function ModifyComplete() {
	    // 프로필 페이지로 리다이렉션
	    location.href = "/sns/profile/";
	}

  function modifyProfile(){
    $('#boardFile').trigger('click');

  }
  $(function(){
    $('#boardFile').on('change',function(){
      var file = this.files[0];

      // FormData 객체 생성
      var formData = new FormData();
      formData.append("file", file);

      $.ajax({
        url: "/sns/profile",  // 원하는 엔드포인트로 수정
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
  });
    <!--    특정속성을 가진 모든 텍스트영역을 내용이 잘리지 않기 위한 텍스트 영역을 자동으로 크기 조절해줌 -->
    $('textarea[data-autoresize]').each(function () {
        var offset = this.offsetHeight - this.clientHeight;

        var resizeTextarea = function (el) {
            $(el).css('height', 'auto').css('height', el.scrollHeight + offset);
        };

        $(this).on('keyup input', function () {
            resizeTextarea(this);
        }).removeAttr('data-autoresize');
    })

    <!--이 부분은 특정 클래스(toggle-icon-btn)를 가진 요소를 클릭할 때, 해당 요소의 활성/비활성 상태를 전환하도록 전환함. active 클래스를 토글하여 아이콘의 모양이 변경될 수 있음. -->
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

    function openModal(id) {
        $('#' + id).addClass('active');
    }

    function closeModal(id) {
        $('#' + id).removeClass('active');
    }

    /* 편집 끝내기 버튼(뒤로가기) */
    $(".back_btn").on("click", function () {
        location.href = "/snsProfile";
    })

</script>
</body>

</html>