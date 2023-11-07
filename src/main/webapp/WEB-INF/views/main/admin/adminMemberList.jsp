<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="./Guriddo_jqGrid_JS_5.4.0-Trial/css/ui.jqgrid-bootstrap-ui.css"> -->
<!-- <link rel="stylesheet" href="./Guriddo_jqGrid_JS_5.4.0-Trial/css/ui.jqgrid-bootstrap.css"> -->
<!-- <link rel="stylesheet" href="./Guriddo_jqGrid_JS_5.4.0-Trial/css/ui.jqgrid-bootstrap4.css"> -->
<!-- <link rel="stylesheet" href="./Guriddo_jqGrid_JS_5.4.0-Trial/css/ui.jqgrid.css"> -->
<!-- <link rel="stylesheet" href="./jquery-ui-1.12.1.custom/jquery-ui.css"> -->
<!-- <link rel="stylesheet" href="./jquery-ui-1.12.1.custom/jquery-ui.structure.css"> -->
<!-- <link rel="stylesheet" href="./jquery-ui-1.12.1.custom/jquery-ui.theme.css"> -->
<!--   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script> -->
<style>
/* Center the loader */
#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 120px;
  height: 120px;
  margin: -76px 0 0 -76px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
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
</style>
</head>
<body onload="myFunction()">
<div id="loader"></div>
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
<!--     <section class="content"> -->
<!--       <div class="card"> -->
<!--         <div class="card-header"> -->
<!--           <h3 class="card-title">회원관리</h3> -->
<!--         </div> -->
        <!-- /.card-header -->
<!--         <div class="card-body"> -->
			<div style="display:none;" id="myDiv" class="animate-bottom">
	          	<table id="memberGrid"></table>
	<!--           </div> -->
	          	<div id="Pager"></div>
          	</div>
<!--           <div id="pager" style="height: 35px;"></div> -->
        <!-- /.card-body -->
<!--       </div> -->
<!--       /.card -->
<!--     </section> -->
    <!-- /.content -->
  </div>

<script>

var myVar;

function myFunction() {
  myVar = setTimeout(showPage, 400);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}

$(document).ready(function () {
    $.ajax({
        url: '/memberList', // 컨트롤러 엔드포인트 URL로 변경해야 합니다.
        dataType: 'json',
        success: function (data) {
            console.log(data); // 데이터가 제대로 수신되었는지 확인하기 위해 콘솔에 출력

            // jqGrid 설정
            $("#memberGrid").jqGrid({
                datatype: "local", // 데이터를 로컬에서 가져오기
                data: data.memberList, // JSON 데이터 배열
                colNames: ['아이디', '이름', '비밀번호', '전화번호', '이메일', '나이', '성별'],
                colModel: [
                    { label: 'member_id', name: 'member_id', key: true, index: 'member_id' },
                    { label: '이름', name: 'name', index: 'name' },
                    { label: '비밀번호', name: 'pwd', index: 'pwd' },
                    { label: '전화번호', name: 'phone', index: 'phone' },
                    { label: '이메일', name: 'email', index: 'email' },
                    { label: '나이', name: 'age', index: 'age' },
                    { label: '성별', name: 'gender', index: 'gender' }
                ],
                viewrecords: true,
                height: parent.$("#data_lst_area").height() - 55 - 29,
                autowidth:true,
                rowNum: 30,
                rowList: [30, 50, 100],
                pager: '#Pager',
                pgtext: 'Page {0} of {1}',
                sortorder: 'desc',
                caption: '회원리스트',
                loadui: "enable",
                loadComplete: function (data) {
                    var allRow = jQuery("#grid1").jqGrid('getGridParam', 'records');
                    if (allRow == 0) {
                        $("#grid1 > tbody").append("<tr><td align='center' colspan='10' style=''>조회된 데이터가 없습니다.</td></tr>");
                    }

                    var idArray = $("#grid1").jqGrid('getDataIDs');
                    for (var i = 0; i < idArray.length; i++) {
                        var ret = $("#grid1").getRowData(idArray[i]);
                        if (ret.finish_yn != "N") {
                            $("#jqg_grid_" + idArray[i]).attr("disabled", true);
                        }
                    }
                }
            });
        },
        error: function (error) {
            console.error("Error:", error);
        }
    });
});
</script>
</body>
</html>