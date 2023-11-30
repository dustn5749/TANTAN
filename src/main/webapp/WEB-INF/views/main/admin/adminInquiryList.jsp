<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* /* Center the loader */ */
/*         .loading-overlay { */
/*             position: fixed; */
/*             top: 0; */
/*             left: 0; */
/*             width: 100%; */
/*             height: 100%; */
/*             background: rgba(255, 255, 255, 0.7); */
/*             display: flex; */
/*             justify-content: center; */
/*             align-items: center; */
/*             z-index: 9999; */
/*         } */

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

  <!-- Content Wrapper. Contains page content body 부분-->
<!--   <div class="loading-overlay" id="loadingOverlay">Loading...</div> -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">1:1 문의하기</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">1:1 문의하기</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <table id="inquiryGrid" style=text-align:center;></table>
    <div id="paginate" style=text-align:center;></div>
    <!-- 모달 창 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">문의사항 상세 정보</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><strong>제목:</strong> <span id="modalTitle"></span></p>
                    <p><strong>내용:</strong> <span id="modalContent"></span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <!-- 수정 및 답변 버튼을 모달 창 내부로 이동 -->
                    <button type='button' class='btn btn-default btn-sm' onclick="javascript:showDetails('${rowObject.title}', '${rowObject.content}', ${rowObject.inquiry_num})">답변</button>

                    <button type="button" class="btn btn-success" id="modalReleaseBtn">수정</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="answerModal" tabindex="-1" role="dialog" aria-labelledby="answerModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="answerModalLabel">문의사항 답변</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p><strong>제목:</strong> <span id="answerModalTitle"></span></p>
                <p><strong>내용:</strong> <span id="answerModalContent"></span></p>
                <!-- 여기에 답변 입력 폼 등을 추가할 수 있습니다. -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <!-- 답변 전송 버튼 등을 추가할 수 있습니다. -->
            </div>
        </div>
    </div>
</div>
</div>
  <!-- /.content-wrapper -->

<script>
var totalSize = 0; // 전역 변수로 총 데이터 수를 설정합니다.
var currentPage = 1;
var pageSize = 30;

// 페이징 관련 함수를 초기화합니다.
function initPage(page) {
    var pageCount = 10;
    var totalPage = Math.ceil(totalSize / $('#inquiryGrid').getGridParam('rowNum'));

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
        url: '/inquiryList.do', // 컨트롤러 엔드포인트 URL로 변경해야 합니다.
        dataType: 'json',
        data: {
        	pageNo: page,
        	pageSize: pageSize
        },
        success: function (data) {
            console.log(data);
            totalSize = data.totalSize; // 데이터 수 업데이트

            $("#inquiryGrid").jqGrid('clearGridData', true).jqGrid('setGridParam', {
                data: data.inquiryList.inquiryList,
                datatype: 'local'
            }).trigger('reloadGrid');

            initPage(currentPage); // 페이지 초기화
            
//             hideLoadingMessage(); // 로딩 메시지 숨기기
            
            // 페이징 컴포넌트 다시 보이게 하기
        },
        error: function (error) {
            console.error("Error:", error);
        }
    });
}

// jqGrid 설정
$("#inquiryGrid").jqGrid({
    datatype: "local", // 데이터를 로컬에서 가져오기
    data: 'json',
    colNames: ['문의사항 번호','카테고리 번호', '카테고리', '작성자', '제목', '작성일', '답변유무', '답변'],
    colModel: [
        { label: '문의사항 번호', name: 'inquiry_num', key: true, index: 'inquiry_num' },
        { label: '카테고리 번호', name: 'category_num', index: 'category_num' },
        { label: '카테고리', name: 'category', index: 'category' },
        { label: '작성자', name: 'member_id', index: 'member_id' },
        { label: '제목', name: 'title', index: 'title' },
        { label: '작성일', name: 'regdate', index: 'regdate' },
        {
            label: '정지유무', name: 'answer_yn', index: 'answer_yn',
            formatter: function (cellValue, options, rowObject) {
                if (rowObject.answer_yn === 'N') {
                    return '<span style="text-align:center; background-color: #FFCCCC; color:red; border: 1px solid #FF0000;">미답변</span>';
                } else if (rowObject.answer_yn === 'Y') {
                    return '<span style="background-color: #CCFFCC; color: green; border: 1px solid #008000;">답변완료</span>';
                }
            },
            sortable: false
        },
//         { label: '신고횟수', name:'reportcnt', index: 'reportcnt'},
        { name: 'answerBtn', formatter: staOpt1, sortable: false}
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
    gridview: true,
    virtualScrolling: true,
    caption: '문의사항 리스트',
    loadui: "enable",
    loadComplete: function (data) {
//     	$("#memberGrid").setGridWidth($(window).width() );
        var allRowsInGrid = jQuery('#inquiryGrid').jqGrid('getGridParam', 'records');
        $("#NoData").html("");
        if (allRowsInGrid == 0) {
            $("#NoData").html("<br>데이터가 없습니다.<br>");
        }

        initPage($("#inquiryGrid").getGridParam('page'));

        var allRow = jQuery("#inquiryGrid").jqGrid('getGridParam', 'records');
        if (allRow == 0) {
            $("#inquiryGrid > tbody").append("<tr><td align='center' colspan='10' style=''>조회된 데이터가 없습니다.</td></tr>");
        }
    },
});
loadGridData();

function staOpt1(cellvalue, options, rowObject) {
    var str = "";
    var row_id = options.rowId;
    var inquiry_num = rowObject.inquiry_num;
    var answer_yn = rowObject.answer_yn;

    str += "<div class=\"btn-group\" style=\"text-align: center; display: flex; justify-content: center;\">";
    if (answer_yn === 'N') {
        str += "<button type='button' class='btn btn-default btn-sm' onclick=\"javascript:showDetails('" + rowObject.title + "', '" + rowObject.content + "')\">답변</button>";
    } else {
        str += "<button type='button' class='btn btn-default btn-sm' onclick=\"javascript:showDetails('" + rowObject.title + "', '" + rowObject.content + "')\">수정</button>";
    }
    str += "</div>";
    return str;
}


function fn_stop(rowid, inquiry_num) {
	if(confirm("정지하시겠습니까?")){
		$.ajax({
			url: '/memberStop',
			dataType: 'json',
			data: {
				inquiry_num: inquiry_num
			},
			success: function(data){
				console.log(data);
				alert("정지되었습니다.");
				loadGridData();
			}
		});
		
	}
}

function fn_release(rowid, inquiry_num) {
	if(confirm("해제하시겠습니까?")){
	$.ajax({
		url: '/memberRelease',
		dataType: 'json',
		data: {
			inquiry_num: inquiry_num
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
    var totalPage = Math.ceil(totalSize / $('#inquiryGrid').getGridParam('rowNum'));
    goPage(totalPage);
}

//그리드 페이지로 이동
function goPage(num) {
    console.log("goPage 함수 호출: " + num);
    loadGridData(num);  
}
function showDetails(title, content, inquiry_num) {
    alert(inquiry_num);
    $("#modalTitle").text(title);
    $("#modalContent").text(content);

    $("#modalAnswerBtn").off("click").on("click", function () {
        // "답변" 버튼 클릭 시 showAnswerModal을 호출할 때 inquiry_num 값을 전달합니다.
        showAnswerModal(inquiry_num);
        $("#myModal").modal("hide");
    });

    $("#modalReleaseBtn").off("click").on("click", function () {
        alert("수정 버튼 클릭");
        // 수정 버튼 클릭 시 모달창 띄우기
        $("#myModal").modal("show");
    });

    $("#myModal").modal("show");
}
function showAnswerModal(inquiry_num) {
    // AJAX를 사용하여 inquiry_num에 해당하는 문의사항 정보를 서버에서 가져옵니다.
    alert(inquiry_num);
    $.ajax({
        url: '/customer/detail', // 실제 컨트롤러 엔드포인트 URL로 변경해야 합니다.
        dataType: 'json',
        data: {
            inquiry_num: inquiry_num
        },
        success: function (data) {
        	
            // 서버에서 가져온 데이터를 사용하여 모달 내용을 업데이트합니다.
            var inquiryDetails = data.inquiryDetails; // 실제 데이터 구조에 따라 변경되어야 합니다.

            // 모달 내용 업데이트
            $("#answerModalTitle").text(inquiryDetails.title);
            $("#answerModalContent").text(inquiryDetails.content);

            // 답변 모달을 보여줍니다.
            $("#answerModal").modal("show");
        },
        error: function (error) {
            console.error("Error:", error);
        }
    });
}
</script>
</body>
</html>