<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- Header -->
    <header>
    <!-- jQuery -->
<script src="admin/plugins/jquery/jquery.min.js"></script>
<script>
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
</script>
<script src="admin/js/loading-overlay.min.js"></script>
<!-- <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/redmond/jquery-ui.css" type="text/css" /> -->
 <!-- jqGrid CSS -->
<!-- <link rel="stylesheet" href="//cdn.jsdelivr.net/jqgrid/4.6.0/css/ui.jqgrid.css" type="text/css" /> -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/jqgrid/4.6.0/css/ui.jqgrid.css" type="text/css" />
<!-- <script src="admin/css/jquery-ui.css"></script> -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/redmond/jquery-ui.css" type="text/css" />

<script src="admin/js/i18n/grid.locale-kr.js" type="text/javascript"></script>

<script src="admin/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<!-- Bootstrap 4 -->
<script src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="admin/js/adminlte.min.js"></script>
	  <!-- Navbar -->
	  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
	    <!-- Left navbar links -->
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
	      </li>
	      <li class="nav-item d-none d-sm-inline-block">
	        <a href="/" class="nav-link">Home</a>
	      </li>
	    </ul>
	  </nav>
	  
	    <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="admin" class="brand-link d" style="text-align: center; align-items: center;">
      <img src="admin/img/LOGO.png" style="margin: auto; width: 200px;">
    </a>
    <!-- <a href="#" class="brand-link">
      <img src="dist/img/LOGO.png" alt="AdminLTE Logo" class="brand-image elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">"     "</span>
    </a> -->

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="admin/img/user.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">${principal.user.name}</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
              <li class="nav-item">
              <a href="admin" class="nav-link">
                <i class="nav-icon fas fa-chart-pie"></i>
                <p>
                  대시보드
                  <!-- <span class="right badge badge-danger">New</span> -->
                </p>
              </a>
            </li>
             <li class="nav-item">
              <a href="adminManage" class="nav-link">
                <i class="nav-icon fas fa-edit"></i>
                <p>
                  관리자 계정관리
                  <!-- <span class="right badge badge-danger">New</span> -->
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/adminMemberList" class="nav-link">
                <i class="nav-icon fas fa-user"></i>
                  <p> 회원관리</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/usList" class="nav-link">
                <i class="nav-icon fas fa-users"></i>
                  <p> 동행관리</p>
              </a>
            </li>
            <li class="nav-item">
            <a href="#" class="nav-link"><!--class="nav-link active">-->
              <i class="nav-icon fas fa-comments"></i>
              <p>
                고객센터 관리
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/noticeList" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>공지사항</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/11" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>1:1문의하기</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
    </div>
  </aside>
</header>

</body>
</html>