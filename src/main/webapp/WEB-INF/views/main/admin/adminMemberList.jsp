<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Center the loader */
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
}
/* 아이콘과 페이지 번호 간격 조절 */
.customPageMoveBtn {
    margin-right: 10px; /* 아이콘과 페이지 번호 사이의 간격을 조절하세요. */
}

/* 페이지 번호 스타일 조정 (예시) */
.customPageNumberBtn {
    margin-right: 5px; /* 페이지 번호 간격 조절 예시 */
    cursor: pointer;  /* 커서 속성 추가해서 마우스 오버 시 포인터 모양으로 변경 */
}

/* 선택된 페이지 번호 스타일 조정 (예시) */
.customPageNumberBtn a strong {
    background-color: #007bff;
    color: #fff;
    padding: 5px 10px;
    border-radius: 5px;
}

</style>

</head>
<body>
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>회원관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">회원관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
   	<table id="memberGrid" style=text-align:center;></table>
   	<div id="paginate" style=text-align:center;></div>
  </div>

<script>
function hideLoadingMessage() {
    document.getElementById("loadingOverlay").style.display = "none";
}
var totalSize = 0; // 전역 변수로 총 데이터 수를 설정합니다.
var currentPage = 1;
var currentPage2 = 1;
var pageSize = 26;

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}

// 페이징 관련 함수를 초기화합니다.
function initPage(page) {
	currentPage = page;
    var totalPage = Math.ceil(totalSize / pageSize);

    var pageInner = "";

    if (page <= 1) {
        pageInner += "<span class='customPageMoveBtn'><i class='fa fa-fast-backward'></i></span>";
        pageInner += "<span class='customPageMoveBtn'><i class='fa fa-step-backward'></i></span>";
    } else {
        pageInner += "<span class='customPageMoveBtn'><a class='first' href='javascript:firstPage();' title='첫 페이지로 이동'><i class='fa fa-fast-backward faPointer'></i></a></span>";
        pageInner += "<span class='customPageMoveBtn'><a class='pre' href='javascript:prePage();' title='이전 페이지로 이동'><i class='fa fa-step-backward faPointer'></i></a></span>";
    }

    var pageCount = Math.min(totalPage, 10); // 페이지 개수를 전체 페이지 또는 10으로 제한

    var startPage = 1;
    if (page > 10) {
        startPage = Math.floor((page - 1) / 10) * 10 + 1;
    }
    var endPage = startPage + pageCount - 1;

    if (endPage > totalPage) {
        endPage = totalPage;
    }

    for (var i = startPage; i <= endPage; i++) {
        var titleGoPage = i + "페이지로 이동";
        if (i == page) {
            pageInner += "<span class='customPageNumberBtn'><a href='javascript:goPage(" + i + ");' id='" + i + "' title='" + titleGoPage + "'><strong>" + i + "</strong></a></span>";
        } else {
            pageInner += "<span class='customPageNumberBtn'><a href='javascript:goPage(" + i + ");' id='" + i + "' title='" + titleGoPage + "'>" + i + "</a></span>";
        }
    }

    if (page >= totalPage) {
        pageInner += "<span class='customPageMoveBtn'><i class='fa fa-step-forward'></i></span>";
        pageInner += "<span class='customPageMoveBtn'><i class='fa fa-fast-forward'></i></span>";
    } else {
        pageInner += "<span class='customPageMoveBtn'><a class='next' href='javascript:nextPage();' title='다음 페이지로 이동'><i class='fa fa-step-forward faPointer'></i></a></span>";
        pageInner += "<span class='customPageMoveBtn'><a class='last' href='javascript:lastPage();' title='마지막 페이지로 이동'><i class='fa fa-fast-forward faPointer'></i></a></span>";
    }

    $("#paginate").html("");
    $("#paginate").append(pageInner);
}

function loadGridData(page) {
    currentPage = page;  // 현재 페이지 업데이트
	console.log("loadGridData 함수 내 currentPage 값: " + currentPage);
    // Ajax 요청을 통한 데이터 로딩
    $.ajax({
        url: '/memberList',
        dataType: 'json',
        data: {
            pageNo: page,
            pageSize: pageSize
        },
        
        success: function (data) {
            console.log("로드 완료");
            console.log(data);
            totalSize = data.totalSize;
            $("#memberGrid").jqGrid('clearGridData', true).jqGrid('setGridParam', {
                data: data.memberList.memberList,
                datatype: 'local'
            }).trigger('reloadGrid');
            console.log(pageSize);
            console.log(currentPage);
            initPage(page); // 페이지 초기화

            hideLoadingMessage(); // 로딩 메시지 숨기기
        },
        error: function (error) {
            console.error("Error:", error);
        }
    });
}

//처음 페이지 로드 시 1페이지의 데이터를 불러오도록 설정
$(document).ready(function () {
    loadGridData(1);
});

// jqGrid 설정
$("#memberGrid").jqGrid({
    datatype: "json", // 데이터를 서버에서 가져오기
    url: '/memberList', // 데이터를 가져올 URL 설정 (컨트롤러 엔드포인트 URL로 변경해야 합니다.)
    mtype: 'GET', // HTTP 요청 방식 (GET 또는 POST)
    colNames: ['','아이디', '이름',  '이메일',  '정지유무', '신고횟수', '상태 변경'],
    colModel: [
    	{ name: 'nrow', index: 'nrow', width: 50, label: '행 번호', sortable: false, align: 'center' },
        { label: 'member_id', name: 'member_id', key: true, index: 'member_id' },
        { label: '이름', name: 'name', index: 'name' },
        { label: '이메일', name: 'email', index: 'email' },
        {
            label: '정지유무', name: 'status', index: 'status',
            formatter: function (cellValue, options, rowObject) {
                if (rowObject.status === 'Y') {
                    return '<span style="text-align:center; background-color: #FFCCCC; color:red; border: 1px solid #FF0000;">정지됨</span>';
                } else if (rowObject.status === 'N') {
                    return '<span style="background-color: #CCFFCC; color: green; border: 1px solid #008000;">활성화됨</span>';
                }
            },
            sortable: false
        },
        { label: '신고횟수', name: 'reportcnt', index: 'reportcnt' },
        { name: 'statusBtn', formatter: staOpt1, sortable: false }
    ],
    viewrecords: true,
    height: 690,
    autowidth: true,
    rowNum: 26,
    pager: '#paginate',
    pgtext: 'Page {0} of {1}',
    sortorder: 'desc',
    caption: '회원리스트',
    loadui: "enable",
    loadComplete: function (data) {
        var allRowsInGrid = jQuery('#memberGrid').jqGrid('getGridParam', 'records');
        $("#NoData").html("");
        if (allRowsInGrid == 0) {
            $("#NoData").html("<br>데이터가 없습니다.<br>");
        }

        initPage($("#memberGrid").getGridParam('page'));

        var allRow = jQuery("#memberGrid").jqGrid('getGridParam', 'records');
        if (allRow == 0) {
            $("#memberGrid > tbody").append("<tr><td align='center' colspan='10' style=''>조회된 데이터가 없습니다.</td></tr>");
        }
    },
});
loadGridData();
function staOpt1(cellvalue, options, rowObject) {
    var str = "";
    var row_id = options.rowId;
    var member_id = rowObject.member_id;
    var status = rowObject.status; // "status" 값 가져오기

    str += "<div class=\"btn-group\" style=\"text-align: center; display: flex; justify-content: center;\">";
    if (status === 'N') {
        // "status"가 'N'인 경우 "해제" 버튼 출력
        str += "<button type='button' class='btn btn-default btn-sm' onclick=\"javascript:fn_stop('" + row_id + "','" + member_id + "')\">정지</button>";
    } else {
        // 그 외의 경우 "정지" 버튼 출력
        str += "<button type='button' class='btn btn-default btn-sm' onclick=\"javascript:fn_release('" + row_id + "','" + member_id + "')\">해제</button>";
    }
    str += "</div>";
    return str;
}


function fn_stop(rowid, member_id) {
    if (confirm("정지하시겠습니까?")) {
        $.ajax({
            url: '/memberStop',
            dataType: 'json',
            data: {
                member_id: member_id
            },
            success: function (data) {
                console.log(data);
                alert("정지되었습니다.");
                loadGridData(1);
                // 정지 후에도 페이징 포커스 유지
                initPage(currentPage);
            }
        });

    }
}

function fn_release(rowid, member_id) {
    if (confirm("해제하시겠습니까?")) {
        $.ajax({
            url: '/memberRelease',
            dataType: 'json',
            data: {
                member_id: member_id
            },
            success: function (data) {
                console.log(data);
                alert("해제되었습니다.");
                loadGridData(1);
                // 해제 후에도 페이징 포커스 유지
                initPage(currentPage);
            }
        });
    }
}

//그리드 첫 페이지로 이동
function firstPage() {
    goPage(1);
}
//// 그리드 페이지로 이동
function goPage(num) {
    console.log("goPage 함수 호출: " + num);
    loadGridData(num);  
}
//그리드 이전 페이지로 이동
function prePage() {
    var newPage = currentPage - 10;
    
    if (newPage < 1) {
        // 새 페이지가 1보다 작으면 1로 설정
        newPage = 1;
    }

    goPage(newPage);
}

//그리드 다음 페이지로 이동
function nextPage() {
	currentPage = currentPage + 10;
    var totalPage = Math.ceil(totalSize / pageSize);

//         // 새 페이지가 총 페이지보다 크면 총 페이지로 설정
    if (currentPage > totalPage) {
        // 새 페이지가 총 페이지보다 크면 총 페이지로 설정
        currentPage = totalPage;
    }
    goPage(currentPage);
}

// 그리드 마지막 페이지로 이동
function lastPage() {
    var totalPage = Math.ceil(totalSize / $('#memberGrid').getGridParam('rowNum'));
    goPage(totalPage);
}


function fn_delete(rowid, member_id) {
    console.log("rowid는 " + rowid + " / member_id은 " + member_id + "입니다.");
    $("#click_result").html(str);
}
</script>
</body>
</html>