<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="admin/plugins/jsgrid/jsgrid.css">
  <link rel="stylesheet" href="admin/plugins/jsgrid/jsgrid-theme.min.css">
</head>
<body>

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
    <section class="content">
<!--       <div class="card"> -->
<!-- <!--         <div class="card-header"> --> -->
<!-- <!--           <h3 class="card-title">회원관리</h3> --> -->
<!-- <!--         </div> --> -->
<!--         /.card-header -->
<!--         <div class="card-body"> -->
<!--           <div id="jsGrid1" style=text-align:center;> -->
<!--           </div> -->
<!--         </div> -->
<!--         /.card-body -->
<!--       </div> -->
      <!-- /.card -->
      
            <table>
          <thead>
                <tr>
                    <th>제목 </th>
                    <th>내용 </th>
                </tr>
          </thead>
          <tbody>
              <tr th:each="member : ${memberList}">
                  <td th:text="${member.memberid}">1</td>
<!--                   <td> -->
<%--                       <a th:text="${member.name}" th:href="@{/board/view(id=${board.id})}"></a> --%>
<!--                   </td> -->
              </tr>
          </tbody>
      </table>
    </section>
    <!-- /.content -->
  </div>


</body>
</html>