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
<script src="admin/js/demo.js"></script>
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
