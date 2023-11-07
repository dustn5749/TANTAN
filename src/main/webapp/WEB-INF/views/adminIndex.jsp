<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="ko" >
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>관리자 페이지</title>

  <!-- Google Font: Source Sans Pro -->
<!--   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"> -->
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="admin/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="admin/css/adminlte.min.css">
    <!-- jsGrid -->
  
  
</head>
<body class="hold-transition">

 	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="content">
		<tiles:insertAttribute name="body"/>
		</div>
		<div id="footer">
		<tiles:insertAttribute name="footer"/>
		</div>
	</div>

<!-- REQUIRED SCRIPTS -->


<!-- jsGrid -->
<!-- <script src="admin/plugins/jsgrid/demos/db.js"></script> -->
<!-- <script src="admin/plugins/jsgrid/jsgrid.min.js"></script> -->
<!-- AdminLTE for demo purposes -->
<!-- <script src="admin/dist/js/demo.js"></script> -->
<!-- FLOT CHARTS -->
<script src="admin/plugins/flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="admin/plugins/flot/plugins/jquery.flot.resize.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="admin/plugins/flot/plugins/jquery.flot.pie.js"></script>
<!-- Page specific script -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>

<script>
$('body').addClass('layout-fixed');
</script>
<script>
// $(document).ready(function () {
//     $.ajax({
//         url: '/memberList', // 컨트롤러 엔드포인트 URL로 변경해야 합니다.
//         dataType: 'json',
//         success: function (data) {
//             console.log(data); // 데이터가 제대로 수신되었는지 확인하기 위해 콘솔에 출력

//             // jqGrid 설정
//             $("#memberGrid").jqGrid({
//                 datatype: "local", // 데이터를 로컬에서 가져오기
//                 data: data.memberList, // JSON 데이터 배열
//                 colNames: ['아이디', '이름', '비밀번호', '전화번호', '이메일', '나이', '성별'],
//                 colModel: [
//                     { label: 'member_id', name: 'member_id', key: true, index: 'member_id' },
//                     { label: '이름', name: 'name', index: 'name' },
//                     { label: '비밀번호', name: 'pwd', index: 'pwd' },
//                     { label: '전화번호', name: 'phone', index: 'phone' },
//                     { label: '이메일', name: 'email', index: 'email' },
//                     { label: '나이', name: 'age', index: 'age' },
//                     { label: '성별', name: 'gender', index: 'gender' }
//                 ],
//                 loadonce: true,
//                 viewrecords: true,
//                 height: 'auto',
//                 autowidth:true,
//                 rowNum: 30,
//                 rowList: [30, 50, 100],
//                 pager: '#Pager',
//                 pgtext: 'Page {0} of {1}',
//                 sortorder: 'desc',
//                 caption: '회원리스트',
//                 loadComplete: function (data) {
//                     var allRow = jQuery("#grid1").jqGrid('getGridParam', 'records');
//                     if (allRow == 0) {
//                         $("#grid1 > tbody").append("<tr><td align='center' colspan='10' style=''>조회된 데이터가 없습니다.</td></tr>");
//                     }

//                     var idArray = $("#grid1").jqGrid('getDataIDs');
//                     for (var i = 0; i < idArray.length; i++) {
//                         var ret = $("#grid1").getRowData(idArray[i]);
//                         if (ret.finish_yn != "N") {
//                             $("#jqg_grid_" + idArray[i]).attr("disabled", true);
//                         }
//                     }
//                 }
//             });
//         },
//         error: function (error) {
//             console.error("Error:", error);
//         }
//     });
// });
//   $(function () {
//     $("#jsGrid1").jsGrid({
//         height: "100%",
//         width: "100%",

//         sorting: true,
//         paging: true,

//         data: db.clients,
		
//         headerRowRenderer: function() {
//         	var $result = $("<tr>").height(0)
//         						   .append($("<th>").width(150))
//         						   .append($("<th>").width(50))
//         						   .append($("<th>").width(200))
//         						   .append($("<th>").width(100))
//         						   .append($("<th>").width(100))
//         						   .append($("<th>").width(50))
//         						   .append($("<th>").width(100));
//         						   $result = $result.add($("<tr>")
//         								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("아이디"))
//         								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("이름"))
//         								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("닉네임"))
//         								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("가입날짜"))
//         								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("접속날짜"))
//         								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("신고횟수"))
//         								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("상태")));
//         							return $result;
//         },
        
//         fields: [
//             { name: "Name", type: "text", width: 150 },
//             { name: "Age", type: "number", width: 50 },
//             { name: "Address", type: "text", width: 200 },
//             { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
//             { name: "Married", type: "checkbox", title: "Is Married" },
//             { name: "신고횟수", type: "text", width:50},
//             { name: "상태", type: "control", width: 100, editButton: false, deleteButton: false,
//                 itemTemplate: function(value, item) {
//                    var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);

//                    var $customEditButton = $("<button>").attr({class: "customGridEditbutton jsgrid-button jsgrid-cancel-button"})
//                      .click(function(e) {
//                        confirm("정지하시겠습니까?");
//                        e.stopPropagation();
//                      });

//                   var $customDeleteButton = $("<button>").attr({class: "customGridDeletebutton jsgrid-button jsgrid-update-button"})
//                    .click(function(e) {
//                      alert("Title: " + item.title);
//                      e.stopPropagation();
//                    });

//                    return $("<div>").append($customEditButton).append($customDeleteButton);
//                    //return $result.add($customButton);
//                },
//              }
//         ]
//     });
//   });
  
//   $(function () {
// 	    $("#jsGrid2").jsGrid({
// 	        height: "100%",
// 	        width: "100%",

// 	        sorting: true,
// 	        paging: true,

// 	        data: db.clients,
			
// 	        headerRowRenderer: function() {
// 	        	var $result = $("<tr>").height(0)
// 	        						   .append($("<th>").width(150))
// 	        						   .append($("<th>").width(50))
// 	        						   .append($("<th>").width(200))
// 	        						   .append($("<th>").width(100))
// 	        						   .append($("<th>").width(100))
// 	        						   .append($("<th>").width(50))
// 	        						   .append($("<th>").width(100));
// 	        						   $result = $result.add($("<tr>")
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("제목"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("아이디"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("닉네임"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("작성날짜"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("접속날짜"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("신고횟수"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("상태")));
// 	        							return $result;
// 	        },
	        
// 	        fields: [
// 	            { name: "Name", type: "text", width: 150 },
// 	            { name: "Age", type: "number", width: 50 },
// 	            { name: "Address", type: "text", width: 200 },
// 	            { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
// 	            { name: "Married", type: "checkbox", title: "Is Married" },
// 	            { name: "신고횟수", type: "text", width:50},
// 	            { name: "상태", type: "control", width: 100, editButton: false, deleteButton: false,
// 	                itemTemplate: function(value, item) {
// 	                   var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);

// 	                   var $customEditButton = $("<button>").attr({class: "customGridEditbutton jsgrid-button jsgrid-cancel-button"})
// 	                     .click(function(e) {
// 	                       confirm("삭제하시겠습니까?");
// 	                       e.stopPropagation();
// 	                     });

// 	                  var $customDeleteButton = $("<button>").attr({class: "customGridDeletebutton jsgrid-button jsgrid-update-button"})
// 	                   .click(function(e) {
// 	                     alert("Title: " + item.title);
// 	                     e.stopPropagation();
// 	                   });

// 	                   return $("<div>").append($customEditButton).append($customDeleteButton);
// 	                   //return $result.add($customButton);
// 	               },
// 	             }
// 	        ]
// 	    });
// 	  });
</script>
<script>
//   $(function () {
// 	    $("#jsGrid3").jsGrid({
// 	        height: "100%",
// 	        width: "100%",

// 	        sorting: true,
// 	        paging: true,

// 	        data: db.clients,
			
// 	        headerRowRenderer: function() {
// 	        	var $result = $("<tr>").height(0)
// 	        						   .append($("<th>").width(150))
// 	        						   .append($("<th>").width(50))
// 	        						   .append($("<th>").width(200))
// 	        						   .append($("<th>").width(100))
// 	        						   .append($("<th>").width(100))
// 	        						   .append($("<th>").width(100));
// 	        						   $result = $result.add($("<tr>")
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("제목"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("아이디"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("닉네임"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("작성날짜"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("접속날짜"))
// 	        								   			.append($("<th class='jsgrid-cell js-header'>").attr("rowspan",2).text("권한")));
// 	        							return $result;
// 	        },
	        
// 	        fields: [
// 	            { name: "Name", type: "text", width: 150 },
// 	            { name: "Age", type: "number", width: 50 },
// 	            { name: "Address", type: "text", width: 200 },
// 	            { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
// 	            { name: "Married", type: "checkbox", title: "Is Married" },
// 	            { name: "권한", type: "control", width: 100, editButton: false, deleteButton: false,
// 	                itemTemplate: function(value, item) {
// 	                   var $result = jsGrid.fields.control.prototype.itemTemplate.apply(this, arguments);

// 	                   var $customEditButton = $("<button>").attr({class: "customGridEditbutton jsgrid-button jsgrid-edit-button"})
// 	                     .click(function(e) {
// 	                       confirm("삭제하시겠습니까?");
// 	                       e.stopPropagation();
// 	                     });

// 	                  var $customDeleteButton = $("<button>").attr({class: "customGridDeletebutton jsgrid-button jsgrid-delete-button"})
// 	                   .click(function(e) {
// 	                     alert("Title: " + item.title);
// 	                     e.stopPropagation();
// 	                   });

// 	                   return $("<div>").append($customEditButton).append($customDeleteButton);
// 	                   //return $result.add($customButton);
// 	               },
// 	             }
// 	        ]
// 	    });
// 	  });
</script>

<script>
$(function(){
	  /** add active class and stay opened when selected */
	/** add active class and stay opened when selected */
	var url = window.location;

	// for sidebar menu entirely but not cover treeview
	$('ul.nav-sidebar a').filter(function() {
	    return this.href == url;
	}).addClass('active');

	// for treeview
	$('ul.nav-treeview a').filter(function() {
	    return this.href == url;
	}).parentsUntil(".nav-sidebar > .nav-treeview").addClass('menu-open').prev('a').addClass('active');
	  
	});

</script>

<script>
$(function(){
	$('html').removeClass('no-js');
});
</script>
</body>
</html>
