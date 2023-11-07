<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
<!--     <section class="content"> -->
<!--       <div class="card"> -->
<!--         <div class="card-header"> -->
<!--           <h3 class="card-title">회원관리</h3> -->
<!--         </div> -->
        <!-- /.card-header -->
<!--         <div class="card-body"> -->
          <table id="adminList"></table>
          <div id="Pager"></div>
<!--         </div> -->
        <!-- /.card-body -->
<!--       </div> -->
      <!-- /.card -->
<!--     </section> -->
    <!-- /.content -->
  </div>
<script>
$(document).ready(function () {
    $.ajax({
        url: '/adminList', // 컨트롤러 엔드포인트 URL로 변경해야 합니다.
        dataType: 'json',
        success: function (data) {
            console.log(data); // 데이터가 제대로 수신되었는지 확인하기 위해 콘솔에 출력

            // jqGrid 설정
            $("#adminList").jqGrid({
                datatype: "local", // 데이터를 로컬에서 가져오기
                data: data.adminList, // JSON 데이터 배열
                colNames: ['아이디', '이름', '비밀번호', '전화번호', '이메일', '나이', '성별', '직위'],
                colModel: [
                    { label: 'member_id', name: 'member_id', key: true, index: 'member_id' },
                    { label: '이름', name: 'name', index: 'name' },
                    { label: '비밀번호', name: 'pwd', index: 'pwd' },
                    { label: '전화번호', name: 'phone', index: 'phone' },
                    { label: '이메일', name: 'email', index: 'email' },
                    { label: '나이', name: 'age', index: 'age' },
                    { label: '성별', name: 'gender', index: 'gender' },
                    { label: '직위', name: 'roles', index: 'roles'}
                ],
                loadonce: true,
                viewrecords: true,
//                 height: 'auto',
                height: parent.$("#data_lst_area").height() - 55 - 29,
                autowidth:true,
                rowNum: 30,
                rowList: [30, 50, 100],
                pager: '#Pager',
                pgtext: 'Page {0} of {1}',
                sortorder: 'desc',
                caption: '관리자리스트',
                loadui: "enable",
                loadComplete: function (data) {
                    var allRow = jQuery("#adminList").jqGrid('getGridParam', 'records');
                    if (allRow == 0) {
                        $("#adminList > tbody").append("<tr><td align='center' colspan='10' style=''>조회된 데이터가 없습니다.</td></tr>");
                    }

                    var idArray = $("#adminList").jqGrid('getDataIDs');
                    for (var i = 0; i < idArray.length; i++) {
                        var ret = $("#adminList").getRowData(idArray[i]);
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
    $("#adminList").jqGrid('setFrozenColumns');
});
</script>

</body>
</html>