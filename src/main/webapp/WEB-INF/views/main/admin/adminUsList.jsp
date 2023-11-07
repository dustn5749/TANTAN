<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="admin/plugins/jsgrid/jsgrid.css">
  <link rel="stylesheet" href="admin/plugins/jsgrid/jsgrid-theme.min.css">
</head>
<body>

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
              <li class="breadcrumb-item active">동행관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
<!--     <section class="content"> -->
<!--       <div class="card"> -->
        <!-- /.card-header -->
<!--         <div class="card-body"> -->
<!--           <div id="usGrid" style=text-align:center;></div> -->
<!--         </div> -->
		<table id="usGrid"></table>
		<div id="Pager"></div>
        <!-- /.card-body -->
<!--       </div> -->
      <!-- /.card -->
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
        url: '/usListG', // 컨트롤러 엔드포인트 URL로 변경해야 합니다.
        dataType: 'json',
        success: function (data) {
            console.log(data); // 데이터가 제대로 수신되었는지 확인하기 위해 콘솔에 출력

            // jqGrid 설정
            $("#usGrid").jqGrid({
                datatype: "local", // 데이터를 서버에서 가져오기
                data: data.usList, // JSON 데이터 배열
                colNames: ['제목', '작성자', '등록일', '조회수', '여행지', '신고 횟수', '삭제 여부', 'us_num'],
                colModel: [
                    { label: 'title', name: 'title', index: 'title' },
                    { label: '작성자', name: 'writer', index: 'writer' },
                    { label: '등록일', name: 'regdate', index: 'regdate' },
                    { label: '조회수', name: 'us_cnt', index: 'us_cnt' },
                    { label: '여행지', name: 'city_name', index: 'city_name' },
                    { label: '신고 횟수', name: 'reportcnt', index: 'reportcnt' },
                    { name: 'deleteBtn', formatter: formatOpt1, sortable: false },
                    { name:'us_num', index: 'us_num', hidden: true}
                ],
                viewrecords: true,
                height: parent.$("#data_lst_area").height() - 55 - 29,
                autowidth: true,
                height: 690,
                rowNum: 30,
                rowList: [30, 50, 100],
                pager: '#Pager',
                pgtext: 'Page {0} of {1}',
                sortorder: 'desc',
                caption: '동행리스트',
                loadui: "enable",
                loadComplete: function (data) {
                    var allRow = jQuery("#usGrid").jqGrid('getGridParam', 'records');
                    if (allRow == 0) {
                        $("#usGrid > tbody").append("<tr><td align='center' colspan='10' style=''>조회된 데이터가 없습니다.</td></tr>");
                    }

                    var idArray = $("#usGrid").jqGrid('getDataIDs');
                    for (var i = 0; i < idArray.length; i++) {
                        var ret = $("#usGrid").getRowData(idArray[i]);
                        if (ret.finish_yn != "N") {
                            $("#jqg_grid_" + idArray[i]).attr("disabled", true);
                        }
                    }
                }
            });

            function formatOpt1(cellvalue, options, rowObject) {
                var str = "";
                var row_id = options.rowId;
                var us_num = rowObject.us_num;

                str += "<div class=\"btn-group\">";
                str += "<button type='button' class='btn btn-default btn-sm' onclick=\"javascript:fn_delete('" + row_id + "','" + us_num + "')\">삭제</button";
                str += "</div>";

                return str;
            }
        },
        error: function (error) {
            console.error("Error:", error);
        }
    });
});

function fn_delete(rowid, us_num) {
    var str = "rowid는 " + rowid + " / us_num은 " + us_num + "입니다.";
    console.log("rowid는 " + rowid + " / us_num은 " + us_num + "입니다.");
    $("#click_result").html(str);
}
</script>

</body>
</html>