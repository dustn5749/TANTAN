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
<div class="loading-overlay" id="loadingOverlay">Loading...</div>
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
var pageSize = 30;

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}

// 페이징 관련 함수를 초기화합니다.
function initPage(currentPage) {
    var pageCount = 10; // 한번에 보여줄 페이지 버튼 개수
    var totalPage = Math.ceil(totalSize / $('#memberGrid').getGridParam('rowNum'));

    var pageInner = "";

    if (currentPage <= 1) {
        pageInner += "<span class='customPageMoveBtn'><i class='fa fa-fast-backward'></i></span>";
        pageInner += "<span class='customPageMoveBtn'><i class='fa fa-step-backward'></i></span>";
    } else {
        pageInner += "<span class='customPageMoveBtn'><a class='first' href='javascript:firstPage();' title='첫 페이지로 이동'><i class='fa fa-fast-backward faPointer'></i></a></span>";
        pageInner += "<span class='customPageMoveBtn'><a class='pre' href='javascript:prePage();' title='이전 페이지로 이동'><i class='fa fa-step-backward faPointer'></i></a></span>";
    }

    var startPage = 1;
    if (currentPage > 10) {
        startPage = Math.floor((currentPage - 1) / 10) * 10 + 1;
    }
    var endPage = startPage + pageCount - 1;

    if (endPage > totalPage) {
        endPage = totalPage;
    }

    for (var i = startPage; i <= endPage; i++) {
        var titleGoPage = i + "페이지로 이동";
        if (i == currentPage) {
            pageInner += "<span class='customPageNumberBtn'><a href='javascript:goPage(" + i + ");' id='" + i + "' title='" + titleGoPage + "'><strong>" + i + "</strong></a></span>";
        } else {
            pageInner += "<span class='customPageNumberBtn'><a href='javascript:goPage(" + i + ");' id='" + i + "' title='" + titleGoPage + "'>" + i + "</a></span>";
        }
    }

    if (currentPage >= totalPage) {
        pageInner += "<span class='customPageMoveBtn'><i class='fa fa-step-forward'></i></span>";
        pageInner += "<span class='customPageMoveBtn'><i class='fa fa-fast-forward'></i></span>";
    } else {
        pageInner += "<span class='customPageMoveBtn'><a class='next' href='javascript:nextPage();' title='다음 페이지로 이동'><i class='fa fa-step-forward faPointer'></i></a></span>";
        pageInner += "<span class='customPageMoveBtn'><a class='last' href='javascript:lastPage();' title='마지막 페이지로 이동'><i class='fa fa-fast-forward faPointer'></i></a></span>";
    }

    $("#paginate").html("");
    $("#paginate").append(pageInner);
}

function loadGridData() {
	$("#paginate").hide();
    $.ajax({
        url: '/memberList', // 컨트롤러 엔드포인트 URL로 변경해야 합니다.
        dataType: 'json',
        data: {
        	page: currentPage,
        	pageSize: pageSize
        },
        success: function (data) {
            console.log(data);
            totalSize = data.memberList.length; // 데이터 수 업데이트

            $("#memberGrid").jqGrid('clearGridData', true).jqGrid('setGridParam', {
                data: data.memberList,
                datatype: 'local'
            }).trigger('reloadGrid');

            initPage(currentPage); // 페이지 초기화
            
            hideLoadingMessage(); // 로딩 메시지 숨기기
            
            // 페이징 컴포넌트 다시 보이게 하기
            $("#paginate").show();
        },
        error: function (error) {
            console.error("Error:", error);
        }
    });
}

// jqGrid 설정
$("#memberGrid").jqGrid({
    datatype: "local", // 데이터를 로컬에서 가져오기
    colNames: ['아이디', '이름', '전화번호', '이메일', '나이', '성별', '정지유무', '신고횟수','상태 변경'],
    colModel: [
        { label: 'member_id', name: 'member_id', key: true, index: 'member_id' },
        { label: '이름', name: 'name', index: 'name' },
        { label: '전화번호', name: 'phone', index: 'phone' },
        { label: '이메일', name: 'email', index: 'email' },
        { label: '나이', name: 'age', index: 'age' },
        { label: '성별', name: 'gender', index: 'gender' },
        { label: '정지유무', name: 'status', index: 'status'},
        { label: '신고횟수', name:'reportcnt', index: 'reportcnt'},
        { name: 'statusBtn', formatter: staOpt1, sortable: false}
//         { name: 'member_id', index: 'member_id', hidden: true}
    ],
    viewrecords: true,
    height: 690,
    autowidth: true,
    rowNum: 26,
    rownumbers: true,
    rowList: [30, 50, 100],
    pager: '#paginate',
    pgtext: 'Page {0} of {1}',
    sortorder: 'desc',
    caption: '회원리스트',
    loadui: "enable",
    loadComplete: function (data) {
//     	$("#memberGrid").setGridWidth($(window).width() );
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
	if(confirm("정지하시겠습니까?")){
		$.ajax({
			url: '/memberStop',
			dataType: 'json',
			data: {
				member_id: member_id
			},
			success: function(data){
				console.log(data);
				alert("정지되었습니다.");
				loadGridData();
			}
		});
		
	}
}

function fn_release(rowid, member_id) {
	if(confirm("해제하시겠습니까?")){
	$.ajax({
		url: '/memberRelease',
		dataType: 'json',
		data: {
			member_id: member_id
		},
		success: function(data){
			console.log(data);
			alert("해제되었습니다.");
			loadGridData()
			}
		});
	}
}

//그리드 첫 페이지로 이동
function firstPage() {
    $("#memberGrid").jqGrid('setGridParam', {
        page: 1
    }).trigger("reloadGrid");
}

//그리드 이전 페이지로 이동
function prePage() {
    var currentPage = $("#memberGrid").getGridParam('page');
    var pageCount = 30; // 한 페이지에 보여줄 데이터 수

    // 이전 10페이지로 이동
    var newPage = currentPage - 10;
    if (newPage < 1) newPage = 1;

    $("#memberGrid").jqGrid('setGridParam', {
        page: newPage
    }).trigger("reloadGrid");

    initPage(newPage);
}

//그리드 다음 페이지로 이동
function nextPage() {
    var currentPage = $("#memberGrid").getGridParam('page');
    var pageCount = 30; // 한 페이지에 보여줄 데이터 수

    // 다음 10페이지로 이동
    var newPage = currentPage + 10;
    var totalPage = Math.ceil(totalSize / $('#memberGrid').getGridParam('rowNum'));
    if (newPage > totalPage) newPage = totalPage;

    $("#memberGrid").jqGrid('setGridParam', {
        page: newPage
    }).trigger("reloadGrid");

    initPage(newPage);
}

// 그리드 마지막 페이지로 이동
function lastPage() {
    var totalPage = Math.ceil(totalSize / $('#memberGrid').getGridParam('rowNum'));
    $("#memberGrid").jqGrid('setGridParam', {
        page: totalPage
    }).trigger("reloadGrid");
}

//그리드 페이지로 이동
function goPage(num) {
    $("#memberGrid").jqGrid('setGridParam', {
        page: num
    }).trigger("reloadGrid");
}

function fn_delete(rowid, member_id) {
    console.log("rowid는 " + rowid + " / member_id은 " + member_id + "입니다.");
    $("#click_result").html(str);
}

</script>
</body>
</html>