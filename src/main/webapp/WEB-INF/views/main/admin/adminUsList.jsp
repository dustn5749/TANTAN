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
  <link rel="stylesheet" href="admin/plugins/jsgrid/jsgrid.css">
  <link rel="stylesheet" href="admin/plugins/jsgrid/jsgrid-theme.min.css">
</head>
<body>
<!-- <div class="loading-overlay" id="loadingOverlay">Loading...</div> -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>동행관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" style=text-align:center;>동행관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
		<table id="usGrid"></table>
		<div id="paginate" style=text-align:center;></div>
  </div>

<script>
// function hideLoadingMessage() {
//     document.getElementById("loadingOverlay").style.display = "none";
// }

var totalSize = 0; // 전역 변수로 총 데이터 수를 설정합니다.
var currentPage = 1;
var pageSize = 30;

// function showPage() {
//     document.getElementById("loader").style.display = "none";
//     document.getElementById("myDiv").style.display = "block";
// }

// 페이징 관련 함수를 초기화합니다.
function initPage(page) {
    var pageCount = 10; // 한번에 보여줄 페이지 버튼 개수
    var totalPage = Math.ceil(totalSize / $('#usGrid').getGridParam('rowNum'));

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

function loadGridData(page) {
	currentPage = page;
    $.ajax({
        url: 'usList.do',
        dataType: 'json',
        data: {
            pageNo: page,
            pageSize: pageSize
        },
        success: function (data) {
            console.log(data);
            totalSize = data.totalSize;

            $("#usGrid").jqGrid('clearGridData', true).jqGrid('setGridParam', {
                data: data.usList.usList,
                datatype: 'local',
            }).trigger('reloadGrid');
            console.log("그리드 데이터:", $("#usGrid").jqGrid('getGridParam', 'data'));
            initPage(currentPage);

//             hideLoadingMessage();

        }
    });

}

//처음 페이지 로드 시 1페이지의 데이터를 불러오도록 설정
$(document).ready(function () {
    loadGridData(1);
});

// jqGrid 설정
$("#usGrid").jqGrid({
    datatype: "json", // 데이터를 서버에서 가져오기
    url: '/usList',
    colNames: ['','제목', '작성자', '등록일', '조회수', '여행지', '신고 횟수', '상태', '삭제 여부', 'us_num'],
    colModel: [
    	{ name: 'nrow', index: 'nrow', width: 50, label: '행 번호', sortable: false, align: 'center' },
        { label: 'title', name: 'title', index: 'title' },
        { label: '작성자', name: 'writer', index: 'writer' },
        { label: '등록일', name: 'regdate', index: 'regdate' },
        { label: '조회수', name: 'us_cnt', index: 'us_cnt' },
        { label: '여행지', name: 'doe_name', index: 'doe_name' },
        { label: '신고 횟수', name: 'reportcnt', index: 'reportcnt' },
        {
            label: '정지유무', name: 'status', index: 'status',
            formatter: function (cellValue, options, rowObject) {
                if (rowObject.status === 'Y') {
                    return '<span style="text-align:center; background-color: #FFCCCC; color:red; border: 1px solid #FF0000;">삭제됨</span>';
                } else if (rowObject.status === 'N') {
                    return '<span style="background-color: #CCFFCC; color: green; border: 1px solid #008000;">활성화됨</span>';
                }
            },
            sortable: false
        },
        { name: 'deleteBtn', formatter: formatOpt1, sortable: false },
        { name: 'us_num', index: 'us_num', hidden: true }
    ],
    viewrecords: true,
    autowidth: true,
    height: 690,
    rowNum: 26,
    pager: '#paginate',
    pgtext: 'Page {0} of {1}',
    sortorder: 'desc',
    caption: '동행리스트',
    loadui: "enable",
//     rownumbers: true,
    loadComplete: function (data) {
        var allRowsInGrid = jQuery('#usGrid').jqGrid('getGridParam', 'records');
        console.log("그리드 데이터 수:", allRowsInGrid);
        $("#NoData").html("");
        if (allRowsInGrid == 0) {
            $("#NoData").html("<br>데이터가 없습니다.<br>");
        }

        initPage($("#usGrid").getGridParam('page'));

        var allRow = jQuery("#usGrid").jqGrid('getGridParam', 'records');
        if (allRow == 0) {
            $("#usGrid > tbody").append("<tr><td align='center' colspan='10' style=''>조회된 데이터가 없습니다.</td></tr>");
        }
    }
});
loadGridData();
function formatOpt1(cellvalue, options, rowObject) {
    var str = "";
    var row_id = options.rowId;
    var us_num = rowObject.us_num;
    var status = rowObject.status;

    str += "<div class=\"btn-group\" style=\"text-align: center; display: flex; justify-content: center;\">";

    if (status === 'Y') {
        // status가 'Y'인 경우 복구 버튼 출력
        str += "<button type='button' class='btn btn-default btn-sm' onclick=\"javascript:fn_restore('" + row_id + "','" + us_num + "')\">복구</button>";
    } else {
        // status가 'N'인 경우 삭제 버튼 출력
        str += "<button type='button' class='btn btn-default btn-sm' onclick=\"javascript:fn_delete('" + row_id + "','" + us_num + "')\">삭제</button>";
    }

    str += "</div>";

    return str;
}

function fn_delete(rowid, us_num) {
    if (confirm("삭제하시겠습니까?")) {
        $.ajax({
            url: '/ausDelete',
            dataType: 'json',
            data: {
                us_num: us_num
            },
            success: function (data) {
                console.log(data);
                alert(data.message);
                loadGridData();
            }
        });
    }
}

function fn_restore(rowid, us_num) {
    if (confirm("복구하시겠습니까?")) {
        $.ajax({
            url: '/ausChange',
            dataType: 'json',
            data: {
                us_num: us_num
            },
            success: function (data) {
                console.log(data);
                alert(data.message);
                loadGridData();
            }
        });
    }
}

//그리드 첫 페이지로 이동
function firstPage() {
    goPage(1);
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

    if (currentPage > totalPage) {
        // 새 페이지가 총 페이지보다 크면 총 페이지로 설정
        currentPage = totalPage;
    }
    goPage(currentPage);
}

// 그리드 마지막 페이지로 이동
function lastPage() {
    var totalPage = Math.ceil(totalSize / $('#usGrid').getGridParam('rowNum'));
    goPage(totalPage);
}

//그리드 페이지로 이동
function goPage(num) {
    console.log("goPage 함수 호출: " + num);
    loadGridData(num);  
}

</script>

</body>
</html>