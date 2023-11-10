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
            <h1>관리자 계정관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">관리자 계정관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <table id="adminList"></table>
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

$(document).ready(function () {
	setTimeout(function(){
		hideLoadingMessage();
		$('#paginate').show();
	}, 2000);
	//페이징 관련 함수를 초기화합니다.
	function initPage(currentPage) {
	    var pageCount = 10; // 한번에 보여줄 페이지 버튼 개수
	    var totalPage = Math.ceil(totalSize / $('#adminList').getGridParam('rowNum'));

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
	
	function loadGridData(){
		$("#paginate").hide();
		$.ajax({
			url:'adminList',
			dataType: 'json',
			data: {
				page: currentPage,
				pageSize: pageSize
			},
			success: function(data) {
				console.log(data);
				totalSize = data.adminList.length;
				
				$("#adminList").jqGrid('clearGridData', true).jqGrid('setGridParam',{
					data: data.adminList,
					datatype: 'local'
				}).trigger('reloadGrid');
				
				initPage(currentPage);
				
				hideLoadingMessage();
				
                $("#paginate").show();
			},
			error: function(error){
				console.error("Error:", error);
			}
		});
	}
	
    // jqGrid 설정
    $("#adminList").jqGrid({
    datatype: "local",
    colNames: ['아이디', '이름', '직위'],
    colModel: [
        { label: 'member_id', name: 'member_id', key: true, index: 'member_id' },
        { label: '이름', name: 'name', index: 'name' },
        {
            label: '직위', name: 'roles', index: 'roles',
            editable: true,
            edittype: 'select',
            editoptions: {
                dataUrl: '/getRoles', // 수정 필요 - 실제로 데이터를 가져오는 URL로 변경
                buildSelect: function (data) {
                    var response = JSON.parse(data);
                    var html = '<select>';
                    for (var i = 0; i < response.length; i++) {
                        html += '<option value="' + response[i].value + '">' + response[i].text + '</option>';
                    }
                    html += '</select>';
                    return html;
                }
            }
        }
    ],
    loadonce: true,
    viewrecords: true,
    autowidth: true,
    height: 690,
    rowNum: 30,
    rowList: [30, 50, 100],
    pager: '#paginate',
    pgtext: 'Page {0} of {1}',
    sortorder: 'desc',
    caption: '관리자리스트',
    loadui: "enable",
    rownumbers: true,
    loadComplete: function (data) {
        var allRowsInGrid = jQuery('#adminList').jqGrid('getGridParam', 'records');
        $("#NoData").html("");
        if (allRowsInGrid == 0) {
            $("#NoData").html("<br>데이터가 없습니다.<br>");
        }

        initPage($("#adminList").getGridParam('page'));

        var allRow = jQuery("#adminList").jqGrid('getGridParam', 'records');
        if (allRow == 0) {
            $("#adminList > tbody").append("<tr><td align='center' colspan='10' style=''>조회된 데이터가 없습니다.</td></tr>");
        }
    }
});
	loadGridData();
});
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